<%-- 
    Document   : take_today
    Created on : Jul 15, 2022, 3:03:12 PM
    Author     : Mountain
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/viewing.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="take_today" method="POST">
            Instructor: <select name="instructor">
                <c:forEach items="${requestScope.instructors}" var="i">
                    <option value="${i.insID}" <c:if test="${param.instructor eq i.insID}"> selected="selected" </c:if>>${i.insName}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Send">
        </form>
        <c:if test="${requestScope.lessons ne null}">
            <table>
                <tr>
                    <th>Slot</th>
                    <th>Course</th>
                    <th>Group</th>
                    <th>Action</th>
                </tr>
                <c:set var="index" value="${1}"></c:set>
                <c:forEach items="${requestScope.lessons}" var="l">
                    <tr>
                        <td>${l.time.timeID}</td>
                        <td>${l.group.course.courseName}</td>
                        <td>${l.group.groupName}</td>
                        <td><c:if test="${l.checked eq true}">
                                <form action="attend" method="POST" id="attend_${l.lessonID}">
                                    <input type="hidden" name="lessonID" value="${l.lessonID}">
                                    <input type="hidden" name="status" value="${l.checked}">
                                    <a href="#" onclick="document.getElementById('attend_${l.lessonID}').submit()">Update</a>
                                </form>
                            </c:if>
                            <c:if test="${l.checked eq false}">
                                <form action="attend" method="POST" id="attend_${l.lessonID}">
                                    <input type="hidden" name="lessonID" value="${l.lessonID}">
                                    <input type="hidden" name="status" value="${l.checked}">
                                    <a href="#" onclick="document.getElementById('attend_${l.lessonID}').submit()">Take</a>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${requestScope.lessons eq null}">
            No lessons today.
        </c:if>
    </body>
</html>
