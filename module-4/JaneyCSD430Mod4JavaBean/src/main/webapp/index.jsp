<!--
Jonah Aney 10/26/26 CSD-430 Module-2 Java Scriplet - Data Display

For this week’s assignment you will create a dynamic HTML page using JSP Scriptlets. You will include Java code in Scriptlet sections and place all HTML tags outside Scriptlet sections. You also use external CSS sheets to modify the style. Lastly, in your page, you will create a table holding the data to be displayed. For the data, create a record with data files relation to one of the following:

    A book you have enjoyed reading.
    A movie you have enjoyed reading.
    A state or country you have enjoyed visiting.

Then, you will need to:

    Document your code.
    Use Scriptlets for holding Java code.
    All HTML tags will be outside of Java Scriptlets.
    Display data in an HTML table format.
    The data will be grouped into topical categories.
    Include other display items such as field and recode descriptions, title, and overall data description. 
    Data will have a minimum of 5 records with three fields.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Data Display Page - My Favorite Movies</title>
	
<!-- Link to external stylesheet -->
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<h1>Movies</h1>
	<p> This pages uses JSP scriplets and a for loop to dynamically display the movie data. The table below will have five movies and include, the title, genre, and release year.</p>	

<!-- Scriplet to define and output movie data -->
	
	<%   String[][] movies = {
            {"Batman", "Action/Drama", "1989"},
            {"The Dark Knight", "Action/Drama", "2008"},
            {"Ghostbusters", "Science Fiction/Comedy", "1984"},
            {"The Shawshank Redemption", "Drama", "1994"},
            {"That Thing You Do", "Family/Comedy", "1996"}
        };
    %>
    
<!-- Create the HTML table outside of scriptlet -->
    
    <table>
        <tr>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
        </tr>

<!-- For loop for movie records -->
        
        <%
        // Loop through each movie and display the data in each of its fields
            for (String[] movie : movies) {
        %>
            <tr>
                <td><%= movie[0] %></td>
                <td><%= movie[1] %></td>
                <td><%= movie[2] %></td>
            </tr>
        <%
            }
        %>
    </table>

    <footer>
        <p>Jonah Aney | CSD-430 Server-Side Development | Module-2 Assignment</p>
    </footer>
</body>
</html>