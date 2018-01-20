<%-- 
    Document   : bookSearchForm.jsp
    Created on : Apr 15, 2017, 3:34:17 PM
    Author     : Jesus
--%>

<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Search Result</title>
    </head>
    <body>
        <h1>Book Search Result</h1>
        <% String title = request.getParameter("bookName"); %>
        <p>Search query: "<%= title%>" </p>
        
        
        <%!
            public class Something 
            {
                String URL = "jdbc:mysql://localhost:3306/henrybooks";
                String USERNAME = "root";
                String PASSWORD = "nOKAMA99";

                Connection connection = null;
                PreparedStatement selectSomething = null;
                ResultSet resultSet = null;

                public Something(String bookName, String display)
                {
                    if (display.equals("author"))
                    {
                        try
                        {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectSomething = connection.prepareStatement(
                                "SELECT authorFirst, authorLast, publisherName, PUBLISHER.publisherCode"
                                + " FROM BOOK, AUTHOR, WROTE, PUBLISHER"
                                + " WHERE title = '" + bookName + "' "
                                + " AND BOOK.bookCode = WROTE.bookCode "
                                + " AND WROTE.authorNum = AUTHOR.authorNum "
                                + " AND BOOK.publisherCode = PUBLISHER.publisherCode");
                        } catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                    }

                    if (display.equals("publisher"))
                    {
                        try
                        {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectSomething = connection.prepareStatement(
                                "SELECT publisherName, PUBLISHER.publisherCode"
                                + " FROM BOOK, PUBLISHER"
                                + " WHERE title = '" + bookName + "' "
                                + " AND BOOK.publisherCode = PUBLISHER.publisherCode");
                        } catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
                    }

                    if (display.equals("inventory"))
                    {
                        try
                        {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectSomething = connection.prepareStatement(
                                "SELECT onHand, branchName"
                                + " FROM BOOK, INVENTORY, BRANCH"
                                + " WHERE title = '" + bookName + "' "
                                + " AND BOOK.bookCode = INVENTORY.bookCode "
                                + " AND INVENTORY.branchNum = BRANCH.branchNum");
                        } catch(SQLException e)
                        {
                            e.printStackTrace();
                        }
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
        
        <% Something authorResults = new Something(title, "author");
            ResultSet authorInfo = authorResults.getSomething();%>
        <table border="1">
            <tbody>
                <tr>
                    <th>Author's first name</th>
                    <th>Author's Last name</th>
                </tr>
                <% while (authorInfo.next()) {%>
                <tr>
                    <td><%= authorInfo.getString("authorFirst") %></td>
                    <td><%= authorInfo.getString("authorLast") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            
        <p></p>
        
        <% Something pubResults = new Something(title, "publisher");
            ResultSet pubInfo = pubResults.getSomething();%>
        <table border="1">
            <tbody>
                <tr>
                    <th>Publisher Name</th>
                    <th>Publisher Code</th>
                </tr>
                <% while (pubInfo.next()) {%>
                <tr>
                    <td><%= pubInfo.getString("publisherName") %></td>
                    <td><%= pubInfo.getString("publisherCode") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            
        <p></p>
            
        <% Something invResults = new Something(title, "inventory");
            ResultSet invInfo = invResults.getSomething();%>
        <table border="1">
            <tbody>
                <tr>
                    <th>Branch Name</th>
                    <th>Books on Hand</th>
                </tr>
                <% while (invInfo.next()) {%>
                <tr>
                    <td><%= invInfo.getString("branchName") %></td>
                    <td><%= invInfo.getInt("onHand") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            
        <p>If results come up empty, then the given book title did not give a match in the database.</p>
        
        <p><a href="bookSearch.jsp">Click here to make another search</a></p>
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
    </body>
</html>
