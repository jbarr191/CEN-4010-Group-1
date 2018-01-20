<%-- 
    Document   : databaseSelect
    Created on : Apr 15, 2017, 2:07:58 AM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table View</title>
    </head>
    <body>
        <% String table = request.getParameter("databaseChoise"); %>
        <h1>Table Views - <%= table%></h1>
        
        <%!
            public class Something 
            {
                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "nOKAMA99";

                Connection connection = null;
                PreparedStatement selectSomething = null;
                ResultSet resultSet = null;

                public Something(String tableChoise)
                {
                    try
                    {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        selectSomething = connection.prepareStatement(
                            "SELECT * FROM " + tableChoise);
                    } catch(SQLException e)
                    {
                        e.printStackTrace();
                    }
                }

                public ResultSet getSomething() 
                {
                    try
                    {
                        resultSet = selectSomething.executeQuery();
                    } catch (SQLException e)
                    {
                        e.printStackTrace();
                    }
                    
                    return resultSet;
                }
            }

        %>
        
        
        <%
            if (table.equalsIgnoreCase("book"))
            {
            Something something = new Something(table);
            ResultSet stuff = something.getSomething();
        %>       
        <table border="0">
            <tbody>
                <tr>
                    <th>bookCode</th>
                    <th>title</th>
                    <th>publishercode</th>
                    <th>type</th>
                    <th>paperback</th>
                </tr>
                <% while (stuff.next()) {%>
                <tr>
                    <td><%= stuff.getString("bookCode") %></td>
                    <td><%= stuff.getString("title") %></td>
                    <td><%= stuff.getString("publisherCode") %></td>
                    <td><%= stuff.getString("type") %></td>
                    <td><%= stuff.getString("paperback") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        
        <%
            if (table.equalsIgnoreCase("publisher"))
            {
            Something something = new Something(table);
            ResultSet stuff = something.getSomething();
        %>       
        <table border="0">
            <tbody>
                <tr>
                    <th>publisherCode</th>
                    <th>publisherName</th>
                    <th>city</th>
                </tr>
                <% while (stuff.next()) {%>
                <tr>
                    <td><%= stuff.getString("publisherCode") %></td>
                    <td><%= stuff.getString("publisherName") %></td>
                    <td><%= stuff.getString("city") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        
        <%
            if (table.equalsIgnoreCase("author"))
            {
            Something something = new Something(table);
            ResultSet stuff = something.getSomething();
        %>       
        <table border="0">
            <tbody>
                <tr>
                    <th>authorNum</th>
                    <th>authorLast</th>
                    <th>authorFirst</th>
                </tr>
                <% while (stuff.next()) {%>
                <tr>
                    <td><%= stuff.getInt("authorNum") %></td>
                    <td><%= stuff.getString("authorLast") %></td>
                    <td><%= stuff.getString("authorFirst") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        
        <%
            if (table.equalsIgnoreCase("copy"))
            {
            Something something = new Something(table);
            ResultSet stuff = something.getSomething();
        %>       
        <table border="0">
            <tbody>
                <tr>
                    <th>bookCode</th>
                    <th>branchNum</th>
                    <th>copyNum</th>
                    <th>quality</th>
                    <th>price</th>
                </tr>
                <% while (stuff.next()) {%>
                <tr>
                    <td><%= stuff.getString("bookCode") %></td>
                    <td><%= stuff.getInt("branchNum") %></td>
                    <td><%= stuff.getInt("copyNum") %></td>
                    <td><%= stuff.getString("quality") %></td>
                    <td><%= stuff.getDouble("price") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>

    </body>
</html>
