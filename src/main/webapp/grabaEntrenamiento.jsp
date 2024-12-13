<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: ivandaw
  Date: 12/12/24
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    String tipo = request.getParameter("tipo");
    String ubicacion = request.getParameter("ubicacion");
    String fecha = request.getParameter("fecha");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "user");

      ps = conn.prepareStatement("INSERT INTO entrenamiento (tipo, ubicacion, fecha) VALUES (?, ?, ?)");
      ps.setString(1, tipo);
      ps.setString(2, ubicacion);
      ps.setDate(3, Date.valueOf(fecha));

      int filasAfectadas = ps.executeUpdate();
      System.out.println("ENTRENAMIENTOS GRABADOS: " + filasAfectadas);
    } catch (Exception ex) {
      ex.printStackTrace();
    } finally {
      try { ps.close(); } catch (Exception e) {}
      try { conn.close(); } catch (Exception e) {}
    }

    response.sendRedirect("listadoEntrenamientos.jsp");
  %>
</body>
</html>
