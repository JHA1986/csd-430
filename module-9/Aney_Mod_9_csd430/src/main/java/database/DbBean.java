/*
 * ******************************************************************
 * Jonah Aney – Movie Database JavaBean 11/30/25 Updated 12/07/25
 * Bellevue University – CSD430 Module 8
 * This bean handles READ, CREATE, UPDATE, DELETE operations
 * for the jonah_movies_data table.
 * ******************************************************************
 */

package database;

import java.sql.*;
import java.io.Serializable;

public class DbBean implements Serializable {

    private static final long serialVersionUID = 123456789L;
    private Connection connection;
    private Statement statement;

    // -----------------------------------------------------
    // -----------Constructor: Connect to DB ---------------
    // -----------------------------------------------------
    public DbBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/csd430";
            connection = DriverManager.getConnection(url, "student1", "pass");
            statement = connection.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("DB Connection Error: " + e);
        }
    }

    // -----------------------------------------------------
    // ----------Create a new movie record------------------
    // -----------------------------------------------------
    public void createRecord(String title, String director, int releaseYear,
                             String genre, String rating) {
        String sql = "INSERT INTO jonah_movies_data(title, director, release_year, genre, rating) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, releaseYear);
            ps.setString(4, genre);
            ps.setString(5, rating);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Create error: " + e);
        }
    }

    // -----------------------------------------------------
    // Return a single record as a ResultSet (for JSP forms)
    // -----------------------------------------------------
    public ResultSet readByIdAsRS(int id) {
        try {
            String sql = "SELECT * FROM jonah_movies_data WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("readByIdAsRS error: " + e);
            return null;
        }
    }

    // -----------------------------------------------------
    // --Return a single record formatted as an HTML table--
    // -----------------------------------------------------
    public String readByIdAsTable(int id) {
        StringBuilder sb = new StringBuilder();

        try {
            String sql = "SELECT * FROM jonah_movies_data WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            sb.append("<table border='1' bgcolor='#D3D3D3'>");
            sb.append("<tr><th>ID</th><th>Title</th><th>Director</th>")
              .append("<th>Year</th><th>Genre</th><th>Rating</th></tr>");

            if (rs.next()) {
                sb.append("<tr>");
                sb.append("<td>").append(rs.getInt("id")).append("</td>");
                sb.append("<td>").append(rs.getString("title")).append("</td>");
                sb.append("<td>").append(rs.getString("director")).append("</td>");
                sb.append("<td>").append(rs.getInt("release_year")).append("</td>");
                sb.append("<td>").append(rs.getString("genre")).append("</td>");
                sb.append("<td>").append(rs.getString("rating")).append("</td>");
                sb.append("</tr>");
            }

            sb.append("</table>");

        } catch (SQLException e) {
            return "readByIdAsTable error: " + e;
        }

        return sb.toString();
    }

    // -----------------------------------------------------
    // -------------------Read all movies-------------------
    // -----------------------------------------------------
    public String readAll() {
        StringBuilder sb = new StringBuilder();

        try (ResultSet rs = statement.executeQuery(
                "SELECT * FROM jonah_movies_data ORDER BY release_year ASC")) {

            sb.append("<table border='1' bgcolor='FFFF99'>");
            sb.append("<tr><th>ID</th><th>Title</th><th>Director</th>")
              .append("<th>Year</th><th>Genre</th><th>Rating</th></tr>");

            while (rs.next()) {
                sb.append("<tr>");
                sb.append("<td>").append(rs.getInt("id")).append("</td>");
                sb.append("<td>").append(rs.getString("title")).append("</td>");
                sb.append("<td>").append(rs.getString("director")).append("</td>");
                sb.append("<td>").append(rs.getInt("release_year")).append("</td>");
                sb.append("<td>").append(rs.getString("genre")).append("</td>");
                sb.append("<td>").append(rs.getString("rating")).append("</td>");
                sb.append("</tr>");
            }

            sb.append("</table>");

        } catch (SQLException e) {
            sb.append("readAll error: ").append(e);
        }

        return sb.toString();
    }

    // -----------------------------------------------------
    // --------FULL Update (including release_year)---------
    // -----------------------------------------------------
    public void updateRecordFull(int id, String title, String director,
                                 int releaseYear, String genre, String rating) {

        String sql = "UPDATE jonah_movies_data SET title=?, director=?, "
                   + "release_year=?, genre=?, rating=? WHERE id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, releaseYear);
            ps.setString(4, genre);
            ps.setString(5, rating);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update error: " + e);
        }
    }

    // -----------------------------------------------------
    // --------------------Delete by ID---------------------
    // -----------------------------------------------------
    public void deleteRecord(int id) {
        try (PreparedStatement ps = connection.prepareStatement(
                "DELETE FROM jonah_movies_data WHERE id = ?")) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Delete error: " + e);
        }
    }

    // -----------------------------------------------------
    // -------Dropdown list for selecting movie by PK-------
    // -----------------------------------------------------
    public String formGetPK(String requestURL) {

        StringBuilder form = new StringBuilder();

        try (ResultSet rs = statement.executeQuery(
                "SELECT id, title, release_year FROM jonah_movies_data ORDER BY release_year ASC")) {

            form.append("<form method='post' action='").append(requestURL).append("'>");
            form.append("<label>Select Movie:</label>");
            form.append("<select name='id'>");

            while (rs.next()) {
                form.append("<option value='")
                        .append(rs.getInt("id")).append("'>")
                        .append(rs.getInt("release_year")).append(" - ")
                        .append(rs.getString("title")).append("</option>");
            }

            form.append("</select>");
            form.append("<input type='submit' value='Submit'>");
            form.append("</form>");

        } catch (SQLException e) {
            return "Dropdown error: " + e;
        }

        return form.toString();
    }

    // -----------------------------------------------------
    // -----------------Close DB connection-----------------
    // -----------------------------------------------------
    public void closeConnection() {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Close error: " + e);
        }
    }
}
