import realEstateAgentClasses.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Public class (servlet), called from the main page of the website, or the
 * navbar, to search for listings, by using the conditions passed in the
 * request.
 * 
 * @author ISM group 9
 *
 */
public class ListingSearch extends HttpServlet {

	/**
	 * Method doPost, handles Post requests from the main page and, through the
	 * doGet method, from the navbar.
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = new PrintWriter(response.getWriter(), true);

		try {
			out.println("<!DOCTYPE html>");
			out.println("<html lang='el'>");
			out.println("	<head>");
			out.println("	<meta charset='utf-8'>");
			out.println("	<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
			out.println("	<meta name='viewport' content='width=device-width, initial-scale=1'>");
			out.println("");
			out.println("	<title>Real Estate Agency</title>");
			out.println("");
			out.println("	<!-- Bootstrap core CSS -->");
			out.println("	<link rel='stylesheet' href='../css/bootstrap.min.css'>	");
			out.println("	<!-- Bootstrap Optional theme -->");
			out.println("	<link rel='stylesheet' href='../css/bootstrap-theme.min.css'>");
			out.println("	<!-- Custom styles for this template -->");
			out.println("	<link href='../css/theme.css' rel='stylesheet'>");
			out.println("	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->");
			out.println("	<!--[if lt IE 9]>");
			out.println("		  <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>");
			out.println("		  <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>");
			out.println("	<![endif]-->");
			out.println("	</head>");
			out.println("	");
			out.println("	<body>");
			out.println("");

			RequestDispatcher dis = request.getRequestDispatcher("../navbar.jsp");
			dis.include(request, response);

			out.println("		<div class='container white-bg' role='main'>");
			out.println("			<div class='page-header'>");
			out.println("				<h2 align='center'>Αποτελέσματα αναζήτησης</h2>");
			out.println("			</div>");
			out.println("			<div class='container-center container'>");
			out.println("				<div class='row'>");
		} catch (Exception e) {
			out.println("Exception: " + e.getMessage());
			out.println("</body>");
			out.println("</html>");
		}
		List<Listing> listings = new ArrayList<>();
		try {
			String typeParameter = request.getParameter("type");
			typeParameter = new String(typeParameter.getBytes("ISO-8859-1"), "utf-8");
			if (typeParameter.equals("prosEnoikiasi") || typeParameter.equals("prosPolisi")) { // if servlet called from
																								// navbar
				listings = ListingDAO.searchListings(typeParameter, "Περιοχή", "Έκταση (τ.μ.)", "", "");
			} else { // called from main page
				String area = request.getParameter("inputArea");
				area = new String(area.getBytes("ISO-8859-1"), "utf-8");
				String size = request.getParameter("inputSize");
				size = new String(size.getBytes("ISO-8859-1"), "utf-8");
				String minpri = request.getParameter("minpri");
				String maxpri = request.getParameter("maxpri");
				listings = ListingDAO.searchListings(typeParameter, area, size, minpri, maxpri);
			}
		} catch (Exception e) {
			out.println("Exception: " + e.getMessage());
			out.println("</body>");
			out.println("</html>");
		}

		try {
			if (listings.isEmpty()) {// no listing found
				out.println("  <div class='alert alert-secondary' role='alert' style='background-color:#e6eeff;'>");
				out.println(
						"    <p class='h3'>Δεν βρέθηκαν διαθέσιμες αγγελίες!<br>Δοκιμάστε μία διαφορετική αναζήτηση.<p>");
				out.println("  </div>");
			} else {
				for (Listing listing : listings) {
					out.println("					<div class='col-md-3 col-sm-6 col-xs-12'>");
					out.println("						<div class='thumbnail'>");
					String path = ListingDAO.findPhotos(listing.getHouseid());
					out.println("						  <img src='../" + path
							+ "' alt='House Picture' class='img-responsive img-thumbnail'>");
					out.println("						  <div class='caption'>");
					out.println("							<h3 class='text-danger'>" + listing.getTitle());
					out.println("						  	<small>" + (int) listing.getSqm() + " τ.μ. </small> </h3>");
					out.println("							<hr>");
					out.println("							<hr>");
					out.println("							<p class='text-justify'>" + listing.getDescriptionHouse()
							+ "</p>");
					out.println("							<hr>");
					out.println("							<h2>");
					out.println("								<span>" + listing.getPrice() + "&euro;</span>");
					out.println("							</h2>");
					out.println("							<p><a href='../details.jsp?hid=" + listing.getHouseid()
							+ "' class='btn btn-info' role='button'>Λεπτομέρειες</a></p>");
					out.println("						  </div>");
					out.println("						</div>");
					out.println("					</div>");
				}
			}
			out.println("				</div>");
			out.println("			</div>");

			out.println("	   </div>");

			RequestDispatcher dis = request.getRequestDispatcher("../pageEnd.jsp");
			dis.include(request, response);

			out.println("<!-- jQuery library -->");
			out.println("<script src='../js/jquery.min.js'></script>");
			out.println("<!-- Bootstrap core JavaScript -->");
			out.println("<script src='../js/bootstrap.min.js'></script>");

			out.println("	</body>");
			out.println("</html>");
		} catch (Exception e) {
			out.println("Exception: " + e.getMessage());
			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * Handles the requests from the navbar, and calls the doPost method
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
}
