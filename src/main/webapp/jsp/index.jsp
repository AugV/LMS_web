<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:c="http://java.sun.com/jstl/core">
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>

<form action ="/courses" method="POST">
    Student id:<br>
    <input type="text" name="studentId"><br>
    Password: <br>
    <input type="password" name="studentPsw"><br>
    <input type="submit" value="Login">
</form>

<h6>*psw is same as ID</h6><br>
<h2>Student list</h2>
<table style="border: 1px solid;">
    <tr>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Id</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Name</th>
    </tr>
    <c:forEach var="student" items="${students}">
        <tr>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${student.id}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${student.name}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${student.surname}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
