<%-- 
    Document   : status_confirm
    Created on : Jul 14, 2022, 1:02:15 PM
    Author     : Mountain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance taking</title>
        <script>
            var count = 5;
            function countdown() {
                count--;
                document.getElementById("timer").innerHTML = count;
                if (count <= 0)
                    window.location.href = 'index.html';
            }
            setInterval(countdown, 1000);
        </script>
    </head>
    <body>
        Attendance has been ${requestScope.status}.
        Will redirect to main page after <span id="timer">5</span>...
    </body>
</html>
