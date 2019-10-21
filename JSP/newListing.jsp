<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page import="realEstateAgentClasses.UserDAO" %>
<%@ page import="realEstateAgentClasses.Listing" %>
<%@ page import="realEstateAgentClasses.ListingDAO" %>
<%@ page import="java.util.*"%>
<%@ page errorPage="error.jsp" %>

<%
if (session.getAttribute("user") == null || !((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
	<jsp:forward page='index.jsp' />
<% } %>

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
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile">
            <div class="col-md-12 content">
                <div class="panel panel-default">
 						<div class="panel-heading" >
 							<header> <h3> Προσθήκη Νέας Αγγελίας (1/2)</h3></header>
                         </div>
                         <div class="panel-body">
						<div class="row">
							<div class="col-lg-10">
								<form class="form-horizontal" id="register-form" name = "regform" action="servlet/NewListingController" method="post" role="form" >
									<div class="form-group">
										<label class="control-label col-sm-2" for="title"> Τίτλος Αγγελίας</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<input type="text" class="form-control" id="title" name = "title" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="form_message">Περιγραφή Σπιτιού</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<textarea id="form_description" name="description" class="form-control" placeholder="Εώς 1000 χαρακτήρες..." rows="4"></textarea>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="area">Περιοχή</label>
										<div class="col-sm-10">
			                                 <select id="areaForm" name="area" class="form-control" required="required">
			                                    <option>Αγ. Μαρίνα</option>
			                                    <option>Άλιντα</option>
			                                    <option>Λακκί</option>
			                                    <option>Ξηρόκαμπος</option>
			                                 </select>
	                             		</div>
									</div>
	                              <div class="form-group">
	                                 <label class="control-label col-sm-2" for="form_need">Προς Πώληση</label>
	                                 	<div class="col-sm-10">
			                                 <select id="form_need" name="forSale" class="form-control" required="required">
			                                    <option value=""></option>
			                                    <option value="true">Ναι, αφορά ακίνητο προς πώληση</option>
			                                    <option value="false">Όχι, αφορά ακίνητο προς ενοικίαση</option>
			                                 </select>
	                             		</div>
	                              </div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="sqm">Τετραγωνικά μέτρα</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<input type="number" class="form-control" id="sqmForm" name = "sqm" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="price">Τιμή</label>
										<div class="col-sm-10"> 
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
												<input type="number" class="form-control" id="price" name = "price" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="email">Όροφος</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
												<input type="text" class="form-control" id="floor" name = "floor" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="username">Αριθμός δωματίων</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></span>
												<input type="number" class="form-control" id="bedrooms" name = "bedrooms" required>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="floor">Δάπεδο</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<input type="text" class="form-control" id="floortiles" name = "floortiles" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="bedrooms">Αριθμός μπάνιων</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<input type="number" class="form-control" id="bathrooms" name = "bathrooms" required>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="constructionDate">Έτος κτήσης</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
												<input type="number" class="form-control" id="constructionDateForm" name = "constructionDate" required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="heating">Θέρμανση</label>
										<div class="col-sm-10">
											<div class="input-group">
												<span class="input-group-addon"><i aria-hidden="true"></i></span>
												<input type="text" class="form-control" id="heatingForm" name = "heating" required>
											</div>
										</div>
									</div>
	                              <div class="form-group">
	                                 <label class="control-label col-sm-2" for="form_need">Με μπαλκόνι</label>
	                                 <div class="col-sm-10">
		                                 <select id="form_need" name="balcony" class="form-control" required="required">
		                                    <option value=""></option>
		                                    <option value="true">Ναι</option>
		                                    <option value="false">Όχι</option>
		                                 </select>
		                             </div>
	                                 <div class="help-block with-errors"></div>
	                              </div>
	                              <div class="form-group">
	                                 <label  class="control-label col-sm-2" for="form_need">Με Ασανσέρ</label>
	                                 <div class="col-sm-10">
		                                 <select id="form_need" name="elevator" class="form-control" required="required">
		                                    <option value=""></option>
		                                    <option value="true">Ναι</option>
		                                    <option value="false">Όχι</option>
		                                 </select>
		                                 <div class="help-block with-errors"></div>
		                              </div>
		                          </div>
	                              <div class="form-group">
	                                 <label  class="control-label col-sm-2" for="form_need">Ανακαινισμένο</label>
	                                 <div class="col-sm-10">
		                                 <select id="form_need" name="renovated" class="form-control" required="required">
		                                    <option value=""></option>
		                                    <option value="true">Ναι</option>
		                                    <option value="false">Όχι</option>
		                                 </select>
		                                 <div class="help-block with-errors"></div>
		                              </div>
		                          </div>
	                              <div class="form-group">
	                                 <label  class="control-label col-sm-2" for="form_need">Επιπλωμένο</label>
	                                 <div class="col-sm-10">
		                                 <select id="form_need" name="furnished" class="form-control" required="required">
		                                    <option value=""></option>
		                                    <option value="true">Ναι</option>
		                                    <option value="false">Όχι</option>
		                                 </select>
		                                 <div class="help-block with-errors"></div>
		                             </div>
	                              </div>
									<div class="form-group">
										<div class="row">
											<div class="col-xs-6 col-xs-offset-3">
												<input type="submit" name="newListing-submit" id="newListing-submit-submit" tabindex="4" class="form-control btn btn-register" value="Υποβολή">
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
	<%@ include file="pageEnd.jsp"%>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>