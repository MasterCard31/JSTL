<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>xml Demo</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>xml Demo</h1>
    <table>
        <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Cargo</th>
            <th>Sueldo</th>
        </tr>
        <%-- Include the XML parsing logic here --%>
        <%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
        <%@ page import="org.w3c.dom.Document" %>
        <%@ page import="org.w3c.dom.Element" %>
        <%@ page import="org.w3c.dom.NodeList" %>
        <%@ page import="java.io.File" %>

        <%-- Load the XML file from URL --%>
        <% String urlPath = "http://localhost:8089/WebApp09/personas.xml"; %>
        <% URL url = new URL(urlPath); %>
        <% InputStream inputStream = url.openStream(); %>
        <% DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance(); %>
        <% Document document = dbFactory.newDocumentBuilder().parse(inputStream); %>
        <% document.getDocumentElement().normalize(); %>

        <%-- Retrieve the persona nodes from the XML --%>
        <% NodeList personaList = document.getElementsByTagName("persona"); %>
        <% for (int i = 0; i < personaList.getLength(); i++) { %>
            <%-- Get the persona element --%>
            <% Element personaElement = (Element) personaList.item(i); %>
            <%-- Extract the data from the persona element --%>
            <% String codigo = personaElement.getElementsByTagName("codigo").item(0).getTextContent(); %>
            <% String nombre = personaElement.getElementsByTagName("nombre").item(0).getTextContent(); %>
            <% String apellido = personaElement.getElementsByTagName("apellido").item(0).getTextContent(); %>
            <% String cargo = personaElement.getElementsByTagName("cargo").item(0).getTextContent(); %>
            <% String sueldo = personaElement.getElementsByTagName("sueldo").item(0).getTextContent(); %>
            <%-- Display the data in the table row --%>
            <tr>
                <td><%= codigo %></td>
                <td><%= nombre %></td>
                <td><%= apellido %></td>
                <td><%= cargo %></td>
                <td><%= sueldo %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>

