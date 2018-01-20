<%-- 
    Document   : updateBookForm
    Created on : Apr 16, 2017, 5:31:39 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book Form</title>
    </head>
    <body>
        <h1>Update Book Form</h1>
        
        <%!
            public class Something 
            {
                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "nOKAMA99";

                Connection connection = null;
                PreparedStatement updateSomething = null;
                ResultSet resultSet = null;

                public Something()
                {
                    try
                    {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        updateSomething = connection.prepareStatement(
                            "UPDATE BOOK "
                            + " SET bookCode = ?, title = ?, publisherCode = ?, type = ?, paperback = ? "
                            + " WHERE bookCode = ? AND title = ? AND publisherCode = ? AND type = ? AND paperback = ?");
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public int setInfo(String bookCode, String title, String pubCode, String type, String paperback,
                    String newBookCode,String newTitle, String newPublisherCode,String newType,String newPaperback)
                {
                    int result = 0;
                    
                    try
                    {
                        updateSomething.setString(1, newBookCode);
                        updateSomething.setString(2, newTitle);
                        updateSomething.setString(3, newPublisherCode);
                        updateSomething.setString(4, newType);
                        updateSomething.setString(5, newPaperback);
                        updateSomething.setString(6, bookCode);
                        updateSomething.setString(7, title);
                        updateSomething.setString(8, pubCode);
                        updateSomething.setString(9, type);
                        updateSomething.setString(10, paperback);
                        result = updateSomething.executeUpdate();
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
            String newBookCode;
            String newTitle;
            String newPublisherCode;
            String newType;
            String newPaperback;
            if(request.getParameter("newBookCode").compareTo("") == 0)
            {
                newBookCode = bookCode;
            } else
            {
                newBookCode = request.getParameter("newBookCode");
            }
            if(request.getParameter("newTitle").compareTo("") == 0)
            {
                newTitle = title;
            } else
            {
                newTitle = request.getParameter("newTitle");
            }
            if(request.getParameter("newPublisherCode").compareTo("") == 0)
            {
                newPublisherCode = publisherCode;
            } else
            {
                newPublisherCode = request.getParameter("newPublisherCode");
            }
            if(request.getParameter("newType").compareTo("") == 0)
            {
                newType = type;
            }else
            {
                newType = request.getParameter("newType");
            }
            if(request.getParameter("newPaperback").compareTo("") == 0)
            {
                newPaperback = paperback;
            } else
            {
                newPaperback = request.getParameter("newPaperback");
            }
            
            int result = 0;
            
            Something insert = new Something();
            result = insert.setInfo(bookCode, title, publisherCode, type, paperback, 
                    newBookCode, newTitle, newPublisherCode, newType, newPaperback);
            
            if(result == 0)
            {
                %> <p> The database update was unsuccessful</p> <%
            } else
            {
                %> <p> The database update was successful</p> <%
            }
        %>
        
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
    </body>
</html>
