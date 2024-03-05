<%@ page import="java.util.Calendar" %>
<%
    String name = "Ziyan-301133339";
    Calendar cal = Calendar.getInstance();
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    String greeting;
    if (hour < 12) {
        greeting = "Good morning, " + name + ", Welcome to COMP367";
    } else {
        greeting = "Good afternoon, " + name + ", Welcome to COMP367";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1><%= greeting %></h1>
</body>
</html>
