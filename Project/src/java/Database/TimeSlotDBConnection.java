/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.TimeSlot;
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
public class TimeSlotDBConnection extends DBConnection<TimeSlot> {
    
    @Override
    public ArrayList<TimeSlot> list() {
        ArrayList<TimeSlot> timeslot = new ArrayList<>();
        try {            
            String sql = "SELECT [TimeID]\n"
                    + "      ,[TimeBegin]\n"
                    + "      ,[TimeEnd]\n"
                    + "  FROM [TimeSlot]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                TimeSlot t = new TimeSlot();
                t.setTimeID(rs.getInt("TimeID"));
                t.setTimeStart(rs.getTime("TimeBegin"));
                t.setTimeEnd(rs.getTime("TimeEnd"));
                timeslot.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return timeslot;
    }
    
    @Override
    public void update(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void create(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public void delete(TimeSlot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    @Override
    public TimeSlot get() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
