
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Selected Task</title>
</head>
<body>
<h2>${taskName}</h2>
<h3>${taskCondition}</h3>
<h3>${taskDeadline}</h3>
<h3>${taskPoints}</h3>

<h3>Post answer</h3>
<form action="/completedTasks" method="POST">
    <input type="text" name="answer">
    <input type="submit" name="Submit answer">
</form>

</body>
</html>