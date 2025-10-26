<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
  1/17/2024
  -- Important --
-->
<!--
  Professor Darrell Payne
  Bellevue University
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Table</title>
    </head>
    <body>
        <h1>Table</h1>
        
    <table border="1">
        
        <%
            for(int i = 0; i < 5; ++i){
                
                out.println("<tr>");
                
                for(int j = 0; j < 5; ++j){
                    
                    out.println("<td>");
        %>
        
        Data i = <%= i + 1 %> j =  <%= j + 1 %>
        
        <%            
                out.println("</td>");            
                }

            out.println("</tr>");
        }

    %>

    </table>
        
    </body>
</html>
