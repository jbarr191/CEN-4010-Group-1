<%-- 
    Document   : addPublisherForm
    Created on : Apr 16, 2017, 12:25:47 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Publisher Form</title>
    </head>
    <body>
        <h1>Insert Publisher Form</h1>
        
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
                            "INSERT INTO PUBLISHER "
                            + " VALUES (?, ?, ?)");
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public int setInfo(String pubCode, String pubName, String city)
                {
                    int result = 0;
                    
                    try
                    {
                        insertSomething.setString(1, pubCode);
                        insertSomething.setString(2, pubName);
                        insertSomething.setString(3, city);
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
            String publisherCode = request.getParameter("publisherCode");
            String publisherName = request.getParameter("publisherName");
            String city = request.getParameter("city");
            int result = 0;
            
            Something insert = new Something();
            result = insert.setInfo(publisherCode, publisherName, city);
            
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
