<%-- 
    Document   : prueba_jstl_b
    Created on : 16 may. 2023, 19:29:22
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="java.util.Date" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="salario" value="123.1234567" />
        <h1>Tags de Formato</h1>
        <c:out value="${salario}"/>
        <fmt:formatNumber pattern="0.00" value="${salario}" /> <br>
        <fmt:formatNumber pattern="0000.00" value="${salario}" /> <br>
        
        <c:set var="fecha" value="<%= new Date() %>"/>
        Fecha sin formato:
        <c:out value="${fecha}"/> <br>
        Fecha con formato:
        <fmt:formatDate pattern="yyyy-MM-dd" value="${fecha}" /> <br> 
        
    </body>
</html>
