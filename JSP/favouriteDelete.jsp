<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="realEstateAgentClasses.DB" %>
<%@ page import="realEstateAgentClasses.User" %>
<%@page import="java.sql.*"%>
<%

  User user = (User) session.getAttribute("user");
  int userid = user.getUserid();

   PreparedStatement stmt = null;
   String sql;
   Connection con = null;
   DB database = null;
   
   try {
       database = new DB();
       con = database.getConnection();

       String query = "delete from favourites where houseid = ? and userid = ?";

       stmt = con.prepareStatement(query);

       stmt.setInt(1, Integer.parseInt(request.getParameter("hid")));
       stmt.setInt(2, userid);
       
       stmt.executeUpdate();

   } catch(ClassNotFoundException e) {
       e.printStackTrace();
   } finally {
   		stmt.close();
   		database.close();
	}
%>
<jsp:forward page='profile.jsp' />
