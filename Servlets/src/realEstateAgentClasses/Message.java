package realEstateAgentClasses;

public class Message {
	
	private String name;
	private String surname;
	private String email;
	private String need;
	private String message;
	private int uid;
	
	/**
	 * @param name
	 * @param surname
	 * @param email
	 * @param need
	 * @param message
	 * @param uid
	 */
	public Message(String name, String surname, String email, String need, String message, int uid) {
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.need = need;
		this.message = message;
		this.uid = uid;
	}
	/**
	 * @return the uid
	 */
	public int getUid() {
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(int uid) {
		this.uid = uid;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}
	/**
	 * @param surname the surname to set
	 */
	public void setSurname(String surname) {
		this.surname = surname;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the need
	 */
	public String getNeed() {
		return need;
	}
	/**
	 * @param need the need to set
	 */
	public void setNeed(String need) {
		this.need = need;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Message [name=" + name + ", surname=" + surname + ", email=" + email + ", need=" + need + ", message="
				+ message + ", uid=" + uid + "]";
	}
	
	
	
}
