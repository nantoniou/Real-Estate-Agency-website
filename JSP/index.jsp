<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>

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
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<!--<style type = "text/css">
        body { padding-top: 170px;
        }
    </style>-->

	</head>
	
	<body class="bgimg">

		<%@ include file="navbar.jsp"%>

		<!-- Header -->
	    <header>
	      <div class="container">
	        <div class="intro-text">
	          <div class="intro-lead-in">Αναζητήστε το ιδανικό σας σπίτι!</div>
	        </div>
	      </div>
	    </header>

		<div class="container">
		    <div class="row">
		        <div class="col-md-12">
		            <div class="panel panel-default">
		                <div class="panel-heading">
		                    <span class="glyphicon glyphicon-search"></span> Αναζήτηση κατοικίας</div>
		                <div class="panel-body">
		                    <form class="form-horizontal" role="form"  action="servlet/ListingSearch" method="post" name = "listingform">
		                    	<div class="col-md-2">
                                    <div class="form-group ">
                                      <select id="type" name = "type" class="form-control" >
                                        <option selected>Προς πώληση</option>
                                        <option>Προς ενοικίαση</option>
                                      </select>
                                    </div>
		                        </div>
		                    	<div class="col-md-2">
                                    <div class="form-group ">
                                      <select id="inputArea" name = "inputArea" class="form-control" >
                                        <option selected>Περιοχή</option>
                                        <option>Αγ. Μαρίνα</option>
                                        <option>Άλιντα</option>
                                        <option>Λακκί</option>
                                        <option>Ξηρόκαμπος</option>
                                      </select>
                                    </div>
		                        </div>
                                <div class="col-md-2">
                                    <div class="form-group ">
                                          <select id="inputSize" name = "inputSize" class="form-control" >
                                            <option selected>Έκταση (τ.μ.)</option>
                                            <option>0-50</option>
                                            <option>50-100</option>
                                            <option>100-200</option>
                                            <option>200-500</option>
                                          </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input type="number" class="form-control" id="minpri" name = "minpri" placeholder="Ελάχιστη τιμή (€) ">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input type="number" class="form-control" id="maxpri" name = "maxpri" placeholder="Μέγιστη τιμή (€) ">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-dark">Αναζήτηση</button>
                                </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

		<%@ include file="pageEnd.jsp"%>

		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
		
	</body>
</html>