<%-- 
    Document   : deleteAuthorForm
    Created on : Apr 16, 2017, 2:50:23 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Author Form</title>
    </head>
    <body>
        <h1>Delete Author Form</h1>
        
        <%!
            public class Something 
            {
                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "nOKAMA99";

                Connection connection = null;
                PreparedStatement deleteSomething = null;
                ResultSet resultSet = null;

                public Something()
                {
                    try
                    {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        deleteSomething = connection.prepareStatement(
                            "DELETE FROM AUTHOR "
                            + " WHERE authorNum = ? AND authorLast = ? "
                            + " AND authorFirst = ?");
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
                        deleteSomething.setInt(1, authorNum);
                        deleteSomething.setString(2, authorLast);
                        deleteSomething.setString(3, authorFirst);
                        result = deleteSomething.executeUpdate();
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
            
            Something delete = new Something();
            result = delete.setInfo(authorNum, authorLast, authorFirst);
            
            if(result == 0)
            {
                %> <p> The database row deletion was unsuccessful</p> <%
            } else
            {
                %> <p> If all data matched, the database row deletion was successful</p> <%
            }
        %>
        
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
    </body>
</html>
