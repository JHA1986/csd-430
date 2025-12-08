<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/30/25 Updated 12/07/25
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
<title>Select Movie to Update</title>
</head>
<body>

<h1>Select Movie to Update</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<br/><a href="index.html">Home</a><br/><br/>

<%
    if (request.getMethod().equals("GET")) {

// Show dropdown to select which movie ID to update
        String dropdown = myDB.formGetPK("CRUD_Update_2.jsp");

        out.print(dropdown);
    }
%>

</body>
</html>
