<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/23/25
  Bellevue University – CSD430 Module 7
  Movie Database JSP – SelectYears
  Description:
     This JSP file handles the Year Selection operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Movies</title>
</head>
<body>

<h1>All Movies</h1>

<jsp:useBean id="setupDB" class="configBean.ConfigProject" />

<a href="index_02.html">Home</a><br/><br/>

<%
try {
    out.print(setupDB.read());
} catch(Exception e) {
    out.print("Error reading table: " + e.getMessage());
}
%>

</body>
</html>
