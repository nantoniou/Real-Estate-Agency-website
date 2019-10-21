<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="realEstateAgentClasses.DB" %>
<%@ page import="realEstateAgentClasses.User" %>
<%@page import="java.sql.*"%>
<%
if (session.getAttribute("user") != null && !((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
	<jsp:forward page='index.jsp' />
<% }
   PreparedStatement stmt = null;
   String sql;
   Connection con = null;
   DB database = null;
   
   try {
       database = new DB();
       con = database.getConnection();
       String query = "delete from housePictures where house = ?";
       stmt = con.prepareStatement(query);
       stmt.setInt(1, Integer.parseInt(request.getParameter("hid")));
       stmt.executeUpdate();

       query = "delete from favourites where houseid = ?";
       stmt = con.prepareStatement(query);
       stmt.setInt(1, Integer.parseInt(request.getParameter("hid")));
       stmt.executeUpdate();

       query = "delete from listing where houseid = ?";
       stmt = con.prepareStatement(query);
       stmt.setInt(1, Integer.parseInt(request.getParameter("hid")));
       stmt.executeUpdate();

   } catch(ClassNotFoundException e) {
       e.printStackTrace();
   } finally {
   		stmt.close();
   		database.close();
	}

%>
<!DOCTYPE html>
<html lang="el">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Real Estate Agency</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<!-- Custom styles for this template -->
	<link href="css/theme.css" rel="stylesheet">
	<!-- Bootsrap font awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	</head>
	
	<body>

		<%@ include file="navbar.jsp"%>

		<div class='container white-bg' role='main'>
			<div class='page-header'>
				<h2 align='center'>Επιτυχής διαγραφή!</h2>
			</div>
		</div>

	<%@ include file="pageEnd.jsp"%>

	<!-- jQuery library -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script	src="js/bootstrap.min.js"></script>
</body>
</html>
