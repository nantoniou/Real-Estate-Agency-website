<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="realEstateAgentClasses.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" %>


<%
if (session.getAttribute("user") == null || !((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
  <jsp:forward page='index.jsp' />
<% }

   PreparedStatement stmt = null;
   ResultSet rs = null;
   String sql;
   Connection con = null;
   
   try{
       DB database = new DB();
       con = database.getConnection();
   } catch(ClassNotFoundException e) {
       e.printStackTrace();
   }
   %>

<!DOCTYPE html>
<html lang="el">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Real Estate Agency</title>
      <link rel="stylesheet" href="css/Details.css">

      <!-- Bootstrap core CSS -->
      <link rel="stylesheet" href="css/bootstrap.min.css">    
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
      <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
      <link rel="stylesheet" href="css/theme.css">
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile">
            <div class="col-md-12 content">
               <div class="panel panel-default">
                   <div class="panel-heading">
                           <header> <h3> Εισερχόμενο Μήνυμα </h3></header>
                     <table class="table table-condensed">
                    <tbody>
                  <% 
                     sql = "Select fname, lname, email, topic, message, timeofcontact from messages where messageID = ?;";
                     try {
                         stmt = con.prepareStatement(sql); //initialize stmt
                               stmt.setString(1, request.getParameter("messageID"));
                               rs = stmt.executeQuery();
                         while (rs.next()) {
                     %>
                        <td><strong>Από: <%=rs.getString("fname") %> <%=rs.getString("lname") %></strong> (<%=rs.getString("email") %>) </td>
                        <td><strong>Με Θέμα: <%=rs.getString("topic") %></strong></td>
                        <td><strong>Στάλθηκε στις: <%=rs.getTimestamp("timeofcontact") %></strong></td>

                    </tbody>
                    <br>
                  </table>
                   </div>     
                        <div class="panel-body">
                              <div class="col-md-12" align="center">  
                                    <div class="well">
                                       <h4><span>Περιεχόμενο Μηνύματος</span></h4>   
                                       <hr width="50%" align="center" style="border-top: 1px solid #999;">
                                          <p>
                                             <%=rs.getString("message")%>
                                          </p>
                                    </div>
                              </div>
                             <div align="center" style='margin-bottom:10px;'>
                                 <a class="btn btn-success" href="mailto:<%=rs.getString("email")%>" role="button" align="center">Απάντηση</a>
                              <br> 
                           </div>
                        </div>
               </div>

                 
                  <%
                     }} catch (Exception e) {
                         e.printStackTrace();
                     } finally {
                     
                         stmt.close();
                         rs.close();
                         con.close();
                         }
                     %>
      </div>
    </div>
  <%@ include file="pageEnd.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</body>
</html>