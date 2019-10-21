<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page errorPage="error.jsp"%>
<%
User userNavbar = (User)session.getAttribute("user");
%>

<!-- navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	  </button>
	  <a class="navbar-brand" href="http://ism.dmst.aueb.gr/ismgroup9/index.jsp">Real Estate Agency</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
	  <ul class="nav navbar-nav">
		<li class= "<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("index.jsp") ? "active":"") %>"><a href="http://ism.dmst.aueb.gr/ismgroup9/index.jsp">Αρχική</a></li>							
		<li class="dropdown">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Αγγελίες <span class="caret"></span></a>
		  <ul class="dropdown-menu">
			<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("servlet/ListingSearch") && request.getParameter("type").equals("prosEnoikiasi") ? "active":"") %>">
				<a href="http://ism.dmst.aueb.gr/ismgroup9/servlet/ListingSearch?type=prosEnoikiasi">Προς ενοικίαση</a></li>
			<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("servlet/ListingSearch") && request.getParameter("type").equals("prosPolisi") ? "active":"")%>">
				<a href="http://ism.dmst.aueb.gr/ismgroup9/servlet/ListingSearch?type=prosPolisi">Προς πώληση</a></li>
		  </ul>
		</li>
		<li><a href="#myModal" data-toggle="modal" data-target="#infoModal">Πληροφορίες</a></li>	
		<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("contact.jsp") ? "active":"") %>"><a href="http://ism.dmst.aueb.gr/ismgroup9/contact.jsp">Επικοινωνία</a></li>
	  </ul>
		<ul class="nav navbar-nav navbar-right">
			<% if(session.getAttribute("user") != null) { %>
				
					<% if (!userNavbar.getUsername().equals("admin")) { %>

					<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				  	<span class="glyphicon glyphicon-asterisk"></span> <b><%=userNavbar.getUsername()%></b> <span class="caret"></span></a>
				  <ul class="dropdown-menu">

						<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("profile.jsp") ? "active":
						"") %>">
							<a href="http://ism.dmst.aueb.gr/ismgroup9/profile.jsp">
								<span class="glyphicon glyphicon-user"></span> Προφίλ
							</a>
						</li>
						<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("logout.jsp") ? "active":
						"")%>">
							<a href="http://ism.dmst.aueb.gr/ismgroup9/logout.jsp">
								<span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση
							</a>
						</li>
					</ul>
				</li>

					<% } else { %>


					<li class="dropdown">
				  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				  			<span class="glyphicon glyphicon-menu-down"></span> Admin panel </a>
				  		<ul class="dropdown-menu">
							<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("newListing.jsp") ? "active":
						"")%>">
								<a href="http://ism.dmst.aueb.gr/ismgroup9/newListing.jsp">
									Νέα αγγελία
								</a>
							</li>
							<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("messageBoard.jsp") ? "active":
						"")%>">
								<a href="http://ism.dmst.aueb.gr/ismgroup9/messageBoard.jsp">
									Προβολή μηνυμάτων
								</a>
							</li>
						</ul>
					</li>

					
					<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("logout.jsp") ? "active":
					"")%>">
						<a href="http://ism.dmst.aueb.gr/ismgroup9/logout.jsp">
							<span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση
						</a>
					</li>
					<% } %>
			<% } else { %>
				<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("register.jsp") ? "active":"")
				%>">
					<a href="http://ism.dmst.aueb.gr/ismgroup9/register.jsp" id="registerbtn">
						<span class="glyphicon glyphicon-log-in"></span> Σύνδεση ή Εγγραφή
					</a>
				</li>
			<% } %>
		</ul>
	  
	</div>
  </div>
</nav>