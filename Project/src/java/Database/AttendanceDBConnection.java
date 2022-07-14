/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Attendance;
import Model.Lesson;
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
public class AttendanceDBConnection extends DBConnection<Attendance> {

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Attendance> listByLessonID(int lessonID) {
        ArrayList<Attendance> attend = new ArrayList<>();
        try {
            String sql = "SELECT [StudentID]\n"
                    + "      ,[LessonID]\n"
                    + "      ,[StudentName]\n"
                    + "      ,[AttendanceStatus]\n"
                    + "      ,[Comment]\n"
                    + "      ,[RecordTime]\n"
                    + "  FROM [Attendance]\n"
                    + "  where [Attendance].[LessonID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Student s = new Student();
                s.setId(rs.getInt("StudentID"));
                s.setName(rs.getNString("StudentName"));
                a.setStudent(s);
                Lesson l = new Lesson();
                l.setLessonID(lessonID);
                a.setLesson(l);
                a.setStatus(rs.getBoolean("AttendanceStatus"));
                a.setComment(rs.getNString("Comment"));
                a.setRecordTime(rs.getTimestamp("RecordTime"));
                attend.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attend;
    }

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertByList(ArrayList<Attendance> lists) {
        for (Attendance list : lists) {
            try {
                String sql = "INSERT INTO [Attendance]\n"
                        + "           ([StudentID]\n"
                        + "           ,[LessonID]\n"
                        + "           ,[StudentName]\n"
                        + "           ,[AttendanceStatus]\n"
                        + "           ,[Comment]\n"
                        + "           ,[RecordTime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, list.getStudent().getId());
                stm.setInt(2, list.getLesson().getLessonID());
                stm.setString(3, list.getStudent().getName());
                stm.setBoolean(4, list.isStatus());
                stm.setString(5, list.getComment());
                stm.setTimestamp(6, list.getRecordTime());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateByList(ArrayList<Attendance> lists) {
        for (Attendance list : lists) {
            try {
                String sql = "UPDATE [Attendance]\n"
                        + "   SET [AttendanceStatus] = ?\n"
                        + "      ,[Comment] = ?\n"
                        + "      ,[RecordTime] = ?\n"
                        + " WHERE [Attendance].[StudentID] = ? and [Attendance].[LessonID] = ?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setBoolean(1, list.isStatus());
                stm.setString(2, list.getComment());
                stm.setTimestamp(3, list.getRecordTime());
                stm.setInt(4, list.getStudent().getId());
                stm.setInt(5, list.getLesson().getLessonID());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
