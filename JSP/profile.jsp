<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="realEstateAgentClasses.User" %>
<%@ page import="realEstateAgentClasses.UserDAO" %>
<%@ page import="realEstateAgentClasses.Listing" %>
<%@ page import="realEstateAgentClasses.ListingDAO" %>
<%@ page import="java.util.*"%>
<%@ page errorPage="error.jsp" %>
<% 
   if(session.getAttribute("user") == null) { %>
      <jsp:forward page="register.jsp" />
      <%
   }
   User user = (User) session.getAttribute("user");
   String username = user.getUsername();
   int userid = user.getUserid();
   String fname = user.getFname();
   String lname = user.getLname();
   String descriptionUser = user.getDescriptionUser();
   String email = user.getEmail();
   long phone = user.getPhone();
   String userPhotoPath = user.getUserPhotoPath();


   List<Listing> favs = new ArrayList<Listing>();
   favs = ListingDAO.searchFavs(userid);

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
   </head>
   <body>
      <%@ include file="navbar.jsp"%>
      <div class="container emp-profile">
            <div class="row">
               <div class="col-md-4">
                  <div class="profile-img">
                     <img src = <% out.println(userPhotoPath); %> alt="User photo" class='img-responsive img-thumbnail' 
                        style = 'width:100%; max-height:250px; max-width:300px;' />
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="profile-head">
                     <h4> <strong>Προφίλ Χρήστη</strong>
                     </h4>
                     <h5> <% out.println(fname + " " + lname); %></h5>
                     <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                           <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Στοιχεία</a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="profile-work">
                     <p>Σχετικά με εμένα</p>
                     <small> <% out.println(descriptionUser); %></small><br/>
                  </div>
               </div>
               <div class="col-md-3">
                  <div class="row">
                     <div class="col-md-6">
                        <label>Username</label>
                     </div>
                     <div class="col-md-6">
                        <p><% out.println(username); %></p>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Όνομα</label>
                     </div>
                     <div class="col-md-6">
                        <p><% out.println(fname + " " + lname); %></p>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Email</label>
                     </div>
                     <div class="col-md-6">
                        <p><% out.println(email); %></p>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Phone</label>
                     </div>
                     <div class="col-md-6">
                        <p><% out.println(phone); %></p>
                     </div>
                  </div>
               </div>
            </div>
            <h4> <strong> Τα Αγαπημένα μου </strong></h4>
            <hr>
            <%
               try{
                  if (favs.isEmpty()){
                     %> <div class='alert alert-info' style='text-align:left'>
                           Δεν βρέθηκαν αγαπημένα!<br>Εξερευνήστε τον ιστότοπό μας για να βρείτε το ιδανικό σας σπίτι.
                        </div>
                     <%
                  }else{
                  %>
                     <div class="row">
                  <%
                     for (Listing listing : favs){
                     String path = ListingDAO.findPhotos(listing.getHouseid());
                  %>
                           <div class='col-md-3 col-sm-6 col-xs-12'>
                              <div class='thumbnail'>
                                 <img src= "<%=path%>" alt='House Picture' class='img-responsive img-thumbnail'>
                              </div>
                              <div class='caption'>
                                    <h4 class="text-danger"> <%=listing.getTitle()%> <small><%= (int)listing.getSqm()%>τ.μ.</small></h4>
                                    <p class="text-justify"><%=listing.getDescriptionHouse()%></p>
                                 <hr>
                                 <h3>
                                       <span>Τιμή: <%=listing.getPrice()%> &euro;</span>
                                 </h3>
                                 <div class="bottom-wrap">
                                    <a href="details.jsp?hid=<%=listing.getHouseid()%>" class='btn btn-info' role='button'>Λεπτομέρειες</a>
                                    <a href="favouriteDelete.jsp?hid=<%=listing.getHouseid()%>" class='btn btn-danger' role='button' style="position: absolute; right: 15px;"><span class="glyphicon glyphicon-trash"></span></a>
                                 </div>
                              </div>
                           </div>
                           <%
                     }
                  }
               } catch (Exception ex){
                  ex.printStackTrace();
               }
            %>
            </div>
      </div>
      <%@ include file="pageEnd.jsp"%>
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
   </body>
</html>