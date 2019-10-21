package realEstateAgentClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

/**
 * Public class ListingDAO is responsible for assisting the communication
 * between the database and the website components by providing handling methods
 * for the Listing class
 * 
 * @author ISM group 9
 *
 */
public class ListingDAO {

	/**
	 * The public method searchListings searches the database for listings that
	 * fulfill the conditions of the parameters passed
	 * 
	 * @param typeParameter,
	 *            if the listing is for sale or for renting
	 * @param area,
	 *            the location of the listing, or the value used if not specified
	 * @param size,
	 *            the range of the size (sq.m.) of the listing, , or the value used
	 *            if not specified
	 * @param minpri,
	 *            the minimum price of the listing, or the value used if not
	 *            specified
	 * @param maxpri,
	 *            the maximum price of the listing, or the value used if not
	 *            specified
	 * @return a List of Listing objects
	 * @throws Exception
	 */
	public static List<Listing> searchListings(String typeParameter, String area, String size, String minpri,
			String maxpri) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		boolean type;
		List<Listing> listings = new ArrayList<>();

		if (typeParameter.equals("Προς πώληση") || typeParameter.equals("prosPolisi")) {
			type = true;
		} else {
			type = false;
		}
		String[] range = size.split("-"); // splits the range to two specific values, if a range is specified
		String sql = "select * " + "from listing " + "where forSale = ? and " + "(area = ? or ? = 'Περιοχή') and "
				+ "((sqm >= ? and sqm <= ?) or ? = 'Έκταση (τ.μ.)') and " + "(price >= ? or ? = '') and "
				+ "(price <= ? or ? = '');";

		try {
			DB database = new DB();
			con = database.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setBoolean(1, type);
			stmt.setString(2, area);
			stmt.setString(3, area);
			stmt.setString(4, range[0]);
			if (range.length != 1) { // if the range is specified
				stmt.setString(5, range[1]);
			} else {
				stmt.setString(5, "0");
			}
			stmt.setString(6, range[0]);
			stmt.setString(7, minpri);
			stmt.setString(8, minpri);
			stmt.setString(9, maxpri);
			stmt.setString(10, maxpri);
			rs = stmt.executeQuery();
			while (rs.next()) {
				listings.add(new Listing(rs.getInt("houseid"), rs.getString("title"), rs.getString("descriptionHouse"),
						rs.getString("area"), rs.getBoolean("forSale"), rs.getFloat("sqm"), rs.getInt("price"),
						rs.getString("floor"), rs.getInt("bedrooms"), rs.getString("floortiles"),
						rs.getInt("bathrooms"), rs.getInt("constructionDate"), rs.getString("heating"),
						rs.getBoolean("balcony"), rs.getBoolean("elevator"), rs.getBoolean("renovated"),
						rs.getBoolean("furnished")));
			}
			return listings;

		} finally {
			con.close();
			rs.close();
			stmt.close();
		}
	}

	/**
	 * Method used to find the favorite listings of the specified user.
	 * 
	 * @param userid
	 * @return List of Listing objects that the user has added to favorites
	 * @throws Exception
	 */
	public static List<Listing> searchFavs(int userid) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		List<Listing> favs = new ArrayList<>();
		String sql = "select distinct favourites.houseid, title, descriptionHouse, area, forSale, sqm, price, floor, bedrooms, "
				+ "floortiles, bathrooms, constructionDate, heating,balcony, elevator, renovated,  furnished"
				+ " from favourites inner join listing where favourites.houseid = listing.houseid and userid = ?;";
		try {
			DB database = new DB();
			con = database.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				favs.add(new Listing(rs.getInt("houseid"), rs.getString("title"), rs.getString("descriptionHouse"),
						rs.getString("area"), rs.getBoolean("forSale"), rs.getFloat("sqm"), rs.getInt("price"),
						rs.getString("floor"), rs.getInt("bedrooms"), rs.getString("floortiles"),
						rs.getInt("bathrooms"), rs.getInt("constructionDate"), rs.getString("heating"),
						rs.getBoolean("balcony"), rs.getBoolean("elevator"), rs.getBoolean("renovated"),
						rs.getBoolean("furnished")));
			}
			return favs;
		} finally {
			con.close();
			rs.close();
			stmt.close();
		}
	}

	/**
	 * Searches the database for photos of the specified listing and returns the
	 * first that is found.
	 * 
	 * @param hid,
	 *            the listing id
	 * @return
	 * @throws Exception
	 */
	public static String findPhotos(int hid) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		String sql = "Select * from housePictures where house = ? limit 1";
		try {
			DB database = new DB();
			con = database.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, hid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getString("picPath");
			} else {
				return "images/noPhotoAvailable.jpg";
			}
		} finally {
			con.close();
			rs.close();
			stmt.close();
		}
	}


	/**
	 * Register/create a User to the database.
	 *
	 * @param listing,
	 *            User
	 * @throws Exception,
	 *             if encounter any error.
	 */
	public void registerListing(Listing listing) throws Exception {

		DB database = new DB();
		Connection con = database.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO listing VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			// create the mysql insert preparedstatement
			stmt = con.prepareStatement(query);
			stmt.setInt(1, listing.getHouseid());
			stmt.setString(2, listing.getTitle());
			stmt.setString(3, listing.getDescriptionHouse());
			stmt.setString(4, listing.getArea());
			stmt.setBoolean(5, listing.isForSale());
			stmt.setFloat(6, listing.getSqm());
			stmt.setInt(7, listing.getPrice());
			stmt.setString(8, listing.getFloor());
			stmt.setInt(9, listing.getBedrooms());
			stmt.setString(10, listing.getFloortiles());
			stmt.setInt(11, listing.getBathrooms());
			stmt.setInt(12, listing.getConstructionDate());
			stmt.setString(13, listing.getHeating());
			stmt.setBoolean(14, listing.isBalcony());
			stmt.setBoolean(15, listing.isElevator());
			stmt.setBoolean(16, listing.isRenovated());
			stmt.setBoolean(17, listing.isFurnished());
			stmt.executeUpdate();
			stmt.close(); // close Statement stmt
		} catch (Exception e) {
			throw new Exception("Could not register the specified listing to the database: " + e.getMessage());
		} finally {
			database.close(); // Close connection with the database
		}

	} // End of registerUser
}
