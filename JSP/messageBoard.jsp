<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.*" %>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
      <link rel="stylesheet" href="css/Profile.css">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
      <link rel="stylesheet" href="css/theme.css">
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile">
            <div class="col-md-10 content">
               <div class="panel panel-default">
                   <div class="panel-heading">
                        <header> <h3> Μηνύματα </h3></header>
                    </div>
                <div class="panel-body">
                  <div class="row">
                   <table class="table table-condensed table-hover">
                     <thead>
                       <tr>
                         <th class="span1"></th>
                         <th class="span6">Όνομα Πελάτη</th> 
                         <th class="span7">Θεματολογία</th>
                         <th class="span4">Ημερομηνία</th>
                       </tr>
                     </thead>
                     <tbody>
                   <% 
                      sql = "Select messageID, fname, lname, topic, timeofcontact from messages;";
                      try {
                          stmt = con.prepareStatement(sql);
                          rs = stmt.executeQuery();
                          while (rs.next()) {
                      %>
                       <tr>
                         <td></td>
                         <td>
                         <strong><%=rs.getString("fname") %> <%=rs.getString("lname") %></strong></td>
                         <td>
                            <a href="messageDetails.jsp?messageID=<%=rs.getInt("messageID")%>">
                              <strong><%=rs.getString("topic") %></strong>
                            </a>
                          </td>
                         <td><strong><%=rs.getTimestamp("timeofcontact") %></strong></td>
                       </tr>
                       
                   <%
                      }} catch (Exception e) {
                          e.printStackTrace();
                      } finally {
                      
                          stmt.close();
                          rs.close();
                          con.close();
                          }
                      %>

                </tbody>
              </table>
        </div>
      </div>
      </div>
    </div>
  </div>
  <%@ include file="pageEnd.jsp"%>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</body>
</html>