<%-- 
    Document   : take
    Created on : Jul 11, 2022, 12:14:40 PM
    Author     : Mountain
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance taking - Take</title>
    </head>
    <body>
        <c:set var="index" value="${1}"></c:set>
            <form action=insert" method="POST">
                <input type="hidden" name="lessonID" value="${requestScope.lessonID}"/>
                <table>
                    <tr>
                        <th>No</th>
                        <th>Full Name</th>
                        <th>Status</th>
                        <th>Comment</th>
                    </tr>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <input type="hidden" name="id_${index}" value="${s.id}"/>
                        <td><input type="hidden" name="index" value="${index}"/>${index}</td>
                        <td><input type="hidden" name="name_${index}" value="${s.name}">${s.name}</td>
                        <td><input type="radio" checked="checked" name="status_${index}" value="false"/> Absent <input type="radio" name="status_${index}" value="true"/> Present</td>
                        <td><input type="text" name="comment_${index}" value="${null}"></td>
                    </tr>
                    <c:set var="index" value="${index+1}"></c:set>
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
