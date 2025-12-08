<%-- 
  ************************************************************
  Jonah Aney – Movie Database 12/07/25
  Bellevue University – CSD430 Module 8
  Movie Database JSP – CRUD_Update_2
  Description:
     This JSP file handles the Update operation for the Movie Database project. All database
     interaction occurs through the DbBean JavaBean.
  ************************************************************
--%>

<%@ page language="java"
         contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Movie</title>
</head>
<body>

<h1>Update Movie Record</h1>

<jsp:useBean id="myDB" class="database.DbBean" />

<br/><a href="index.html">Home</a><br/><br/>


<%
    // ------------------------------------------------------
    // -STEP 1: Page loaded with ?id=xx from CRUD_Update.jsp-
    // --------Show form pre-filled with movie data----------
    // ------------------------------------------------------
    if (request.getMethod().equals("GET")) {

        int id = Integer.parseInt(request.getParameter("id"));
        ResultSet rs = myDB.readByIdAsRS(id);

        if (rs != null && rs.next()) {

            out.println("<form method='POST' action='CRUD_Update_2.jsp'>");

// Hidden PK
            out.println("<input type='hidden' name='id' value='" + id + "'>");

            out.println("<p><strong>ID:</strong> " + id + "</p>");

            out.println("Title: <input type='text' name='title' value='" + rs.getString("title") + "'><br/><br/>");
            out.println("Director: <input type='text' name='director' value='" + rs.getString("director") + "'><br/><br/>");
            out.println("Release Year: <input type='text' name='release_year' value='" + rs.getInt("release_year") + "'><br/><br/>");
            out.println("Genre: <input type='text' name='genre' value='" + rs.getString("genre") + "'><br/><br/>");
            out.println("Rating: <input type='text' name='rating' value='" + rs.getString("rating") + "'><br/><br/>");

            out.println("<input type='submit' value='Update Movie'>");
            out.println("</form>");
        }
    }
%>


<%
    // -------------------------------------------------------
    // -------STEP 2: User submits the update (POST)----------
    // -------------------------------------------------------
    if (request.getMethod().equals("POST")) {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        String genre = request.getParameter("genre");
        String rating = request.getParameter("rating");

// --- Update record using full update method ---
        myDB.updateRecordFull(id, title, director, releaseYear, genre, rating);

        out.println("<h3>Movie Updated Successfully!</h3>");

// Show updated record
        out.println(myDB.readByIdAsTable(id));

        out.println("<br/><br/>");

// Show full table again
        out.println(myDB.readAll());
    }
%>


</body>
</html>
