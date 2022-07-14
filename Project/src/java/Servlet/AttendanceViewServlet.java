/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Database.InstructorDBConnection;
import Database.LessonDBConnection;
import Database.TimeSlotDBConnection;
import Model.Instructor;
import Model.Lesson;
import Model.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Mountain
 */
public class AttendanceViewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AttendanceViewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceViewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //       processRequest(request, response);
        InstructorDBConnection insDB = new InstructorDBConnection();
        ArrayList<Instructor> ins = insDB.list();
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.clear(Calendar.MINUTE);
        cal.clear(Calendar.SECOND);
        cal.clear(Calendar.MILLISECOND);
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        Date fromDatesql = new Date(cal.getTimeInMillis());
        cal.add(Calendar.DAY_OF_WEEK, 6);
        Date toDatesql = new Date(cal.getTimeInMillis());
        request.setAttribute("ins", ins);
        request.setAttribute("fromdate", fromDatesql);
        request.setAttribute("todate", toDatesql);
        request.getRequestDispatcher("jsp/view.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //     processRequest(request, response);
        InstructorDBConnection insDB = new InstructorDBConnection();
        ArrayList<Instructor> ins = insDB.list();
        int insID = Integer.parseInt(request.getParameter("instructor"));
        Date fromDate = Date.valueOf(request.getParameter("fromdate"));
        Date toDate = Date.valueOf(request.getParameter("todate"));
        if (fromDate.compareTo(toDate) > 0) {
            Date temp = toDate;
            toDate = fromDate;
            fromDate = temp;
        }
        Date begin = fromDate;
        ArrayList<Date> dates = new ArrayList<>();
        while (begin.compareTo(toDate) <= 0) {
            dates.add(begin);
            LocalDate nextDay = begin.toLocalDate().plusDays(1);
            begin = Date.valueOf(nextDay);
        }
        LessonDBConnection lesDB = new LessonDBConnection();
        ArrayList<Lesson> lessons = lesDB.listByCondition(insID, fromDate, toDate);
        TimeSlotDBConnection timeDB = new TimeSlotDBConnection();
        ArrayList<TimeSlot> timeslot = timeDB.list();
        request.setAttribute("dates", dates);
        request.setAttribute("timeslots", timeslot);
        request.setAttribute("fromdate", fromDate);
        request.setAttribute("todate", toDate);
        request.setAttribute("lessons", lessons);
        request.setAttribute("ins", ins);
        request.getRequestDispatcher("jsp/view.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
