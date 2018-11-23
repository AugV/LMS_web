<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Completed tasks</title>
</head>
<body>
<h2>Completed tasks</h2>
<h3>Task: ${selectedTaskname}</h3>
<table style="border: 1px solid;">
    <tr>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Owner</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Answer</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Submission date</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Grade</th>
        <th style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">Grade date</th>
    </tr>
    <c:forEach var="completedTask" items="${completedTaskList}">
        <tr>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${completedTask.owner.surname}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${completedTask.answer}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${completedTask.submissionDate}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${completedTask.grade}</td>
            <td style="border-left: 2px solid #cdd0d4;border-bottom: 2px solid #cdd0d4;">${completedTask.gradeDate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>