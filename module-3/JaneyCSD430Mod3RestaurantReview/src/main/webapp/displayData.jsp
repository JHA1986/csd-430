<!--
Jonah Aney 10/29/25 CSD-430 Module-3 Working with JSP Forms

For this week’s assignment you will create a form to gather data from a user. 
In the form you must have a minimum of three types of user input and a minimum of five data entry points. You also must have a JSP the form is submitted to for displaying the data. 
The form may be a JSP file or an HTML file, however the return data display must be in a separate JSP file. The form is to gather typical data gathered from a: 

    Experience feedback for restaurant’s meal or service received 

--> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Feedback</title>
</head>
<body>
<!-- Page Heading -->
    <h2>We appreciate your feedback</h2>
    
    <%-- 
        JSP Scriptlet to retrieve form data submitted from feedbackForm.jsp 
        request.getParameter("fieldName") returns the value entered by the user 
    --%>
    <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String quality = request.getParameter("quality");
        String service = request.getParameter("service");
        String comments = request.getParameter("comments");
    %>
    
<!-- Display Submitted Data in a Table -->
    <table border="1" cellpadding="5">
        <tr><th>Field</th><th>Your Response</th></tr>
        <tr><th>Full Name</th><th><%= name %></th></tr>
        <tr><th>Email</th><th><%= email %></th></tr>
        <tr><th>Food Quality</th><th><%= quality %></th></tr>
        <tr><th>Service Rating</th><th><%= service %></th></tr>
        <tr><th>Additional Comments</th><th><%= comments %></th></tr>
    </table>

<!-- Thank You Message -->
    <p>Thank you! We value your opinion. Have a great day!</p>

</body>
</html>
