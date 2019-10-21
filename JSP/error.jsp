<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<meta name="description" content="Σελίδα λάθους">
		<link rel="icon" href="images/favicon.ico">
		
		<title>Error!- Real estate agency</title>

		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">

		<link href="css/theme.css" rel="stylesheet">

		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>

		<%@ include file="navbar.jsp"%>

		<div class="container theme-showcase white-bg" role="main">

			<% if(exception != null) { %>
			<div class="page-header">
				<h1>Ωχ, κάτι πήγε στραβά!</h1>
			</div>		
			<div class="alert alert-danger" role="alert"><%= exception.getMessage() %> </br> <% exception.printStackTrace(); %></div>
			<% } %>			
		</div>
		<!-- /container -->

		<%@ include file="pageEnd.jsp"%>

		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>