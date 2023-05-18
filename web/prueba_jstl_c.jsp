<%-- 
    Document   : prueba_jstl_c
    Created on : 16 may. 2023, 19:36:34
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <sql:setDataSource var="xcon" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/test"
                           user="root"
                           password="tecsup"/>
        
        <sql:query dataSource="${xcon}"
                   sql="select * from areas"
                   var="result" />
        
        <table border="1">
            <tr><th>Código</th>
                <th>Nombre</th>
                <th>Estado</th>
            </tr>
        
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.cod}"/></td>
                    <td><c:out value="${row.nom}"/></td>
                    <td><c:out value="${row.est}"/></td> 
                </tr>
            </c:forEach>      
        </table>
        
        
        
    </body>
</html>
