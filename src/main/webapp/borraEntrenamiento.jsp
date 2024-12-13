<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
  <%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = null;
    PreparedStatement ps = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "user");

      ps = conn.prepareStatement("DELETE FROM entrenamiento WHERE id = ?");
      ps.setInt(1, id);

      int filasAfectadas = ps.executeUpdate();
      System.out.println("ENTRENAMIENTOS BORRADOS: " + filasAfectadas);
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
