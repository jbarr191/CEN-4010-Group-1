<%-- 
    Document   : Modify
    Created on : Apr 13, 2017, 5:35:45 AM
    Author     : Jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Update</title>
    </head>
    <body>
        <h1>Database Update Page</h1>
        
        <h4>Note: For these functions to work, if you must input  all the values for the old row, with all the values you wish to change.</h4>
        
        <p>Please use this form if you'd like to update data from the Book table</p>
        <form name="bookUpdateForm" action="updateBookForm.jsp" method="POST"><table>
                <tbody>
                    <tr>
                        <td>Book Code: </td>
                        <td><input type="text" name="bookCode" value="" size="4" /></td>
                        <td>New Book Code: </td>
                        <td><input type="text" name="newBookCode" value="" size="4" /></td>
                    </tr>
                    <tr>
                        <td>Title: </td>
                        <td><input type="text" name="title" value="" size="50" /></td>
                        <td>New Title: </td>
                        <td><input type="text" name="newTitle" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Publisher Code: </td>
                        <td><input type="text" name="publisherCode" value="" size="3" /></td>
                        <td>New Publisher Code: </td>
                        <td><input type="text" name="newPublisherCode" value="" size="3" /></td>
                    </tr>
                    <tr>
                        <td>Book Type: </td>
                        <td><input type="text" name="type" value="" size="3" /></td>
                        <td>New Book Type: </td>
                        <td><input type="text" name="newType" value="" size="3" /></td>
                    </tr>
                    <tr>
                        <td>Paperback: </td>
                        <td><select name="paperback">
                                <option>Y</option>
                                <option>N</option>
                            </select></td>
                        <td>New Paperback: </td>
                        <td><select name="newPaperback">
                                <option>Y</option>
                                <option>N</option>
                            </select></td>
                    </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear Info." name="Clear" />
            <input type="submit" value="Update database" name="Submit" />
        </form>
        
        <ul>
            <li><a href="index.jsp">Click here to go back to the homepage</a>
                <p>or</p></li>
            <li><a href="Add.jsp">Click here to add to the database.</a></li>
            <li><a href="Delete.jsp">Click here to delete data from the database.</a></li>
        </ul>
    </body>
</html>
