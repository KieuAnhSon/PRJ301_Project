/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Attendance;
import java.sql.PreparedStatement;
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

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void updateByList(ArrayList<Attendance> lists) {
        for (Attendance list : lists) {
            try {
                String sql = "INSERT INTO [dbo].[Attendance]\n"
                        + "           ([StudentID]\n"
                        + "           ,[LessonID]\n"
                        + "           ,[AttendanceStatus]\n"
                        + "           ,[Comment]\n"
                        + "           ,[RecordTime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, list.getStudentID());
                stm.setInt(2, list.getLesson().getLessonID());
                stm.setBoolean(3, list.isStatus());
                stm.setString(4, list.getComment());
                stm.setDate(5, list.getRecordTime());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
