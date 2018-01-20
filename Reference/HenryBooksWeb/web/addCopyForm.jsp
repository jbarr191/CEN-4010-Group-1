<%-- 
    Document   : addCopyForm
    Created on : Apr 16, 2017, 12:27:28 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Copy Form</title>
    </head>
    <body>
        <h1>Insert Copy Form</h1>
        
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
                            "INSERT INTO COPY "
                            + " VALUES (?, ?, ?, ?, ?)");
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
                        insertSomething.setString(1, bookCode);
                        insertSomething.setInt(2, branchNum);
                        insertSomething.setInt(3, copyNum);
                        insertSomething.setString(4, quality);
                        insertSomething.setDouble(5, price);
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
            int branchNum = Integer.parseInt(request.getParameter("branchNum"));
            int copyNum = Integer.parseInt(request.getParameter("copyNum"));
            String quality = request.getParameter("quality");
            double price = Double.parseDouble(request.getParameter("price"));
            int result = 0;
            
            Something insert = new Something();
            result = insert.setInfo(bookCode, branchNum, copyNum, quality, price);
            
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
