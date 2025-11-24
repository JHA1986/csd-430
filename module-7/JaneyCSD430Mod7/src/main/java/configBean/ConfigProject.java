package configBean;

public class ConfigProject {

    java.sql.Connection connection;
    java.sql.Statement statement;

    public ConfigProject() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/csd430?";
            connection = java.sql.DriverManager.getConnection(
                url + "user=student1&password=pass");
            statement = connection.createStatement();
        } catch(Exception e) {
            System.out.println("SQL Exception: " + e);
        }
    }

    public String createTable() {
        String sql = "CREATE TABLE IF NOT EXISTS jonah_movies_data (" +
                     "id INT NOT NULL PRIMARY KEY AUTO_INCREMENT," +
                     "title VARCHAR(100)," +
                     "director VARCHAR(100)," +
                     "release_year INT," +
                     "genre VARCHAR(50)," +
                     "rating VARCHAR(10)" +
                     ")";
        try {
            statement.executeUpdate(sql);
            return "Table 'jonah_movies_data' created successfully.";
        } catch(Exception e) {
            return "Error creating table: " + e.getMessage();
        }
    }

    public String populateTable() {
        String sql = "INSERT INTO jonah_movies_data (title, director, release_year, genre, rating) VALUES " +
                     "('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 'PG-13')," +
                     "('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'R')," +
                     "('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'R')," +
                     "('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama', 'R')," +
                     "('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'PG-13')";
        try {
            statement.executeUpdate(sql);
            return "Table populated successfully.";
        } catch(Exception e) {
            return "Error populating table: " + e.getMessage();
        }
    }

    public String read() {
        StringBuilder sb = new StringBuilder();
        try {
            java.sql.ResultSet rs = statement.executeQuery("SELECT * FROM jonah_movies_data");
            sb.append("<table border='1' bgcolor='#FAFAD2'>");
            sb.append("<thead><tr><th>ID</th><th>Title</th><th>Director</th><th>Year</th><th>Genre</th><th>Rating</th></tr></thead>");
            while(rs.next()) {
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
        } catch(Exception e) {
            sb.append("Error reading table: ").append(e.getMessage());
        }
        return sb.toString();
    }
}
