<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page import="realEstateAgentClasses.UserDAO" %>
<%@ page errorPage="error.jsp" %>
<% 
String username = request.getParameter("username_login");
String password = request.getParameter("password_login");
UserDAO userHandling = new UserDAO();
try {
	userHandling.authenticate(username, password);
} catch(Exception e) {
    session.setAttribute("errorHeader", "Σύνδεση ανεπιτυχής" );
    session.setAttribute("errors", new StringBuilder("<li> Λανθασμένο όνομα χρήστη ή κωδικος. </li>"));
    session.setAttribute("errorType", "danger" );

%>
	<jsp:forward page="register.jsp" /> <%
}

User user = userHandling.findUser(username);
session.setAttribute("user", user);
%>
<jsp:forward page="index.jsp" />