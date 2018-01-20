<%-- 
    Document   : Add
    Created on : Apr 12, 2017, 8:29:06 PM
    Author     : Jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Insert</title>
    </head>
    <body>
        <h1>Database Insert Page</h1>
        
        <p>Please use this form if you'd like to add data to the Book table</p>
        <form name="bookInsertForm" action="addBookForm.jsp" method="POST"><table>
                <tbody>
                    <tr>
                        <td>Book Code: </td>
                        <td><input type="text" name="bookCode" value="" size="4" /></td>
                    </tr>
                    <tr>
                        <td>Title: </td>
                        <td><input type="text" name="title" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Publisher Code: </td>
                        <td><input type="text" name="publisherCode" value="" size="3" /></td>
                    </tr>
                    <tr>
                        <td>Book Type: </td>
                        <td><input type="text" name="type" value="" size="3" /></td>
                    </tr>
                    <tr>
                        <td>Paperback: </td>
                        <td><select name="paperback">
                                <option>Y</option>
                                <option>N</option>
                            </select></td>
                    </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear Info." name="Clear" />
            <input type="submit" value="Add to database" name="Submit" />
        </form>
        
        <p>Use this form if you'd like to add data to the Publisher table</p>
        <form name="publisherInsertForm" action="addPublisherForm.jsp" method="POST"><table>
                <tbody>
                    <tr>
                        <td>Publisher Code: </td>
                        <td><input type="text" name="publisherCode" value="" size="3" /></td>
                    </tr>
                    <tr>
                        <td>Publisher Name: </td>
                        <td><input type="text" name="publisherName" value="" size="50"/></td>
                    </tr>
                    <tr>
                        <td>City: </td>
                        <td><input type="text" name="city" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear Info." name="Clear" />
            <input type="submit" value="Add to database" name="Submit" />
        </form>
        
        <p>Use this form if you'd like to add data to the Author table</p>
        <form name="authorInsertForm" action="addAuthorForm.jsp" method="POST"><table>
                <tbody>
                    <tr>
                        <td>Author Number: </td>
                        <td><input type="text" name="authorNum" value="" size="2" /></td>
                    </tr>
                    <tr>
                        <td>Author last name: </td>
                        <td><input type="text" name="authorLastName" value="" size="12" /></td>
                    </tr>
                    <tr>
                        <td>Author first name: </td>
                        <td><input type="text" name="authorFirstName" value="" size="12" /></td>
                    </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear Info." name="Clear" />
            <input type="submit" value="Add to database" name="Submit" />
        </form>
        
        <p>Use this form if you'd like to add data to the Copy table</p>
        <form name="copyInsertForm" action="addCopyForm.jsp" method="POST"><table>
                <tbody>
                    <tr>
                        <td>Book Code: </td>
                        <td><input type="text" name="bookCode" value="" size="4" /></td>
                    </tr>
                    <tr>
                        <td>Branch Number: </td>
                        <td><input type="text" name="branchNum" value="" size="2" /></td>
                    </tr>
                    <tr>
                        <td>Copy Number </td>
                        <td><input type="text" name="copyNum" value="" size="2" /></td>
                    </tr>
                    <tr>
                        <td>Quality </td>
                        <td><select name="quality">
                                <option>Excellent</option>
                                <option>Good</option>
                                <option>Fair</option>
                                <option>Poor</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Price </td>
                        <td><input type="text" name="price" value="" size="8" /></td>
                    </tr>
                </tbody>
            </table>

            <input type="reset" value="Clear Info." name="Clear" />
            <input type="submit" value="Add to database" name="Submit" />
        </form>
        
        <ul>
            <li><a href="index.jsp">Click here to go back to the homepage</a>
                <p>or</p></li>
            <li><a href="Delete.jsp">Click here to delete data from the database.</a></li>
            <li><a href="Modify.jsp">Click here to modify the database.</a></li>
        </ul>
    </body>
</html>
