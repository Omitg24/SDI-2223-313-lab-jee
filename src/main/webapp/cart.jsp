<%--
  Created by IntelliJ IDEA.
  User: omart
  Date: 07/02/2023
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <title>Vista carrito</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
<jsp:setProperty name="counter" property="increase" value="1"/>
<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="nav-item"><a class="nav-link" href="AddToShoppingCart">Carrito</a></li>
      <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
      <li class="nav-item"><a class="nav-link" href="admin.jsp">Administrar productos</a></li>
      <li class="nav-item"><a class="nav-link" href="products">Productos</a></li>
      <li class="nav-item"><a class="nav-link" href="comment.jsp">Añadir comentarios</a></li>
      <li class="nav-item"><a class="nav-link" href="Blog">Blog</a></li>
    </ul>
    <div class="nav navbar-right">
      <div class="center-block">
        <jsp:getProperty name="counter" property="total"/>
        Visitas
      </div>
    </div>
  </div>
</nav>

<!-- Contenido -->
<div class="container" id="main-container">
  <h2>Vista Carrito</h2>
  <ul>
    <c:forEach var="item" items="${selectedItems}">
      <tr>
        <li>${item.key} - ${item.value} <a href="DeleteFromShoppingCart?product=<c:out value="${item.key}"/>">Borrar</a></li>
      </tr>
    </c:forEach>
  </ul>
  <a href="index.jsp">Volver</a>
</div>
</body>
</html>