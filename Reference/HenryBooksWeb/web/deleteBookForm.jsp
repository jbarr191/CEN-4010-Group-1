<%-- 
    Document   : deleteBookForm
    Created on : Apr 16, 2017, 2:48:36 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Book Form</title>
    </head>
    <body>
        <h1>Delete Book Form</h1>
        
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
                            "DELETE FROM BOOK "
                            + " WHERE bookCode = ? AND title = ? "
                            + " AND publisherCode = ? AND type = ? AND paperback = ?");
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public int setInfo(String bookCode, String title, String pubCode, String type, String paperback)
                {
                    int result = 0;
                    
                    try
                    {
                        deleteSomething.setString(1, bookCode);
                        deleteSomething.setString(2, title);
                        deleteSomething.setString(3, pubCode);
                        deleteSomething.setString(4, type);
                        deleteSomething.setString(5, paperback);
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
            String bookCode = request.getParameter("bookCode");
            String title = request.getParameter("title");
            String publisherCode = request.getParameter("publisherCode");
            String type = request.getParameter("type");
            String paperback = request.getParameter("paperback");
            int result = 0;
            
            Something delete = new Something();
            result = delete.setInfo(bookCode, title, publisherCode, type, paperback);
            
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
