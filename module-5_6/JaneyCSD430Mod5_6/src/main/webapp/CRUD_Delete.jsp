<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/16/25
  Bellevue University – CSD430 Module 5 & 6
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

<h1>Delete Movie Record</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<a href="index_02.html">Home</a><br/><br/>

<%
if (request.getMethod().equals("GET")) {
    out.println(myDB.formGetPK("CRUD_Delete.jsp"));
}

if (request.getMethod().equals("POST")) {

    int id = Integer.parseInt(request.getParameter("movie_id"));

    out.println("<h3>Record Deleted</h3>");
    myDB.deleteRecord(id);

    out.println(myDB.readAll());
}
%>

</body>
</html>

