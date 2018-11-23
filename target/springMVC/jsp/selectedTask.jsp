
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Selected Task</title>
</head>
<body>
<h2>Task: ${taskName}</h2><br>
<h3>Condition: ${taskCondition}</h3><br>
<h3>DeadLine: ${taskDeadline}</h3><br>
<h3>Points: ${taskPoints}</h3><br>

<h3>Post answer</h3>
<form action="/completedTasks" method="POST">
    <input type="text" name="answer">
    <input type="submit" name="Submit answer">
</form>

</body>
</html>