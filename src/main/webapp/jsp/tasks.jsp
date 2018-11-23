<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tasks</title>
</head>
<body>
<h2>'${selectedCourse.name}' tasks</h2>
<h3>Enter task number</h3>
<form action="/selectedTask" method="POST">
    <input type="text" name="taskId"><br>
    <input type="submit" name="Submit">
</form>

<h3>Task list</h3>
<table style="border: 1px solid;">
    <tr>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Id</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Name</th>
    </tr>
    <c:forEach var="task" items="${taskList}">
        <tr>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${task.id}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${task.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
