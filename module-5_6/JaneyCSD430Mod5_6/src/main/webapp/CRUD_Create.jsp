<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/16/25
  Bellevue University – CSD430 Module 5 & 6
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

<h1>Create Movie Record</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<a href="index_02.html">Home</a><br/><br/>

<%
if (request.getMethod().equals("GET")) {
    out.println("<form method='post' action='CRUD_Create.jsp'>");

    out.println("Title: <input type='text' name='title'><br/>");
    out.println("Director: <input type='text' name='director'><br/>");
    out.println("Release Year: <input type='number' name='release_year'><br/>");
    out.println("Genre: <input type='text' name='genre'><br/>");
    out.println("Rating: <input type='text' name='rating'><br/>");

    out.println("<input type='submit' value='Create Record'>");
    out.println("</form>");
}

if (request.getMethod().equals("POST")) {

    myDB.createRecord(
        request.getParameter("title"),
        request.getParameter("director"),
        Integer.parseInt(request.getParameter("release_year")),
        request.getParameter("genre"),
        request.getParameter("rating")
    );

    out.println("<h3>Record Added</h3>");
    out.println(myDB.readAll());
}
%>

</body>
</html>
