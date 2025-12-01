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
        		     "('Batman', 'Tim Burton', 1989, 'Superhero', 'PG-13')," +
        		     "('Batman Begins', 'Christopher Nolan', 2005, 'Superhero', 'PG-13')," +
        		     "('The Dark Knight', 'Christopher Nolan', 2008, 'Superhero', 'PG-13')," +
        		     "('That Thing You Do', 'Tom Hanks', 1996, 'Comedy/Drama', 'PG')," +
        		     "('Breach', 'Billy Ray', 2007, 'Thriller', 'PG-13')," +
        		     "('The Shawshank Redemption', 'Frank Darabont', 1994, 'Thriller/Drama', 'R')," +
        		     "('Catch Me If You Can', 'Steven Spielberg', 2002, 'Crime/Comedy', 'PG-13')," +
        		     "('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'R')," +
        		     "('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'PG-13')," +
        		     "('Hook', 'Steven Speilberg', 1991, 'Adventure', 'PG')";
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
