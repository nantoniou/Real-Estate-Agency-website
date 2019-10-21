<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page import="realEstateAgentClasses.UserDAO" %>
<%@ page import="realEstateAgentClasses.DB" %>
<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>
<%

if (session.getAttribute("user") == null) { %>
   <jsp:forward page='register.jsp' />
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

<%
User userContact = (User)session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="el">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Real Estate Agency</title>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
      <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
      <style type = "text/css">
         body {background: -webkit-linear-gradient(left, steelblue , lightblue );
         padding-top: 120px;
         margin-bottom: 120px;
         }
         footer {
         padding: 20px 0;
         position: absolute;
         bottom: 0;
         width: 100%;
         /* Set the fixed height of the footer here */
         height: 60px;
         }
         html {
         position: relative;
         min-height: 100%;
         }
         #loginbtn, #registerbtn { cursor: pointer; }
         .emp-profile{
         padding: 3%;
         margin-top: 3%;
         margin-bottom: 3%;
         border-radius: 0.5rem;
         background: #fff;
         }
      </style>
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile" >
         <div class="row">
            <div class="col-xl-8 offset-xl-2 py-5">
               <h2 class="sub-header">Στείλτε μας μήνυμα για άμεση επικοινωνία! <br>
                  <small>Θα λάβετε απάντηση εντός 24 ωρών της επόμενης εργάσιμης μέρας.</small>
               </h2>
                  <form name="form1" method="post" action="servlet/MessageController">
                     <div class="controls">
                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="form_name">Όνομα *</label>
                                 <input id="form_name" type="text" name="name" class="form-control" placeholder="Παρακαλώ εισάγετε το όνομά σας *" required="required" data-error="Firstname is required." value="<%= userContact != null ? userContact.getFname() : "" %>">
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="form_lastname">Επίθετο *</label>
                                 <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Παρακαλώ εισάγετε το επίθετό σας *" required="required" data-error="Lastname is required."  value="<%= userContact != null ? userContact.getLname() : "" %>">
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="form_email">Email *</label>
                                 <input id="form_email" type="email" name="email" class="form-control" placeholder="Παρακαλώ εισάγετε το email σας *" required="required" data-error="Valid email is required."  value="<%= userContact != null ? userContact.getEmail() : "" %>">
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           <div class="col-md-6">
                              <div class="form-group">
                                 <label for="form_need">Επιλέξτε θεματολογία *</label>
                                 <select id="form_need" name="need" class="form-control" required="required" data-error="Επιλέξτε θέμα.">
                                    <option value=""></option>
                                    <option value="Αίτηση επίσκεψης σε ακίνητο" <%= request.getParameter("hid") != null ? "selected" : "" %> >Αίτηση επίσκεψης σε ακίνητο</option>
                                    <option value="Περαιτέρω πληροφορίες ακινήτου">Περαιτέρω πληροφορίες ακινήτου</option>
                                    <option value="Διάθεση ακινήτου προς ενοικίαση/πώληση">Διάθεση ακινήτου προς ενοικίαση/πώληση</option>
                                    <option value="Αντίγραφο απόδειξης">Αντίγραφο απόδειξης</option>
                                    <option value="Άλλο">Άλλο</option>
                                 </select>
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                        </div>
                        <%if (request.getParameter("hid") != null) {
                           sql = "Select title, sqm, price from listing where houseid = ?;";
                           try {
                               stmt = con.prepareStatement(sql);
                               stmt.setString(1, request.getParameter("hid"));
                               rs = stmt.executeQuery();
                               rs.next();
                           %>
                        <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label for="form_message">Μήνυμα *</label>
                                 <textarea id="form_message" name="message" class="form-control" placeholder="Παρακαλώ εισάγετε το μήνυμά σας*" rows="4" required="required" data-error="Please, leave us a message.">Ενδιαφέρομαι να επισκεφτώ το ακίνητο της αγγελίας "<%=rs.getString("title")%>", των <%=rs.getString("sqm")%> τ.μ. με τιμή <%=rs.getString("price") %> &euro;.</textarea>
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           <%
                              }catch(Exception e) {
                                          out.print(e.getMessage());
                              }finally {
                                  stmt = null;
                                  rs = null;
                              }
                           } else { %>
                           <div class="row">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <label for="form_message">Μήνυμα *</label>
                                 <textarea id="form_message" name="message" class="form-control" placeholder="Παρακαλώ εισάγετε το μήνυμά σας*" rows="4" required="required" data-error="Please, leave us a message."></textarea>
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           <% } %>
                           <div class="col-md-12">
                              <input type="hidden" name="uid" value= <%=userContact.getUserid()%> >
                              <input type="submit" class="btn btn-success btn-send" value="Αποστολή" >
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-md-12">
                              <p class="text-muted">
                                 <strong>*</strong>Απαραίτητα πεδία.
                              </p>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>

      <%@ include file="pageEnd.jsp"%>
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous">
      </script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous">
      </script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">
      </script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"
        integrity="sha256-dHf/YjH1A4tewEsKUSmNnV05DDbfGN3g7NMq86xgGh8=" crossorigin="anonymous">
      </script>
   </body>
</html>