<%-- 
    Document   : deleteCopyForm
    Created on : Apr 16, 2017, 2:50:44 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Copy Form</title>
    </head>
    <body>
        <h1>Delete Copy Form</h1>
        
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
                            "DELETE FROM COPY "
                            + " WHERE bookCode = ? AND branchNum = ? "
                            + " AND copyNum = ? AND quality = ? AND price = ?");
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public int setInfo(String bookCode, int branchNum, int copyNum, String quality, double price)
                {
                    int result = 0;
                    
                    try
                    {
                        deleteSomething.setString(1, bookCode);
                        deleteSomething.setInt(2, branchNum);
                        deleteSomething.setInt(3, copyNum);
                        deleteSomething.setString(4, quality);
                        deleteSomething.setDouble(5, price);
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
            int branchNum = Integer.parseInt(request.getParameter("branchNum"));
            int copyNum = Integer.parseInt(request.getParameter("copyNum"));
            String quality = request.getParameter("quality");
            double price = Double.parseDouble(request.getParameter("price"));
            int result = 0;
            
            Something delete = new Something();
            result = delete.setInfo(bookCode, branchNum, copyNum, quality, price);
            
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
