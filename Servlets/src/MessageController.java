import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import realEstateAgentClasses.*;

/**
 * Public class (servlet), responsible for handling the new messsage form, in
 * the contact page.
 * 
 * @author ISM group 9
 *
 */
public class MessageController extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html; charset=ISO-8859-7");
		PrintWriter out = new PrintWriter(response.getWriter(), true);
		MessageHandling insertMessage = new MessageHandling();
		String name = request.getParameter("name");
		name = new String(name.getBytes("ISO-8859-1"), "utf-8");
		String surname = request.getParameter("surname");
		surname = new String(surname.getBytes("ISO-8859-1"), "utf-8");
		String email = request.getParameter("email");
		String need = request.getParameter("need");
		need = new String(need.getBytes("ISO-8859-1"), "utf-8");
		String message = request.getParameter("message");
		message = new String(message.getBytes("ISO-8859-1"), "utf-8");
		int uid = Integer.parseInt(request.getParameter("uid"));

		header(out, request, response);
		Message mes = new Message(name, surname, email, need, message, uid);
		try {
			insertMessage.newMessage(mes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.println("<div class=\"container emp-profile\"  role='main'>");
		out.println("			<div class='page-header'>");
		out.println("				<h2>Το μήνυμά σας εστάλη επιτυχώς! Ευχαριστούμε που επικοινωνήσατε μαζί μας.</h2>");
		out.println("			</div>");
		out.println("			<div class='alert alert-info' style='text-align:left'>");
		out.println(" Η ικανοποίηση σας είναι προτεραιότητά μας! <br> Θα λάβετε απάντηση εκ μέρους μας "
				+ "(μέσω e-mail) μέσα στο επόμενο 24ώρο της επόμενης εργάσιμης μέρας.");
		out.println("			</div>");
		out.println("			</div>");

		footer(out, request, response);
	}

	/**
	 * if the user calls the servlet with a Get request, he is forwarded to the main
	 * page
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.sendRedirect("../index.jsp");
	}

	/**
	 * Prints the top of the HTML page
	 * 
	 * @param out
	 * @param request
	 * @param response
	 */
	public void header(PrintWriter out, HttpServletRequest request, HttpServletResponse response) {
		out.println("<!DOCTYPE html>");
		out.println("<html lang='el'>");
		out.println("   <head>");
		out.println("      <meta charset='utf-8'>");
		out.println("      <meta http-equiv='X-UA-Compatible' content='IE=edge'>");
		out.println("      <meta name='viewport' content='width=device-width, initial-scale=1'>");
		out.println("      <title>Real Estate Agency</title>");
		out.println("      <link rel='stylesheet' href='../css/bootstrap.min.css'>");
		out.println("      <link rel='stylesheet' href='../css/bootstrap-theme.min.css'>");
		out.println(
				"      <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>");
		out.println("      <style type = 'text/css'>");
		out.println("         body {background: -webkit-linear-gradient(left, steelblue , lightblue );");
		out.println("         padding-top: 120px;");
		out.println("         margin-bottom: 120px;");
		out.println("         }");
		out.println("         footer {");
		out.println("         /*background-color: #082457;*/");
		out.println("         padding: 20px 0;");
		out.println("         position: absolute;");
		out.println("         bottom: 0;");
		out.println("         width: 100%;");
		out.println("         /* Set the fixed height of the footer here */");
		out.println("         height: 60px;");
		out.println("         }");
		out.println("         html {");
		out.println("         position: relative;");
		out.println("         min-height: 100%;");
		out.println("         }");
		out.println("         #loginbtn, #registerbtn { cursor: pointer; }");
		out.println("         .emp-profile{");
		out.println("         padding: 3%;");
		out.println("         margin-top: 3%;");
		out.println("         margin-bottom: 3%;");
		out.println("         border-radius: 0.5rem;");
		out.println("         background: #fff;");
		out.println("         }");
		out.println("      </style>");
		out.println("   </head>");
		out.println("   <body>");
		try {
			RequestDispatcher disp = request.getRequestDispatcher("../navbar.jsp");
			disp.include(request, response);
		} catch (Exception ex) {
			out.println("Exception: " + ex.getMessage());
			out.println("	</body>");
			out.println("</html>");
		}
	}

	/**
	 * Prints the bottom of the HTML page
	 * 
	 * @param out
	 * @param request
	 * @param response
	 */
	public void footer(PrintWriter out, HttpServletRequest request, HttpServletResponse response) {
		try {
			RequestDispatcher disp = request.getRequestDispatcher("../pageEnd.jsp");
			disp.include(request, response);
			out.println("      <script src='../js/jquery.min.js'></script>");
			out.println("      <script src='../js/bootstrap.min.js'></script>");
			out.println(
					"      <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'"
					+ " integrity='sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=' crossorigin='anonymous'></script>");
			out.println(
					"      <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'"
					+ " integrity='sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49' crossorigin='anonymous'></script>");
			out.println(
					"      <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'"
					+ " integrity='sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy' crossorigin='anonymous'></script>        ");
			out.println(
					"      <script src='https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js'"
					+ " integrity='sha256-dHf/YjH1A4tewEsKUSmNnV05DDbfGN3g7NMq86xgGh8=' crossorigin='anonymous'></script>");
			out.println("   </body>");
			out.println("</html>");
		} catch (Exception ex) {
			out.println("Exception: " + ex.getMessage());
			out.println("	</body>");
			out.println("</html>");
		}
	}
}
