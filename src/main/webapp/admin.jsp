<%--
  Created by IntelliJ IDEA.
  User: omart
  Date: 07/02/2023
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Servlets</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
  String user = (String) request.getSession().getAttribute("user");
  System.out.println("Usuario en sesión: " + user);
  if (user == null || user.equals("admin") == false) {
// No hay usuario o no es admin
    response.sendRedirect("login.jsp");
  }
%>
<!-- Contenido -->
<div class="container" id="contenedor-principal">
  <h2>Administrar</h2>
</div>
</body>
</html>