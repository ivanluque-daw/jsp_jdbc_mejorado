<%--
  Created by IntelliJ IDEA.
  User: ivandaw
  Date: 12/12/24
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
  <h2>Introduzca los datos del nuevo entrenamiento:</h2>
  <form method="POST" action="grabaEntrenamiento.jsp">
    <select name="tipo" required>
      <option value="fisico" selected>Fisico</option>
      <option value="tecnico">Tecnico</option>
    </select>
    <input type="text" name="ubicacion" placeholder="Ubicacion" required />
    <input type="date" name="fecha" placeholder="Fecha" required />
    <button>Aceptar</button>
  </form>
</body>
</html>
