<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="realEstateAgentClasses.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="error.jsp" %>
<%
   PreparedStatement stmt = null;
   ResultSet rs = null;
   String sql;
   String[] pics = new String[10];
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
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile">
         <div class="container">
            <div class="preview col-md-7">
               <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" style=" width:100%; height: 450px !important;">
                     <%
                        try{
                            sql = "select picPath from housePictures where house = ?;";
                            stmt = con.prepareStatement(sql); //initialize stmt
                            stmt.setString(1, request.getParameter("hid"));
                            rs = stmt.executeQuery();
                            if (!rs.next()) {
                                for (int i = 0; i < 5; i++){
                                    pics[i] = "src = 'images/noPhotoAvailable.jpg'";
                                }
                            } else {
                                int i = 0;
                                pics[i] = rs.getString("picPath");
                                %> 
                                  <div class='item active'>
                                    <img src=' <%= pics[i++] %> ' alt="House picture" style="width:100% width:100%; height: 500px;">
                                  </div>
                            <%  while (rs.next()) { 
                                  pics[i] = rs.getString("picPath");
                                  %> 
                                  <div class='item <% if(i==0)out.print("active"); %>'>
                                    <img src=' <%= pics[i++] %> ' alt="House picture" style="width:100%;">
                                  </div>
                             <% }
                            }
                        } finally {
                        stmt = null;
                        rs = null;
                        } %>
                  </div>
                  <!-- Left and right controls -->
                  <% if (pics[1] != "src = 'images/noPhotoAvailable.jpg'" && pics[1] != null) { %>
	                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	                  <span class="glyphicon glyphicon-chevron-left"></span>
	                  <span class="sr-only">Previous</span>
	                  </a>
	                  <a class="right carousel-control" href="#myCarousel" data-slide="next">
	                  <span class="glyphicon glyphicon-chevron-right"></span>
	                  <span class="sr-only">Next</span>
	                  </a>
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1"></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                     <li data-target="#myCarousel" data-slide-to="3"></li>
                     <li data-target="#myCarousel" data-slide-to="4"></li>
                  </ol>
	               <% } %>
               </div>
            </div>
            <div class="details col-md-5">
               <% 
                  sql = "Select title, sqm, price, descriptionHouse from listing where houseid = ?;";
                  try {
                      stmt = con.prepareStatement(sql);
                      stmt.setString(1, request.getParameter("hid"));
                      rs = stmt.executeQuery();
                      rs.next();
                  %>
               <div class="page-header">
                  <% if (session.getAttribute("user") != null && ((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
                  <a class="btn btn-danger" href='deleteListing.jsp?hid=<%=request.getParameter("hid")%>' role="button">Διαγραφή αγγελίας!</a>
                  <% } %>
                  <h1> <%=rs.getString("title") %> <small> <%=rs.getString("sqm") %> τ.μ.</small> 
                     <span class="badge"> <%=rs.getString("price") %> &euro;</span>
                  </h1>
               </div>
               <div class="media">
                  <div class="media-body">
                     <h4 class="media-heading"> Περιγραφή </h4>
                     <p><%=rs.getString("descriptionHouse") %></p>
                  </div>
               </div>
               <%
                  }catch(Exception e) {
                              out.print(e.getMessage());
                  }finally {
                      stmt = null;
                      rs = null;
                  }
                  %>
               <br>
               <% if (session.getAttribute("user") == null || !((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
               <div class="flexbox">
                  <a href="favouriteHandling.jsp?hid=<%=request.getParameter("hid")%>" class="btn danger glyphicon glyphicon-heart" role="button">
                    <strong> Προσθήκη στα Αγαπημένα </strong>
                  </a>
               </div>
               <br>
               <div class="flexbox">
                  <a href="contact.jsp?hid=<%=request.getParameter("hid")%>" class="btn info glyphicon glyphicon-envelope" role="button">
                    <strong> Αίτηση επίσκεψης ακινήτου </strong>
                  </a>
               </div>
               <% } %>
            </div>
         </div>
         <br>
         <div class="row">
            <div class="col-md-8 col-sm-12">
               <h4> Χαρακτηριστικά Ακινήτου</h4>
               <div class="table-responsive">
                  <table id="product-details" class="table table-bordered table-hover">
                     <%
                        sql = "Select area, floor, sqm, bedrooms, bathrooms, floortiles, constructionDate, heating, balcony, elevator, renovated, furnished from listing where houseid = ?";
                        try { 
                            stmt = con.prepareStatement(sql);
                            stmt.setString(1,  request.getParameter("hid"));
                            rs = stmt.executeQuery();
                            rs.next();
                            Map map = new HashMap(); 
                            map.put(true, "Ναι");
                            map.put(false, "Όχι");
                            %>
                     <tr>
                        <th>Περιοχή</th>
                        <td><%=rs.getString("area") %></td>
                     </tr>
                     <tr>
                        <th>Όροφος</th>
                        <td><%=rs.getString("floor") %></td>
                     </tr>
                     <tr>
                        <th>Τετραγωνικά μέτρα</th>
                        <td><%=rs.getString("sqm") %></td>
                     </tr>
                     <tr>
                        <th>Υπνοδωμάτια</th>
                        <td><%=rs.getString("bedrooms") %></td>
                     </tr>
                     <tr>
                        <th>Μπάνια</th>
                        <td><%=rs.getString("bathrooms") %></td>
                     </tr>
                     <tr>
                        <th>Δάπεδο</th>
                        <td><%=rs.getString("floortiles") %></td>
                     </tr>
                     <tr>
                        <th>Έτος Κτήσης</th>
                        <td><%=rs.getString("constructionDate")%></td>
                     </tr>
                     <tr>
                        <th>Θέρμανση</th>
                        <td><%=rs.getString("heating") %></td>
                     </tr>
                     <tr>
                        <th>Διαθέτει μπαλκόνι</th>
                        <td><%=map.get(rs.getBoolean("balcony"))%></td>
                     </tr>
                     <tr>
                        <th>Πολυκατοικία διαθέτει ασανσέρ</th>
                        <td><%=map.get(rs.getBoolean("elevator"))%></td>
                     </tr>
                     <tr>
                        <th>Επιπλωμένο</th>
                        <td><%=map.get(rs.getBoolean("furnished"))%></td>
                     </tr>
                     <tr>
                        <th>Πρόσφατη ανακαίνηση</th>
                        <td><%=map.get(rs.getBoolean("renovated"))%></td>
                     </tr>
                     <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                        
                            stmt.close();
                            rs.close();
                            con.close();
                            }
                        %>
                  </table>
               </div>
            </div>
         </div>
      </div>
      <!-- /.container -->
      <%@ include file="pageEnd.jsp"%>
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
   </body>
</html>