<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%
if(session.getAttribute("user") != null) { %>
  <jsp:forward page="profile.jsp" />
<%
} %>

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

		<div class="container">
		    	<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<div class="panel panel-login">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-6">
										<a href="#" class="active" id="login-form-link">Σύνδεση</a>
									</div>
									<div class="col-xs-6">
										<a href="#" id="register-form-link">Εγγραφή</a>
									</div>
								</div>
								<hr>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form class="form-horizontal" id="login-form" action="loginController.jsp" method="post" role="form" style="display: block;">
											<div class="form-group">
												<label for="username" class="col-sm-2 control-label">Username</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></span>
														<input type="text" name="username_login" id="username_login" class="form-control" placeholder="Username" required>
													</div>
												</div>							
											</div>
											<div class="form-group">
												<label for="password" class="col-sm-2 control-label">Κωδικός</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
														<input type="password" name="password_login" id="password_login" class="form-control" placeholder="Κωδικός" required>
													</div>
												</div>								
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-xs-6 col-xs-offset-3">
														<input type="submit" name="login-submit" id="login-submit" class="form-control btn btn-login" value="Σύνδεση">
													</div>
												</div>
											</div>
										</form>
										<form class="form-horizontal" id="register-form" name = "regform" action="servlet/RegistrationController" method="post" role="form" style="display: none;">
											<div class="form-group">
												<label class="control-label col-sm-2" for="name">Όνομα</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
														<input type="text" class="form-control" id="name" name = "name" placeholder="Το όνομά σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="sname">Επίθετο</label>
												<div class="col-sm-10"> 
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
														<input type="text" class="form-control" id="sname" name = "sname" placeholder="Το επίθετό σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="email">Email</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
														<input type="email" class="form-control" id="emailForm" name = "email" placeholder="Το email σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="username">Username</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></span>
														<input type="text" class="form-control" id="usernameForm" name = "username" placeholder="Το username σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="username">Τηλέφωνο επικοινωνίας</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
														<input type="number" class="form-control" id="phone" name = "phone" placeholder="Το τηλέφωνό σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="pword">Κωδικός</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
														<input type="password" class="form-control" id="pword" name = "pword" placeholder="Ο κωδικός σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="confirm">Επιβεβαίωση κωδικού</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-repeat" aria-hidden="true"></i></span>
														<input type="password" class="form-control" id="confirm" name = "confirm" placeholder="Επιβεβαιώστε τον κωδικό σας" required>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2" for="form_message">Σχετικά με εμένα</label>
												<div class="col-sm-10">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-info" aria-hidden="true"></i></span>
														<textarea id="form_description" name="description" class="form-control" placeholder="Σχετικά με εμένα..." rows="4"></textarea>
														<div class="help-block with-errors"></div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-xs-6 col-xs-offset-3">
														<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Εγγραφή">
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
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

		<script>
		$(function() {

		    $('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
		 		$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
		 		$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
		</script>

		<% if(session.getAttribute("errorHeader") != null) { %>
			<!-- Modal -->
			<div class="modal fade" id="errorModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" align="center"><%=session.getAttribute("errorHeader")%></h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-<%=session.getAttribute("errorType")%>" role="alert">
							<ul>
								<%= (StringBuilder)session.getAttribute("errors") %>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">Close</a>
					</div>
				</div>
			</div>
			</div>
			<script type="text/javascript">
			    $(window).on('load',function(){
			        $('#errorModal').modal('show');
			    });
			</script>
			<%
			session.removeAttribute("errorHeader");
			session.removeAttribute("errors");
			session.removeAttribute("errorType");
		} %>

	</body>
</html>