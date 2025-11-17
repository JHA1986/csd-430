/*
 * ******************************************************************
 * Jonah Aney – Movie Database JavaBean 11/16/25
 * Bellevue University – CSD430 Module 5 & 6
 * This bean handles READ, CREATE, UPDATE, DELETE operations
 * for the jonah_movies_data table.
 * ******************************************************************
 */

package database;
public class DbBean implements java.io.Serializable {

    private static final long serialVersionUID = 111222333444L;

    java.sql.Connection connection;
    java.sql.Statement statement;

    // ---------------------------------------------------------------
    // ------------------------ Constructor ---------------------------
    // ---------------------------------------------------------------
    public DbBean() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/csd430?";
            connection = java.sql.DriverManager.getConnection(
                    url + "user=student1&password=pass");

            statement = connection.createStatement();
        }
        catch (Exception e) {
            System.out.println("SQL Exception: " + e);
        }
    }

    // ---------------------------------------------------------------
    // ------------------------ Create Record ------------------------
    // ---------------------------------------------------------------
    public void createRecord(String title, String director, int releaseYear,
                             String genre, String rating) {

        try {
            String sql = "INSERT INTO jonah_movies_data "
                    + "(title, director, release_year, genre, rating) "
                    + "VALUES (?, ?, ?, ?, ?)";

            java.sql.PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, releaseYear);
            ps.setString(4, genre);
            ps.setString(5, rating);

            ps.executeUpdate();
            ps.close();

        } catch (java.sql.SQLException e) {
            System.out.println("SQL Exception: " + e);
        }
    }

    // ---------------------------------------------------------------
    // ------------------------ Update Record ------------------------
    // ---------------------------------------------------------------
    public String updateRecord(int id, String title, String director,
                               int releaseYear, String genre, String rating) {

        try {
            String sql = "UPDATE jonah_movies_data "
                       + "SET title = ?, director = ?, release_year = ?, "
                       + "genre = ?, rating = ? WHERE id = ?";

            java.sql.PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, releaseYear);
            ps.setString(4, genre);
            ps.setString(5, rating);
            ps.setInt(6, id);

            ps.executeUpdate();
            ps.close();

        } catch (java.sql.SQLException e) {
            System.out.println("SQL Exception: " + e);
        }

        return "Record Updated";
    }

    // ---------------------------------------------------------------
    // ------------------------ Delete Record ------------------------
    // ---------------------------------------------------------------
    public String deleteRecord(int id) {

        try {
            String sql = "DELETE FROM jonah_movies_data WHERE id = " + id;
            statement.executeUpdate(sql);
        }
        catch (java.sql.SQLException e) {
            System.out.println("SQL Exception: " + e);
        }

        return "Record Deleted";
    }

    // ---------------------------------------------------------------
    // ------------------------ Read Single --------------------------
    // ---------------------------------------------------------------
    public String read(int id) {

        StringBuilder sb = new StringBuilder();
        java.sql.ResultSet rs = null;

        try {
            rs = statement.executeQuery(
                    "SELECT * FROM jonah_movies_data WHERE id = " + id);
        }
        catch (java.sql.SQLException e) {}

        try {
            sb.append("<table border='1' bgcolor='#FAFAD2'>");

            while (rs.next()) {
                sb.append("<tr>");
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    sb.append("<td>");
                    sb.append(rs.getString(i));
                    sb.append("</td>");
                }
                sb.append("</tr>");
            }

            sb.append("</table>");
        }
        catch (Exception e) {}

        return sb.toString();
    }

    // ---------------------------------------------------------------
    // ------------------------ Read All -----------------------------
    // ---------------------------------------------------------------
    public String readAll() {

        StringBuilder sb = new StringBuilder();
        java.sql.ResultSet rs = null;

        try {
            rs = statement.executeQuery("SELECT * FROM jonah_movies_data");
        }
        catch (java.sql.SQLException e) {}

        try {
            sb.append("<table border='1' bgcolor='#E0FFFF'>");

            while (rs.next()) {
                sb.append("<tr>");
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    sb.append("<td>");
                    sb.append(rs.getString(i));
                    sb.append("</td>");
                }
                sb.append("</tr>");
            }

            sb.append("</table>");
        }
        catch (Exception e) {}

        return sb.toString();
    }

 // ---------------------------------------------------------------
 // ------------------------ Form Get PK --------------------------
 // Dropdown of movie IDs for selection (Instructor Version)
 // ---------------------------------------------------------------
 public String formGetPK(String requestURL) {

     StringBuilder sb = new StringBuilder();
     java.sql.ResultSet rs = null;

     try {
         rs = statement.executeQuery(
             "SELECT id, title FROM jonah_movies_data ORDER BY id ASC"
         );
     }
     catch (java.sql.SQLException e) {}

     sb.append("<form method='post' action='" + requestURL + "'>");
     sb.append("<label>Select Movie ID:</label><br/>");
     sb.append("<select name='movie_id'>");

     try {
         while (rs.next()) {
             int id = rs.getInt("id");
             String title = rs.getString("title");

             sb.append("<option value='" + id + "'>");
             sb.append(id + " – " + title);
             sb.append("</option>");
         }
     }
     catch (java.sql.SQLException e) {}

     sb.append("</select>");
     sb.append("<input type='submit' value='Submit'>");
     sb.append("</form>");

     return sb.toString();
 }

 //---------------------------------------------------------------
 //------------------------ Get ID By Title ---------------------
 //---------------------------------------------------------------
 public int getIdByTitle(String title) {
   int id = -1;
   try {
       java.sql.PreparedStatement ps = connection.prepareStatement(
           "SELECT id FROM jonah_movies_data WHERE title = ?"
       );
       ps.setString(1, title);
       java.sql.ResultSet rs = ps.executeQuery();

       if(rs.next()) {
           id = rs.getInt("id");
       }

       rs.close();
       ps.close();
   } catch (java.sql.SQLException e) {
       System.out.println("SQL Exception in getIdByTitle: " + e.getMessage());
   }

   return id;
 }
 
    // ---------------------------------------------------------------
    // ------------------------ Close Connection ---------------------
    // ---------------------------------------------------------------
    public void closeConnection() {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
        catch (java.sql.SQLException e) {
            System.out.println("SQL Exception: " + e);
        }
    }
}
