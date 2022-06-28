<%-- 
    Document   : view
    Created on : Jun 28, 2022, 10:12:31 AM
    Author     : Mountain
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance taking - View</title>
    </head>
    <body>
        <form action="view" method="POST">
            Lecturer: <select name="instructor">
                <c:forEach items="${requestScope.ins}" var="i">
                    <option value="${i.insID}">${i.insName}</option>
                </c:forEach>
            </select><br/>
            From: <input type="date" name="fromdate"/>
            To: <input type="date" name="todate"/><br/>
            <input type="submit" value="Send"/>
        </form>
        <c:if test="${requestScope.lessons ne null}">
            <table>
                <tr>
                    <th>Time</th>
                        <c:forEach items="${requestScope.dates}" var="d">
                        <th>${d}</th>
                        </c:forEach>
                </tr>
                <c:forEach items="${requestScope.timeslots}" var="t">
                    <tr>
                        <td>Slot ${t.timeID}</td>
                        <c:forEach  items="${requestScope.dates}" var="d">
                            <c:set var="exist" value="false"/>
                            <c:forEach items="${requestScope.lessons}" var="l">
                                <c:if test="${(l.lessonDate eq d) and (l.time.timeID eq t.timeID)}">
                                    <c:set var="exist" value="true"/>
                                    <td>${l.group.course.courseName} - at ${l.room.roomPlace}</td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${not exist}">
                                <td></td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
