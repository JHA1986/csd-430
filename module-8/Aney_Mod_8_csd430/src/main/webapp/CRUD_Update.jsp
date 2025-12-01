<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/30/25
  Bellevue University – CSD430 Module 8
  Movie Database JSP – CRUD_Update
  Description:
     This JSP file handles the Update operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Movie Record</title>
</head>
<body>

<h1>Update Movie</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<%
if(request.getMethod().equals("GET")) {
// Show dropdown of movie IDs to select which movie to update
    out.print(myDB.formGetPK("CRUD_Update.jsp"));
} else if(request.getMethod().equals("POST")) {
// Get the selected movie ID from dropdown
    int movieId = Integer.parseInt(request.getParameter("id"));

// Get updated values from form submission
    String title = request.getParameter("movie_title");
    String director = request.getParameter("director");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");

// Update record in database
    myDB.updateRecord(movieId, title, director, genre, rating);

// Display the updated movie
    out.println("<h2>Updated Movie:</h2>");
    out.print(myDB.readById(movieId));

// Display all movies
    out.println("<br><h2>All Movies:</h2>");
    out.print(myDB.readAll());
}
%>

</body>
</html>
