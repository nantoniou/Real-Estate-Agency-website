
// Import required java libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import realEstateAgentClasses.*;

/**
 * Public class (servlet), called from the new listing page; it is used to register a new property to the database
 * 
 * @author ISM group 9
 *
 */
public class NewListingController extends HttpServlet {

	/**
	 * Public method, called from the form in the new listing page
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html; charset=ISO-8859-7");
		PrintWriter out = new PrintWriter(response.getWriter(), true);

		String title = request.getParameter("title");
		title = new String(title.getBytes("ISO-8859-1"), "utf-8");
		String descriptionHouse = request.getParameter("description");
		descriptionHouse = new String(descriptionHouse.getBytes("ISO-8859-1"), "utf-8");
		String area = request.getParameter("area");
		area = new String(area.getBytes("ISO-8859-1"), "utf-8");
		boolean forSale = Boolean.parseBoolean(request.getParameter("forSale"));
		float sqm = Float.parseFloat(request.getParameter("sqm"));
		int price = Integer.parseInt(request.getParameter("price"));
		String floor = request.getParameter("floor");
		floor = new String(floor.getBytes("ISO-8859-1"), "utf-8");
		int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
		String floortiles = request.getParameter("floortiles");
		floortiles = new String(floortiles.getBytes("ISO-8859-1"), "utf-8");
		int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
		int constructionDate = Integer.parseInt(request.getParameter("constructionDate"));
		String heating = request.getParameter("heating");
		heating = new String(heating.getBytes("ISO-8859-1"), "utf-8");
		boolean balcony = Boolean.parseBoolean(request.getParameter("balcony"));
		boolean elevator = Boolean.parseBoolean(request.getParameter("elevator"));
		boolean renovated = Boolean.parseBoolean(request.getParameter("renovated"));
		boolean furnished = Boolean.parseBoolean(request.getParameter("furnished"));


		Listing listing = new Listing(0, title, descriptionHouse, area, forSale, sqm, price, floor, 
				bedrooms, floortiles, bathrooms, constructionDate, heating, balcony, elevator, renovated, furnished);

		ListingDAO listinghandling = new ListingDAO();
		try {
				listinghandling.registerListing(listing);
				response.sendRedirect("../fileUpload.jsp");
		} catch (Exception e) {
			out.print(e.getMessage());
		}
	}

	/**
	 * If the servlet is called using a Get request, the user is forwarded back to
	 * the register page
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.sendRedirect("../register.jsp");
	}
}