<%-- 
    Document   : addBookForm
    Created on : Apr 14, 2017, 4:27:26 PM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Book Form</title>
    </head>
    <body>
        <h1>Insert Book Form</h1>
        
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
                            "INSERT INTO BOOK "
                            + " VALUES (?, ?, ?, ?, ?)");
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
                        insertSomething.setString(1, bookCode);
                        insertSomething.setString(2, title);
                        insertSomething.setString(3, pubCode);
                        insertSomething.setString(4, type);
                        insertSomething.setString(5, paperback);
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
            String bookCode = request.getParameter("bookCode");
            String title = request.getParameter("title");
            String publisherCode = request.getParameter("publisherCode");
            String type = request.getParameter("type");
            String paperback = request.getParameter("paperback");
            int result = 0;
            
            Something insert = new Something();
            result = insert.setInfo(bookCode, title, publisherCode, type, paperback);
            
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
