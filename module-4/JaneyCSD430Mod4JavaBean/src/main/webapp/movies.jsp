<!--
Jonah Aney 11/09/26 CSD-430 Module-4 JavaBean

Directions:
For this week’s assignment you will create a JavaBean to hold some data. You will then use a JSP page to gather data from the JavaBean and display it in a nicely formatted display. For the JavaBean, use the data from your Module 2 Java Scriplet - Data Display assignment.
For this assignment you will need to:

    Document your code.
    Use Scriptlets for holding Java code.
    All HTML tags will be outside of Java Scriptlets.
    Display data in an HTML table format.
    Include other display items such as field and recode descriptions, title, and overall data description.
    Ensure the JavaBean implements java.io.Serializable.
    Data input will have a minimum of 5 fields.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Movie" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Data from JavaBean</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <h1>My Favorite Movies (JavaBean Example)</h1>
    <p>This page uses a JavaBean to hold data for each movie. 
    The JSP scriptlet retrieves movie data and displays it in an HTML table.</p>

    <%
// Create a list of Movie objects to disply in the table
        List<Movie> movieList = new ArrayList<Movie>();
        movieList.add(new Movie("Batman", "Action/Drama", "1989", "Tim Burton", "PG-13"));
        movieList.add(new Movie("The Dark Knight", "Action/Drama", "2008", "Christopher Nolan", "PG-13"));
        movieList.add(new Movie("Ghostbusters", "Science Fiction/Comedy", "1984", "Ivan Reitman", "PG"));
        movieList.add(new Movie("The Shawshank Redemption", "Drama", "1994", "Frank Darabont", "R"));
        movieList.add(new Movie("That Thing You Do", "Family/Comedy", "1996", "Tom Hanks", "PG"));
    %>

    <table>
        <tr>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Director</th>
            <th>Rating</th> 
        </tr>

        <%
            for (Movie m : movieList) {
        %>
            <tr>
                <td><%= m.getTitle() %></td>
                <td><%= m.getGenre() %></td>
                <td><%= m.getReleaseYear() %></td>
                <td><%= m.getDirector() %><td>
                <td><%= m.getRating() %><td>
            </tr>
        <%
            }
        %>
    </table>

    <footer>
        <p>Jonah Aney | CSD-430 Server-Side Development | Module-4 Assignment</p>
    </footer>
</body>
</html>
