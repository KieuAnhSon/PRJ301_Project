/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Course;
import Model.Group;
import Model.Instructor;
import Model.Lesson;
import Model.Room;
import Model.TimeSlot;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mountain
 */
public class LessonDBConnection extends DBConnection<Lesson> {

    @Override
    public void update(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Lesson> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Lesson> listByCondition(int insID, Date fromDate, Date toDate) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        try {
            String sql = "Select LessonID,LessonName,LessonNo,LessonDate,Checked\n"
                    + ",TimeSlot.TimeID,TimeBegin,TimeEnd,Lesson.RoomID,RoomPlace\n"
                    + ",InstructorName,[Group].GroupID,[Group].GroupName,Course.CourseID,CourseName from Lesson\n"
                    + "inner join TimeSlot on Lesson.TimeID = TimeSlot.TimeID\n"
                    + "inner Join Room on Lesson.RoomID = Room.RoomID\n"
                    + "inner join Instructor on Lesson.InstructorID = Instructor.InstructorID\n"
                    + "inner join [Group] on Lesson.GroupID = [Group].GroupID\n"
                    + "inner join Course on [Group].CourseID = Course.CourseID\n"
                    + "where (Instructor.InstructorID = ?) and (LessonDate between ? and ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, insID);
            stm.setDate(2, fromDate);
            stm.setDate(3, toDate);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setLessonID(rs.getInt("LessonID"));
                l.setLessonName(rs.getNString("LessonName"));
                l.setLessonDate(rs.getDate("LessonDate"));
                l.setLessonNo(rs.getInt("LessonNo"));
                l.setChecked(rs.getBoolean("Checked"));
                TimeSlot t = new TimeSlot();
                t.setTimeID(rs.getInt("TimeID"));
                t.setTimeStart(rs.getTime("TimeBegin"));
                t.setTimeEnd(rs.getTime("TimeEnd"));
                l.setTime(t);
                Room r = new Room();
                r.setRoomID(rs.getNString("RoomID"));
                r.setRoomPlace(rs.getNString("RoomPlace"));
                l.setRoom(r);
                Instructor i = new Instructor();
                i.setInsID(insID);
                i.setInsName(rs.getNString("InstructorName"));
                l.setIns(i);
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getNString("GroupName"));
                Course c = new Course();
                c.setCourseID(rs.getNString("CourseID"));
                c.setCourseName(rs.getNString("CourseName"));
                g.setCourse(c);
                l.setGroup(g);
                lessons.add(l);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessons;
    }

    public void updateAttendanceStatus(int lessonID) {
        try {
            String sql = "UPDATE [Lesson]\n"
                    + "   SET [Checked] = 1\n"
                    + " WHERE [Lesson].[LessonID] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonID);
            stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lesson get() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
