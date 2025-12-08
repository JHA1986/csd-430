<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/30/25 Updated 12/07/25
  Bellevue University – CSD430 Module 8
  Movie Database JSP – CRUD_Read
  Description:
     This JSP file handles the READ operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Movie Record</title>
</head>
<body>
<h1>Read Movie</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<%
if(request.getMethod().equals("POST")) {
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    out.println("<h2>Selected Movie:</h2>");
    out.print(myDB.readByIdAsTable(movieId)); 
    out.println("<br><h2>All Movies:</h2>");
    out.print(myDB.readAll());
} else {
// Display dropdown to select movie
    out.print(myDB.formGetPK("CRUD_Read.jsp"));
}
%>
</body>
</html>


