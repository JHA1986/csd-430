<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/30/25 Updated 12/07/25
  Bellevue University – CSD430 Module 8
  Movie Database JSP – CRUD_Create
  Description:
     This JSP file handles the Create operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Movie Record</title>
</head>
<body>
<h1>Create Movie</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<%
if(request.getMethod().equals("POST")) {
// Get form parameters
    String title = request.getParameter("movie_title");
    String director = request.getParameter("director");
    int releaseYear = Integer.parseInt(request.getParameter("release_year"));
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");

// Insert into DB
    myDB.createRecord(title, director, releaseYear, genre, rating);

    out.println("<h2>New Movie Added:</h2>");
    out.print("<h2>Movie List After Insert:</h2>");
    out.println("<br><h2>All Movies:</h2>");
    out.print(myDB.readAll());
} else {
// Display form to create new movie
%>
<form method="post" action="CRUD_Create.jsp">
    Title: <input type="text" name="movie_title" required><br>
    Director: <input type="text" name="director" required><br>
    Release Year: <input type="number" name="release_year" required><br>
    Genre: <input type="text" name="genre" required><br>
    Rating: <input type="text" name="rating" required><br>
    <input type="submit" value="Add Movie">
</form>
<%
}
%>
</body>
</html>

