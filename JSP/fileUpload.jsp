<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page import="realEstateAgentClasses.*"%>
<%

if (session.getAttribute("user") == null || !((User)session.getAttribute("user")).getUsername().equals("admin")) { %>
  <jsp:forward page='index.jsp' />
<% }

int maxhid = 0;
  if (request.getParameter("upload") == null) { %>

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
        <style type="text/css">
          .containerasd{
              margin-top:20px;
          }
          .image-preview-input {
              position: relative;
            overflow: hidden;
            margin: 0px;    
              color: #333;
              background-color: #fff;
              border-color: #ccc;    
          }
          .image-preview-input input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
          }
          .image-preview-input-title {
              margin-left:2px;
          }
          footer {
            position: absolute;
          }
        </style>
     </head>
     <body>
        <%@ include file="navbar.jsp"%>

    <div class="container emp-profile">
        <div class="col-md-12 content">
         <div class="panel panel-default">
            <div class="panel-heading" >
             <header> <h3> Προσθήκη Νέας Αγγελίας (2/2) </h3></header>
            </div>
            <div class="panel-body">
                <!--<div class="row">
                  <div align="center">
                  <div class="file btn btn-lg btn-primary">
                       <form action = "fileUpload.jsp?upload=1" method = "post" enctype = "multipart/form-data">
                          Αλλαγή φωτογραφίας
                          <input type = "file" style="width: 100%; height:100%; visibility: hidden;" value="Προσθήκη φωτογραφίας" name = "file" onchange='this.form.submit();' accept="image/*">
                       </form>
                  </div>
                </div>-->
                <div class="containerasd">
                    <form action = "fileUpload.jsp?upload=1" method = "post" enctype = "multipart/form-data">
                      <div class="row">    
                        <div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">  
                            <!-- image-preview-filename input [CUT FROM HERE]-->
                            <div class="input-group image-preview">
                                <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                                <span class="input-group-btn">
                                    <!-- image-preview-clear button -->
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Ακύρωση
                                    </button>
                                    <!-- image-preview-input -->
                                    <div class="btn btn-default image-preview-input">
                                        <span class="glyphicon glyphicon-folder-open"></span>
                                        <span class="image-preview-input-title">Επιλογή</span>
                                        <input type="file" accept="image/png, image/jpeg, image/gif" name="file"/>
                                    </div>
                                </span>
                            </div><!-- /input-group image-preview [TO HERE]--> 
                        </div>
                      </div>
                    </br>
                      <div class="row" align="center">
                        <button type="submit" class="btn btn-success">    Υποβολή    </button>
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

      <script>
      $(document).on('click', '#close-preview', function(){ 
          $('.image-preview').popover('hide');
          // Hover befor close the preview
          $('.image-preview').hover(
              function () {
                 $('.image-preview').popover('show');
              }, 
               function () {
                 $('.image-preview').popover('hide');
              }
          );    
      });

      $(function() {
          // Create the close button
          var closebtn = $('<button/>', {
              type:"button",
              text: 'x',
              id: 'close-preview',
              style: 'font-size: initial;',
          });
          closebtn.attr("class","close pull-right");
          // Set the popover default content
          $('.image-preview').popover({
              trigger:'manual',
              html:true,
              title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
              content: "There's no image",
              placement:'bottom'
          });
          // Clear event
          $('.image-preview-clear').click(function(){
              $('.image-preview').attr("data-content","").popover('hide');
              $('.image-preview-filename').val("");
              $('.image-preview-clear').hide();
              $('.image-preview-input input:file').val("");
              $(".image-preview-input-title").text("Browse"); 
          }); 
          // Create the preview image
          $(".image-preview-input input:file").change(function (){     
              var img = $('<img/>', {
                  id: 'dynamic',
                  width:250,
                  height:200
              });      
              var file = this.files[0];
              var reader = new FileReader();
              // Set preview image into the popover data-content
              reader.onload = function (e) {
                  $(".image-preview-input-title").text("Change");
                  $(".image-preview-clear").show();
                  $(".image-preview-filename").val(file.name);            
                  img.attr('src', e.target.result);
                  $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
              }        
              reader.readAsDataURL(file);
          });  
      });
      </script>

    </body>
    </html>
<% } else {


    

   File file;
   String photoPath = null;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\ismgroup9\\images\\";

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File(filePath));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
	    // Parse the request to get file items.
	    List fileItems = upload.parseRequest(request);

	    // Process the uploaded file items
	    Iterator i = fileItems.iterator();
	    FileItem fi = (FileItem)i.next();
	    if ( !fi.isFormField () ) {
	       // Get the uploaded file parameters
	       String fieldName = fi.getFieldName();
	       String fileName = fi.getName();
	       boolean isInMemory = fi.isInMemory();
	       long sizeInBytes = fi.getSize();
	       // Write the file
	       if( fileName.lastIndexOf("\\") >= 0 ) {
	          file = new File( filePath + 
	          fileName.substring( fileName.lastIndexOf("\\")));
	          photoPath = "images/" + fileName.substring( fileName.lastIndexOf("\\"));
	       } else {
	          file = new File( filePath + 
	          fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	          photoPath = "images/" + fileName.substring( fileName.lastIndexOf("\\") + 1);
	       }
	       fi.write( file ) ;
	    }
   }

   PreparedStatement stmt = null;
   String sql;
   Connection con = null;
   ResultSet rs = null;

   try{
       DB database = new DB();
       con = database.getConnection();

       String query = "select max(houseid) from listing;";
       stmt = con.prepareStatement(query);
       rs = stmt.executeQuery();
       rs.next();
       maxhid = rs.getInt(1);

       query = "insert into housePictures values (null, ? , ?)";
       stmt = con.prepareStatement(query);
       stmt.setInt(1, maxhid);
       stmt.setString(2, photoPath);
       // execute the java preparedstatement
       stmt.executeUpdate();
   } catch(ClassNotFoundException e) {
       throw new Exception(e.getMessage());
   } finally{
       stmt.close();
       con.close();
}
response.sendRedirect("details.jsp?hid=" + maxhid);
%>

<% } %>