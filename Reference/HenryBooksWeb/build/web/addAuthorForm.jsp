<%-- 
    Document   : addAuthorForm
    Created on : Apr 16, 2017, 12:27:15 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Author Form</title>
    </head>
    <body>
        <h1>Insert Author Form</h1>
        
        <%!
            public class Something 
            {
                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "nOKAMA99";

                Connection connection = null;
                PreparedStatement insertSomething = null;
                ResultSet resultSet = null;

                public Something()
                {
                    try
                    {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertSomething = connection.prepareStatement(
                            "INSERT INTO AUTHOR "
                            + " VALUES (?, ?, ?)");
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public int setInfo(int authorNum, String authorLast, String authorFirst)
                {
                    int result = 0;
                    
                    try
                    {
                        insertSomething.setInt(1, authorNum);
                        insertSomething.setString(2, authorLast);
                        insertSomething.setString(3, authorFirst);
                        result = insertSomething.executeUpdate();
                    } catch (SQLException e)
                    {
                        e.printStackTrace();
                    }
                    
                    return result;
                }
            }
        %>
        
        <%
            int authorNum = Integer.parseInt(request.getParameter("authorNum"));
            String authorLast = request.getParameter("authorLastName");
            String authorFirst = request.getParameter("authorFirstName");
            int result = 0;
            
            Something insert = new Something();
            result = insert.setInfo(authorNum, authorLast, authorFirst);
            
            if(result == 0)
            {
                %> <p> The database addition was unsuccessful</p> <%
            } else
            {
                %> <p> The database addition was successful</p> <%
            }
        %>
        
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
    </body>
</html>
