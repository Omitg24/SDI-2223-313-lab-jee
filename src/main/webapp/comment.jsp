<%--
  Created by IntelliJ IDEA.
  User: omart
  Date: 07/02/2023
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Servlets</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.user == null}">
  <c:redirect url="/login.jsp"/>
</c:if>

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
  <h2>Añadir un comentario</h2>
  <form class="form-horizontal" method="post" action="Blog">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Nombre de usuario:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" name="name" value="${sessionScope.user}" required="true" readonly/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="comment">Comentario:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="comment" name="comment"
               required="true"/>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">Agregar</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>