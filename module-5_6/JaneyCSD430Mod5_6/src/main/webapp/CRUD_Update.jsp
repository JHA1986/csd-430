<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/16/25
  Bellevue University – CSD430 Module 5 & 6
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

<h1>Update Movie Record</h1>

<jsp:useBean id='myDB' class='database.DbBean' />

<br /> <a href="index_02.html">Movie Database Menu</a> <br /><br />

<%
if(request.getMethod().equals("GET")) {
// Display dropdown of existing movie titles
    out.print(myDB.formGetPK("CRUD_Update.jsp"));
}
%>

<%
if(request.getMethod().equals("POST")) {
    String title = request.getParameter("movie_title");
    String newDirector = request.getParameter("director");
    int newYear = Integer.parseInt(request.getParameter("release_year"));
    String newGenre = request.getParameter("genre");
    String newRating = request.getParameter("rating");

// First, get the ID of the selected movie
// We'll assume you have a method to get ID by title
    int id = myDB.getIdByTitle(title);

// Update the movie record
    myDB.updateRecord(id, title, newDirector, newYear, newGenre, newRating);

// Display updated record
    out.println("<h3>Updated Movie:</h3>");
    out.print(myDB.read(id));

    out.println("<br /><h3>All Movies:</h3>");
    out.print(myDB.readAll());
}
%>

</body>
</html>
