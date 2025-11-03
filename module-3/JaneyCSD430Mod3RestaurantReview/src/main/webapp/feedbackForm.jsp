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
    <title>Jonah's Restaurant Feedback</title>
</head>
<body>
<!-- Page Heading -->
    <h2>Restaurant Experience Feedback</h2>
    <p>Please fill out the form below and tell us about your experience</p>    

<!-- Feedback Form -->
    <form action="displayData.jsp" method="post">
        <table>
<!-- Full Name Input -->
            <tr>
                <td><label for="name">Full Name:</label></td>
                <td><input type="text" name="name" id="name" required></td>
            </tr>

<!-- Email Input -->
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" name="email" id="email" required></td>
            </tr>

<!-- Food Quality Radio Buttons -->
            <tr>
                <td>Food Quality:</td>
                <td>
                    <input type="radio" name="quality" value="Excellent" required> Excellent
                    <input type="radio" name="quality" value="Good"> Good
                    <input type="radio" name="quality" value="Poor"> Poor
                </td>
            </tr>

<!-- Service Rating Dropdown -->
            <tr>
                <td><label for="service">Service Rating:</label></td>
                <td>
                    <select name="service" id="service" required>
                        <option value="">--Select--</option>
                        <option value="5">5 - Excellent</option>
                        <option value="4">4 - Good</option>
                        <option value="3">3 - Average</option>
                        <option value="2">2 - Poor</option>
                        <option value="1">1 - Bad</option>
                    </select>
                </td>
            </tr>

<!-- Additional Comments Textarea -->
            <tr>
                <td><label for="comments">Additional Comments:</label></td>    
                <td><textarea name="comments" id="comments" rows="4" cols="40"></textarea></td> 
            </tr>

<!-- Submit Button -->
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Submit Feedback">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
