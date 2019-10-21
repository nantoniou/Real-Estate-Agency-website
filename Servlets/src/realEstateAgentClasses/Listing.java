package realEstateAgentClasses;

/**
 * Public class Listing, that represents each specific Listing that appears on
 * the website
 * 
 * @author ISM group 9
 *
 */
public class Listing {
	private int houseid;
	private String title;
	private String descriptionHouse;
	private String area;
	private boolean forSale;
	private float sqm;
	private int price;
	private String floor;
	private int bedrooms;
	private String floortiles;
	private int bathrooms;
	private int constructionDate;
	private String heating;
	private boolean balcony;
	private boolean elevator;
	private boolean renovated;
	private boolean furnished;

	/**
	 * Constructor
	 * 
	 * @param houseid
	 * @param title
	 * @param descriptionHouse
	 * @param area
	 * @param forSale
	 * @param sqm
	 * @param price
	 * @param floor
	 * @param bedrooms
	 * @param floortiles
	 * @param bathrooms
	 * @param constructionDate
	 * @param heating
	 * @param balcony
	 * @param elevator
	 * @param renovated
	 * @param furnished
	 */
	public Listing(int houseid, String title, String descriptionHouse, String area, boolean forSale, float sqm,
			int price, String floor, int bedrooms, String floortiles, int bathrooms, int constructionDate,
			String heating, boolean balcony, boolean elevator, boolean renovated, boolean furnished) {
		this.houseid = houseid;
		this.title = title;
		this.descriptionHouse = descriptionHouse;
		this.area = area;
		this.forSale = forSale;
		this.sqm = sqm;
		this.price = price;
		this.floor = floor;
		this.bedrooms = bedrooms;
		this.floortiles = floortiles;
		this.bathrooms = bathrooms;
		this.constructionDate = constructionDate;
		this.heating = heating;
		this.balcony = balcony;
		this.elevator = elevator;
		this.renovated = renovated;
		this.furnished = furnished;
	}

	/**
	 * @return the houseid
	 */
	public int getHouseid() {
		return houseid;
	}

	/**
	 * @param houseid
	 *            the houseid to set
	 */
	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the descriptionHouse
	 */
	public String getDescriptionHouse() {
		return descriptionHouse;
	}

	/**
	 * @param descriptionHouse
	 *            the descriptionHouse to set
	 */
	public void setDescriptionHouse(String descriptionHouse) {
		this.descriptionHouse = descriptionHouse;
	}

	/**
	 * @return the area
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @param area
	 *            the area to set
	 */
	public void setArea(String area) {
		this.area = area;
	}

	/**
	 * @return the forSale
	 */
	public boolean isForSale() {
		return forSale;
	}

	/**
	 * @param forSale
	 *            the forSale to set
	 */
	public void setForSale(boolean forSale) {
		this.forSale = forSale;
	}

	/**
	 * @return the sqm
	 */
	public float getSqm() {
		return sqm;
	}

	/**
	 * @param sqm
	 *            the sqm to set
	 */
	public void setSqm(float sqm) {
		this.sqm = sqm;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return the floor
	 */
	public String getFloor() {
		return floor;
	}

	/**
	 * @param floor
	 *            the floor to set
	 */
	public void setFloor(String floor) {
		this.floor = floor;
	}

	/**
	 * @return the bedrooms
	 */
	public int getBedrooms() {
		return bedrooms;
	}

	/**
	 * @param bedrooms
	 *            the bedrooms to set
	 */
	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}

	/**
	 * @return the floortiles
	 */
	public String getFloortiles() {
		return floortiles;
	}

	/**
	 * @param floortiles
	 *            the floortiles to set
	 */
	public void setFloortiles(String floortiles) {
		this.floortiles = floortiles;
	}

	/**
	 * @return the bathrooms
	 */
	public int getBathrooms() {
		return bathrooms;
	}

	/**
	 * @param bathrooms
	 *            the bathrooms to set
	 */
	public void setBathrooms(int bathrooms) {
		this.bathrooms = bathrooms;
	}

	/**
	 * @return the constructionDate
	 */
	public int getConstructionDate() {
		return constructionDate;
	}

	/**
	 * @param constructionDate
	 *            the constructionDate to set
	 */
	public void setConstructionDate(int constructionDate) {
		this.constructionDate = constructionDate;
	}

	/**
	 * @return the heating
	 */
	public String getHeating() {
		return heating;
	}

	/**
	 * @param heating
	 *            the heating to set
	 */
	public void setHeating(String heating) {
		this.heating = heating;
	}

	/**
	 * @return the balcony
	 */
	public boolean isBalcony() {
		return balcony;
	}

	/**
	 * @param balcony
	 *            the balcony to set
	 */
	public void setBalcony(boolean balcony) {
		this.balcony = balcony;
	}

	/**
	 * @return the elevator
	 */
	public boolean isElevator() {
		return elevator;
	}

	/**
	 * @param elevator
	 *            the elevator to set
	 */
	public void setElevator(boolean elevator) {
		this.elevator = elevator;
	}

	/**
	 * @return the renovated
	 */
	public boolean isRenovated() {
		return renovated;
	}

	/**
	 * @param renovated
	 *            the renovated to set
	 */
	public void setRenovated(boolean renovated) {
		this.renovated = renovated;
	}

	/**
	 * @return the furnished
	 */
	public boolean isFurnished() {
		return furnished;
	}

	/**
	 * @param furnished
	 *            the furnished to set
	 */
	public void setFurnished(boolean furnished) {
		this.furnished = furnished;
	}

	/**
	 * toString
	 */
	@Override
	public String toString() {
		return "Listing [houseid=" + houseid + ", title=" + title + ", descriptionHouse=" + descriptionHouse + ", area="
				+ area + ", forSale=" + forSale + ", sqm=" + sqm + ", price=" + price + ", floor=" + floor
				+ ", bedrooms=" + bedrooms + ", floortiles=" + floortiles + ", bathrooms=" + bathrooms
				+ ", constructionDate=" + constructionDate + ", heating=" + heating + ", balcony=" + balcony
				+ ", elevator=" + elevator + ", renovated=" + renovated + ", furnished=" + furnished + "]";
	}

}
