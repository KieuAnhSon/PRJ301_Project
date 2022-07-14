/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Servlet;

import Database.AttendanceDBConnection;
import Database.LessonDBConnection;
import Model.Attendance;
import Model.Lesson;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Mountain
 */
public class AttendanceInsertServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AttendanceInsertServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceInsertServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        String[] indexs = request.getParameterValues("index");
        ArrayList<Attendance> attendList = new ArrayList<>();
        AttendanceDBConnection attendDB = new AttendanceDBConnection();
        for (String index : indexs) {
            Attendance a = new Attendance();
            Student s = new Student();
            s.setId(Integer.parseInt(request.getParameter("id_"+index)));
            s.setName(request.getParameter("name_"+index));
            a.setStudent(s);
            a.setStatus(Boolean.parseBoolean(request.getParameter("status_"+index)));
            Lesson l = new Lesson();
            l.setLessonID(lessonID);
            a.setLesson(l);
            String raw_comment = request.getParameter("comment_" + index);
            a.setComment(raw_comment != null ? raw_comment : null);
            a.setRecordTime(java.sql.Date.valueOf(LocalDate.now()));
            attendList.add(a);
        }
        attendDB.insertByList(attendList);
        LessonDBConnection lessonDB = new LessonDBConnection();
        lessonDB.updateAttendanceStatus(lessonID);
        request.setAttribute("status", "taken");
        request.getRequestDispatcher("jsp/report.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
