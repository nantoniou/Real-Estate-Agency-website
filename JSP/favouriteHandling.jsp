<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page import="realEstateAgentClasses.UserDAO" %>

<%
if(session.getAttribute("user") == null) { %>
	<jsp:forward page='register.jsp' />
<% }
User user = (User)session.getAttribute("user");
UserDAO userhandling = new UserDAO();
userhandling.addToFavourites(user, Integer.parseInt(request.getParameter("hid")));
%>
<jsp:forward page='profile.jsp' />