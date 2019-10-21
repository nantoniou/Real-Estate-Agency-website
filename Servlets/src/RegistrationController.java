
// Import required java libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import realEstateAgentClasses.*;

/**
 * Public class (servlet), called from the register page; it is used to register
 * a user to the database
 * 
 * @author ISM group 9
 *
 */
public class RegistrationController extends HttpServlet {

	/**
	 * Public method, called from the form in the register page
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html; charset=ISO-8859-7");
		PrintWriter out = new PrintWriter(response.getWriter(), true);

		String name = request.getParameter("name");
		name = new String(name.getBytes("ISO-8859-1"), "utf-8");
		String surname = request.getParameter("sname");
		surname = new String(surname.getBytes("ISO-8859-1"), "utf-8");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		long phone = Long.parseLong(request.getParameter("phone"));
		String pword = request.getParameter("pword");
		String confirm = request.getParameter("confirm");
		String description = request.getParameter("description");
		User user = new User(0, name, surname, email, description, username, pword, null, phone);
		HttpSession session = request.getSession(false);
		UserDAO userhandling = new UserDAO();
		// regex adopted from the ISM lectures; used to validate email input
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]"
				+ "{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		StringBuilder errors = new StringBuilder();
		try {
			// if the input is incorrect
			if (!pword.equals(confirm) || name.length() < 3 || surname.length() < 3 || username.length() < 5
					|| pword.length() < 5 || userhandling.findUser(username) != null || !m.matches()) {
				session.setAttribute("errorHeader", "Η εγγραφή απέτυχε");
				session.setAttribute("errorType", "warning");
				if (!pword.equals(confirm)) {// password does not equal the "confirm password"
					errors.append("<li> Ο κωδικός διαφέρει από την επανάληψη κωδικού. </li>\n");
				}
				if (name.length() < 3) {
					errors.append("<li> Το όνομα πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες. </li>\n");
				}
				if (surname.length() < 3) {
					errors.append("<li> Το επίθετο πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες. </li>\n");
				}
				if (username.length() < 5) {
					errors.append("<li> Το όνομα χρήστη πρέπει να αποτελείται από τουλάχιστον 5 χαρακτήρες. </li>\n");
				}
				if (pword.length() < 5) {
					errors.append("<li> Ο κωδικός πρέπει να αποτελείται από τουλάχιστον 5 χαρακτήρες. </li>\n");
				}
				if (userhandling.findUser(username) != null) { // username already exists in the database
					errors.append(
							"<li> Υπάρχει ήδη χρήστης με αυτό το όνομα χρήστη, παρακαλώ επιλέξτε κάποιο άλλο. </li>\n");
				}
				if (!m.matches()) {
					errors.append("<li> Η διεύθυνση email δεν είναι έγκυρη. </li>\n");
				}
				session.setAttribute("errors", errors);
				response.sendRedirect("../register.jsp");
			} else { // input is correct
				userhandling.registerUser(user);
				session.setAttribute("user", userhandling.findUser(username));
				response.sendRedirect("../index.jsp");
			}
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