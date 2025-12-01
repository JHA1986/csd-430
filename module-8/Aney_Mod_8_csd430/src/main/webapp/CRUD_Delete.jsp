<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/30/25
  Bellevue University – CSD430 Module 8
  Movie Database JSP – CRUD_Delete
  Description:
     This JSP file handles the Delete operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Movie Record</title>
</head>
<body>
<h1>Delete Movie</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<%
if(request.getMethod().equals("POST")) {
    int movieId = Integer.parseInt(request.getParameter("movie_id"));

    myDB.deleteRecord(movieId);

    out.println("<h2>Movie Deleted:</h2>");
    out.println("Movie with ID " + movieId + " has been deleted.");
    out.println("<br><h2>All Remaining Movies:</h2>");
    out.print(myDB.readAll());
} else {
// Display dropdown to select movie
    out.print(myDB.formGetPK("CRUD_Delete.jsp"));
}
%>
</body>
</html>
