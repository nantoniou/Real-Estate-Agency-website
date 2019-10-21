package realEstateAgentClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Class that is called from the MessageController servlet and creates a new
 * message entry in the database.
 * 
 * @author ISM group 9
 *
 */
public class MessageHandling {

	public void newMessage(Message message) throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO messages VALUES (null, ?, ?, ?, ?, ?, ?, NOW());";
		try {
			// create the mysql insert preparedstatement
			stmt = con.prepareStatement(query);
			stmt.setInt(1, message.getUid());
			stmt.setString(2, message.getName());
			stmt.setString(3, message.getSurname());
			stmt.setString(4, message.getEmail());
			stmt.setString(5, message.getNeed());
			stmt.setString(6, message.getMessage());
			stmt.executeUpdate();
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not add the message to the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}
	}
}
