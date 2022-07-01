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
        <link href="css/viewing.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form action="view" method="POST">
            Lecturer: <select name="instructor">
                <c:forEach items="${requestScope.ins}" var="i">
                    <option 
                        <c:if test="${param.instructor eq i.insID}">
                            selected="selected"
                        </c:if>
                        value="${i.insID}">${i.insName}</option>
                </c:forEach>
            </select><br/>
            From: <input type="date" name="fromdate"
                         <c:if test="${requestScope.fromdate ne null}"> 
                             value="${requestScope.fromdate}"
                         </c:if>
                         />
            To: <input type="date" name="todate" 
                       <c:if test="${requestScope.todate ne null}"> 
                           value="${requestScope.todate}"
                       </c:if>
                       /><br/>
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
                        <c:forEach items="${requestScope.dates}" var="d">
                            <c:set var="exist" value="false"/>
                            <c:forEach items="${requestScope.lessons}" var="l">
                                <c:if test="${(l.lessonDate eq d) and (l.time.timeID eq t.timeID)}">
                                    <c:set var="exist" value="true"/>
                                    <td>${l.group.course.courseName} </br> at ${l.room.roomPlace} </br> 
                                        (${l.time.timeStart} - ${l.time.timeEnd})</br>
                                        <c:if test="${l.checked eq false}">
                                            <div style="color: red;">
                                                (Not yet)
                                            </div>
                                            <div>Take</div>
                                        </c:if>
                                        <c:if test="${l.checked eq true}">
                                            <div style="color: green;">
                                                (Attended)
                                            </div>
                                            <div>Update</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${not exist}">
                                <td> - </td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
