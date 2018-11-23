<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Courses</title>
</head>
<body>
<h2>Your Courses</h2>
<h3>Enter course number</h3>
<form action="/tasks" method="POST">
    <input type="text" name="courseId"><br>
    <input type="submit" name="Submit">
</form>

<h3>Course list</h3>
<table style="border: 1px solid;">
    <tr>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Id</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Name</th>
    </tr>
    <c:forEach var="course" items="${courseList}">
        <tr>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${course.id}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${course.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
