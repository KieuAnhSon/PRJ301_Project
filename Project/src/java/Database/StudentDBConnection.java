/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mountain
 */
public class StudentDBConnection extends DBConnection<Student> {

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Student> listByLessonID(int lessonID) {
        ArrayList<Student> stuList = new ArrayList<>();
        try {
            String sql = "SELECT s.[StudentID]\n"
                    + "      ,[StudentName]\n"
                    + "  FROM [dbo].[Student] s\n"
                    + "  inner join [StudentInGroup] sig on s.StudentID = sig.StudentID\n"
                    + "  inner join [Group] g on sig.GroupID = g.GroupID\n"
                    + "  inner join [Lesson] l on l.[GroupID] = g.[GroupID]\n"
                    + "  where l.[LessonID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getNString("StudentName"));
                stuList.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stuList;
    }
}
