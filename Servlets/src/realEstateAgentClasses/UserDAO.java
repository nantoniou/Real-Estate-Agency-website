package realEstateAgentClasses;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO includes methods that are used to handle the Users, by connecting to
 * the database; adapted from the third assignment of the ISM course
 *
 * @author ISM group 9
 *
 */
public class UserDAO {

	/**
	 * This method returns a List with all Users
	 *
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		List<User> users = new ArrayList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user;";
		try {
			stmt = con.prepareStatement(sql); // initialize stmt
			rs = stmt.executeQuery(); // execute query sql
			while (rs.next()) {
				users.add(new User(rs.getInt("userid"), rs.getString("fname"), rs.getString("lname"),
						rs.getString("email"), rs.getString("descriptionUser"), rs.getString("username"),
						rs.getString("userpassword"), rs.getString("userPhotoPath"), rs.getLong("phone"))); //!!!!!!!!!!!!!!
			}
			rs.close(); // Close ResultSet
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not fetch the users from the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}
		return users;

	} // End of getUsers

	/**
	 * Search user by username
	 *
	 * @param username,
	 *            String
	 * @return User, the User object
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE username = ?;";
		User user = null;
		try {
			stmt = con.prepareStatement(sql); // initialize stmt
			stmt.setString(1, username); // setting parameter
			rs = stmt.executeQuery(); // execute query sql
			if (!rs.next()) {
				return null;
			}
			user = new User(rs.getInt("userid"), rs.getString("fname"), rs.getString("lname"), rs.getString("email"),
					rs.getString("descriptionUser"), rs.getString("username"), rs.getString("userpassword"),
					rs.getString("userPhotoPath"), rs.getLong("phone")); //!!!!!!!!!!!
			rs.close(); // Close ResultSet
			stmt.close(); // close Statement stmt
		} catch (SQLException e) {
			throw new SQLException("Could not return the specified user from the database: " + e.getMessage());
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}
		return user;

	} // End of findUser

	/**
	 * Checks if the credentials are valid; if not, throws Exception
	 *
	 * @param username,
	 *            String
	 * @param password,
	 *            String
	 */
	public void authenticate(String username, String password) throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM user WHERE username = ? AND userpassword = ?;";
		try {
			stmt = con.prepareStatement(sql); // initialize stmt
			stmt.setString(1, username); // setting parameter username
			stmt.setString(2, password); // setting parameter password
			rs = stmt.executeQuery(); // execute query sql
			if (rs.next() == false) {
				throw new Exception("Wrong username or password");
			}
			rs.close(); // Close ResultSet
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not return the specified user from the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}

	} // End of authenticate

	/**
	 * Register/create a User to the database.
	 *
	 * @param user,
	 *            User
	 * @throws Exception,
	 *             if errors are encountered.
	 */
	public void registerUser(User user) throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO user(fname, lname, email, descriptionUser, username, userpassword, phone)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			// create the mysql insert preparedstatement
			stmt = con.prepareStatement(query);
			stmt.setString(1, user.getFname());
			stmt.setString(2, user.getLname());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getDescriptionUser());
			stmt.setString(5, user.getUsername());
			stmt.setString(6, user.getUserpassword());
			stmt.setLong(7, user.getPhone());
			stmt.executeUpdate();
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not register the specified user to the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}

	} // End of registerUser

	/**
	 * Adds the specific Listing to the User's favorites
	 * 
	 * @param user,
	 *            User
	 * @param houseid,
	 *            int
	 * @throws Exception
	 */
	public void addToFavourites(User user, int houseid) throws Exception {
		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO favourites VALUES (null, ? , ?);";
		try {
			// create the mysql insert preparedstatement
			stmt = con.prepareStatement(query);
			stmt.setInt(1, houseid);
			stmt.setInt(2, user.getUserid());
			stmt.executeUpdate();
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not add favourite property to the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}
	}

} // End of class
