package realEstateAgentClasses;

/**
 * Public class User, that represents each specific User that has an account on
 * the website
 * 
 * @author ISM group 9
 *
 */
public class User {

	private int userid;
	private String fname;
	private String lname;
	private String email;
	private String descriptionUser;
	private String username;
	private String userpassword;
	private String userPhotoPath;
	private long phone;

	/**
	 * Constructor
	 * 
	 * @param userid
	 * @param fname
	 * @param lname
	 * @param email
	 * @param descriptionUser
	 * @param username
	 * @param userpassword
	 * @param userPhotoPath
	 * @param phone
	 */
	public User(int userid, String fname, String lname, String email, String descriptionUser, String username,
			String userpassword, String userPhotoPath, long phone) {
		this.userid = userid;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.descriptionUser = descriptionUser;
		this.username = username;
		this.userpassword = userpassword;
		this.userPhotoPath = userPhotoPath;
		this.phone = phone;
	}

	/**
	 * @return the userid
	 */
	public int getUserid() {
		return userid;
	}

	/**
	 * @param userid
	 *            the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}

	/**
	 * @return the fname
	 */
	public String getFname() {
		return fname;
	}

	/**
	 * @param fname
	 *            the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}

	/**
	 * @return the lname
	 */
	public String getLname() {
		return lname;
	}

	/**
	 * @param lname
	 *            the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the descriptionUser
	 */
	public String getDescriptionUser() {
		return descriptionUser;
	}

	/**
	 * @param descriptionUser
	 *            the descriptionUser to set
	 */
	public void setDescriptionUser(String descriptionUser) {
		this.descriptionUser = descriptionUser;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the userpassword
	 */
	public String getUserpassword() {
		return userpassword;
	}

	/**
	 * @param userpassword
	 *            the userpassword to set
	 */
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	/**
	 * @return the userPhotoPath
	 */
	public String getUserPhotoPath() {
		return userPhotoPath;
	}

	/**
	 * @param userPhotoPath
	 *            the userPhotoPath to set
	 */
	public void setUserPhotoPath(String userPhotoPath) {
		this.userPhotoPath = userPhotoPath;
	}

	/**
	 * @return the phone
	 */
	public long getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(int phone) {
		this.phone = phone;
	}

	/**
	 * toString
	 */
	@Override
	public String toString() {
		return "User [userid=" + userid + ", fname=" + fname + ", lname=" + lname + ", email=" + email
				+ ", descriptionUser=" + descriptionUser + ", username=" + username + ", userpassword=" + userpassword
				+ ", userPhotoPath=" + userPhotoPath + ", phone=" + phone + "]";
	}

}
