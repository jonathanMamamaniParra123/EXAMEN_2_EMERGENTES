<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="com.emergentes.modelo.GestorProductos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  if(session.getAttribute("almacen") == null){
      GestorProductos objeto1 = new GestorProductos();
      
      objeto1.insertarProducto(new Producto(1, "Chocolate",5,2, "Caramelos"));
     
      
      session.setAttribute("almacen", objeto1);
  }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
         <center>
        <b>
        <h2>Nombre: Jonathan Mamani Parra</h2>
        <h2>Carnet: 10099234P.</h2>
        <h2>RU: 200036517</h2>
                </b>

        <h1>PRODUCTOS</h1>
        <a href="Controller?op=nuevo">Nuevo Producto</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.almacen.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.descripcion}</td>
                    <td>${item.cantidad}</td>
                    <td>${item.precio}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Editar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        </center>
    </body>
</html>
