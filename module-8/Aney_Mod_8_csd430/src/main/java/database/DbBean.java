/*
 * ******************************************************************
 * Jonah Aney – Movie Database JavaBean 11/30/25
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
// -------------------- Constructor --------------------
// -----------------------------------------------------   
    public DbBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/csd430";
            connection = DriverManager.getConnection(url, "student1", "pass");
            statement = connection.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Database connection error: " + e);
        }
    }

// -------------------------------------------------------   
// -------------------- Create Record --------------------
// -------------------------------------------------------   
    public void createRecord(String title, String director, int releaseYear, String genre, String rating) {
        String sql = "INSERT INTO jonah_movies_data(title, director, release_year, genre, rating) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setInt(3, releaseYear);
            ps.setString(4, genre);
            ps.setString(5, rating);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting movie: " + e);
        }
    }

// ---------------------------------------------------------------   
// -------------------- Read One Record by ID --------------------
// ---------------------------------------------------------------
    public String readById(int id) {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT * FROM jonah_movies_data WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            sb.append("<table border='1' bgcolor='FA8072'>");
            sb.append("<tr><th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th></tr>");
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
            sb.append("Error reading record: ").append(e);
        }
        return sb.toString();
    }

// ----------------------------------------------------------      
// -------------------- Read All Records --------------------
// ----------------------------------------------------------   
    public String readAll() {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT * FROM jonah_movies_data ORDER BY release_year ASC";
        try (ResultSet rs = statement.executeQuery(sql)) {
            sb.append("<table border='1' bgcolor='FFFF00'>");
            sb.append("<tr><th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th></tr>");
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
            sb.append("Error reading all records: ").append(e);
        }
        return sb.toString();
    }

// -------------------------------------------------------   
// -------------------- Update Record --------------------
// -------------------------------------------------------   
    public void updateRecord(int id, String title, String director, String genre, String rating) {
        String sql = "UPDATE jonah_movies_data SET title = ?, director = ?, genre = ?, rating = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, director);
            ps.setString(3, genre);
            ps.setString(4, rating);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating movie: " + e);
        }
    }

// -------------------------------------------------------   
// -------------------- Delete Record --------------------
// -------------------------------------------------------   
    public void deleteRecord(int id) {
        String sql = "DELETE FROM jonah_movies_data WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting movie: " + e);
        }
    }

// --------------------------------------------------------------------------------
// -------------------- Generate Dropdown for Selecting Record --------------------
// --------------------------------------------------------------------------------   
    public String formGetPK(String requestURL) {
        StringBuilder form = new StringBuilder();
        try {
            ResultSet rs = statement.executeQuery("SELECT id, release_year, title FROM jonah_movies_data ORDER BY release_year ASC");

            form.append("<form method='post' action='").append(requestURL).append("'>");
            form.append("<label>Select Movie:</label>");
            form.append("<select name='id'>");

            while (rs.next()) {
                int id = rs.getInt("id");
                int year = rs.getInt("release_year");
                String title = rs.getString("title");
                form.append("<option value='").append(id).append("'>").append(year).append(" - ").append(title).append("</option>");
            }

            form.append("</select>");
            form.append("<input type='submit' value='Submit'>");
            form.append("</form>");

        } catch (SQLException e) {
            form.append("Database connection error: ").append(e.getMessage());
        }

        return form.toString();
    }

// ----------------------------------------------------------  
// -------------------- Close Connection --------------------
// ----------------------------------------------------------
    public void closeConnection() {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Error closing DB: " + e);
        }
    }
}
