<%-- 
    Document   : deletePublisherForm
    Created on : Apr 16, 2017, 2:49:53 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Publisher Form</title>
    </head>
    <body>
        <h1>Delete Publisher Form</h1>
        
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
                            "DELETE FROM PUBLISHER "
                            + " WHERE publisherCode = ? AND publisherName = ? "
                            + " AND city = ?");
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
                        deleteSomething.setString(1, pubCode);
                        deleteSomething.setString(2, pubName);
                        deleteSomething.setString(3, city);
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
            String publisherCode = request.getParameter("publisherCode");
            String publisherName = request.getParameter("publisherName");
            String city = request.getParameter("city");
            int result = 0;
            
            Something delete = new Something();
            result = delete.setInfo(publisherCode, publisherName, city);
            
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
