<%@ page import="com.uniovi.sdi.*, java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: omart
  Date: 07/02/2023
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
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

<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
<jsp:setProperty name="counter" property="increase" value="1"/>

<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="collapse navbar-collapse" id="my-navbarColor02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="AddToShoppingCart">Carrito<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="login.jsp">Login<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="admin.jsp">Administrar productos<span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <div class="nav navbar-right">
            <!-- cambiar por el bean -->
            <%-- <%=counter%>Visitas --%>
            <jsp:getProperty name="counter" property="total"/> Visitas
        </div>
    </div>
</nav>
<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Productos</h2>
    <div class="row ">
        <%
            List<Product> listProducts = new ProductsService().getProducts();
            for(Product product : listProducts){
        %>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div>
                <img src="<%=product.getImage() %>" />
                <div><%=product.getName() %></div>
                <a href="AddToShoppingCart?product=<%=product.getName() %>" class="btn btn-default" >
                    <%=product.getPrice() %> €
                </a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>