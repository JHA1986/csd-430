<%-- 
  ************************************************************
  Jonah Aney – Movie Database 12/06/25
  Bellevue University – CSD430 Module 9
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
<title>CRUD Delete</title>
</head>
<body>

<h1>Delete Movie Record</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<br/><a href="index.html">Home</a><br/><br/>

<%
// First page load – Show the dropdown and table
    if (request.getMethod().equals("GET")) {

// Dropdown showing all movie IDs
        String dropdown = myDB.formGetPK("CRUD_Delete.jsp");

        out.print(dropdown);
        out.print("<br/>");

// Show all movies in table format
        out.print(myDB.readAll());
    }
%>

<%
// Form submitted – Perform delete and redisplay page
    if (request.getMethod().equals("POST")) {

// Get selected movie ID
        int id = Integer.parseInt(request.getParameter("id"));

// Delete the movie
        myDB.deleteRecord(id);

        out.println("<h3>Movie with ID " + id + " deleted.</h3>");

// Show remaining movies
        out.print(myDB.readAll());
        out.print("<br/>");

// Show updated dropdown even if empty
        out.print(myDB.formGetPK("CRUD_Delete.jsp"));
    }
%>

</body>
</html>
