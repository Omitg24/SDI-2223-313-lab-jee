<%@ page language="java" import="com.uniovi.sdi.*" %>
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
<%
    if (request.getParameter("name") != null &&
            request.getParameter("image") != null &&
            request.getParameter("price") != null) {

    String name = request.getParameter("name");
    String image = request.getParameter("image");
    float price = Float.parseFloat(request.getParameter("price"));

    Product product = new Product(name, image, price);
    new ProductsService().setNewProduct(product);
    request.getRequestDispatcher("index.jsp").forward(request, response);
}
%>
<!-- Contenido -->
<div class="container" id="main-container">
  <h2>Agregar producto a la tienda</h2>
  <form class="form-horizontal" method="post" action="admin.jsp">
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Nombre:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" name="name" required="true"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="image">URL imagen:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="image" name="image" required="true"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">Precio (€):</label>
      <div class="col-sm-10">
        <input type="number" step="0.01" class="form-control" id="price" name="price"
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