/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Database.InstructorDBConnection;
import Database.LessonDBConnection;
import Model.Instructor;
import Model.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

/**
 *
 * @author Mountain
 */
public class AttendanceTakeTodayServlet extends HttpServlet {

    InstructorDBConnection insDB = new InstructorDBConnection();
    ArrayList<Instructor> ins = insDB.list();

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
            out.println("<title>Servlet AttendanceTakeTodayServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceTakeTodayServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        request.setAttribute("instructors", ins);
        request.getRequestDispatcher("jsp/take_today.jsp").forward(request, response);
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
        //processRequest(request, response);
        Calendar cal = Calendar.getInstance();
        //cal.set(2022, 4, 10);
        Date currentDate = cal.getTime();
        int insID = Integer.parseInt(request.getParameter("instructor"));
        LessonDBConnection lesDB = new LessonDBConnection();
        ArrayList<Lesson> lessons = lesDB.getListToday(insID, new java.sql.Date(currentDate.getTime()));
        Collections.sort(lessons, (o1, o2) -> {
            return o1.getTime().getTimeID() - o2.getTime().getTimeID();
        });
        //request.setAttribute(string, cal);
        request.setAttribute("lessons", lessons);
        request.setAttribute("instructors", ins);
        request.getRequestDispatcher("jsp/take_today.jsp").forward(request, response);
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
