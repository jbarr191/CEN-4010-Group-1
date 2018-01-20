<%-- 
    Document   : bookSearch.jsp
    Created on : Apr 15, 2017, 2:34:33 PM
    Author     : Jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Search</title>
    </head>
    <body>
        <h1>Book Info. Search</h1>
        
        <form name="bookTitleForm" action="bookSearchForm.jsp" method="POST">
            <input type="text" name="bookName" value="" size="50" />
            
            <input type="submit" value="Search for this book" name="submit" />
        </form>
        
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
    </body>
</html>
