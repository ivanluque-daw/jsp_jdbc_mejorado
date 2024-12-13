<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Listado entrenamientos</title>
</head>
<body>
  <h1>Listado de entrenamientos</h1>

  <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "user");

    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery("SELECT * FROM entrenamiento");

    while (listado.next()) {
  %>
      <%= listado.getInt("id") %> <%= listado.getString("tipo") %> <%= listado.getString("ubicacion") %> <%= listado.getString("fecha") %>
      <form method="POST" action="borraEntrenamiento.jsp">
        <input type="hidden" name="id" value="<%= listado.getInt("id") %>" />
        <button>Borrar</button>
      </form>
  <%
    }

    listado.close();
    s.close();
    conexion.close();
  %>
</body>
</html>
