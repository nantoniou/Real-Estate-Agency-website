package realEstateAgentClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Public class used to connect to the database; adopted from the third
 * assignment of ISM
 */
public class DB {

	/* Database connection settings are hidden on Github */
	private final String dbServer = "*****";
	private final String dbServerPort = "*****";
	private final String dbName = "*****";
	private final String dbusername = "*****";
	private final String dbpassword = "*****";

	private Connection con = null;

	/**
	 * Establishes a connection with the database, initializes and returns the
	 * Connection object.
	 * 
	 * @return Connection, the Connection object
	 * @throws Exception
	 */
	public Connection getConnection() throws Exception {

		try {

			// Dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			throw new Exception("MySQL Driver error: " + e.getMessage());
		}

		try {

			con = DriverManager.getConnection("jdbc:mysql://" + dbServer + ":" + dbServerPort + "/" + dbName,
					dbusername, dbpassword);

			return con;

		} catch (Exception e) {
			throw new Exception("Could not establish connection with the Database Server: " + e.getMessage());
		}

	} // End of getConnection

	/**
	 * Close database connection and release any other database resources.
	 * 
	 * @throws SQLException
	 */
	public void close() throws SQLException {

		try {

			// if connection is (still) open
			if (con != null)
				con.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
		}

	}// end of close

} // End of class
