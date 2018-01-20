<%-- 
    Document   : chooseDatabaseSelect
    Created on : Apr 15, 2017, 4:17:08 AM
    Author     : Jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Selection</title>
    </head>
    <body>
        <h1>Database Selection</h1>
        <p>Please choose the database you'd like to display</p>
        <form name="databaseSelectForm" action="databaseSelect.jsp" method="POST">
            <select name="databaseChoise">
                <option>book</option>
                <option>publisher</option>
                <option>author</option>
                <option>copy</option>
            </select>
            <input type="submit" value="Choose this table" name="Submit" />
        </form>
        
        <p><a href="index.jsp">Click here to go back to the homepage</a></p>
        
    </body>
</html>
