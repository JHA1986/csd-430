<%-- 
  ************************************************************
  Jonah Aney – Movie Database 11/23/25
  Bellevue University – CSD430 Module 7
  Movie Database JSP – PopulateTable
  Description:
     This JSP file handles the Populate Table operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
Jonah Aney
CSD430 Module-5&6
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Create Table 06-2</title>
    </head>
    <body>
        <h1>JSP Fill Table MySQL 5</h1>
        
        <jsp:useBean id='setupDB' class='configBean.ConfigProject' />
        
  <br /> <a href="index_02.html">index.html</a> <br />   
  
  <%
	 
	  try{
		  
		  out.print(setupDB.populateTable());
	  }
	  catch(Exception e){
		  out.print("here");
	  }
  
	 
  %>     
    </body>
</html>
