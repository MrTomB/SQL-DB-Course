/* Thomas Burch
   3/5/16
   CS180-Lab4
*/


import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		List<String> result = new ArrayList<String>();

		String result_phone;
		String cmd = "SELECT dv_address.phone "
					 + "FROM dv_address, mg_customers "
			         + "WHERE dv_address.address_id = mg_customers.address_id "
			         + "AND mg_customers.first_name = ? AND mg_customers.last_name = ?";

		// Retrieving results from ResultSet 
    	try (PreparedStatement stmt = connection.prepareStatement(cmd);)
    		{
    		stmt.setString(1, firstName);
    		stmt.setString(2, lastName);

		try (ResultSet res = stmt.executeQuery())
			{

			while(res.next()){
				result_phone = res.getString("phone");
				result.add(result_phone);
		}
			res.close();
			stmt.close();
		}
		catch (SQLException e) 
			{
				System.err.println("Error while executing query: " + e);
				e.printStackTrace();
			}
		}
		catch (SQLException e) 
		{
			System.err.println("Error while creating connection: " + e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();

		String result_title;

		String cmd = "SELECT dv_film.title "
					 + "FROM dv_film "
			         + "WHERE dv_film.length >= ? "
			         + "AND dv_film.length <= ?";

		// Retrieving results from ResultSet 
    	try (PreparedStatement stmt = connection.prepareStatement(cmd);)
    		{
    		stmt.setInt(1, minLength);
    		stmt.setInt(2, maxLength);

		try (ResultSet res = stmt.executeQuery())
			{

			while(res.next()){
				result_title = res.getString("title");
				result.add(result_title);
		}
			res.close();
			stmt.close();
		}
		catch (SQLException e) 
			{
				System.err.println("Error while executing query: " + e);
				e.printStackTrace();
			}
		}
		catch (SQLException e) 
		{
			System.err.println("Error while creating connection: " + e);
			e.printStackTrace();
		}

		return result;
	}


	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;

		String cmd = "SELECT Count(mg_customers.customer_id) "
					 + "FROM dv_address, mg_customers "
			         + "WHERE dv_address.address_id = mg_customers.address_id "
			         + "AND dv_address.district = ? AND mg_customers.active = ?";

		// Retrieving results from ResultSet 
    	try (PreparedStatement stmt = connection.prepareStatement(cmd);)
    		{
    		stmt.setString(1, districtName);
    		stmt.setBoolean(2, active);

		try (ResultSet res = stmt.executeQuery())
			{

			while(res.next()){
				result = res.getInt(1);
		}
			res.close();
			stmt.close();
		}
		catch (SQLException e) 
			{
				System.err.println("Error while executing query: " + e);
				e.printStackTrace();
			}
		}
		catch (SQLException e) 
		{
			System.err.println("Error while creating connection: " + e);
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerated type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
		
		String cmd = "INSERT into dv_film(title, description, length, rating) "
					 +"VALUES(?, ?, ?, ?::mpaa_rating)";

		// Retrieving results from ResultSet 
    	try (PreparedStatement stmt = connection.prepareStatement(cmd);)
    		{
    		stmt.setString(1, title);
    		stmt.setString(2, description);
    		stmt.setInt(3, length);
    		stmt.setString(4, rating);

		stmt.executeUpdate();
		
		}
		catch (SQLException e) 
			{
				System.err.println("Error while executing query: " + e);
				e.printStackTrace();
			}

	 }

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}



};
