<%-- 
    Document   : agenda2
    Created on : 3/11/2017, 07:41:44 AM
    Author     : Alumno
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" style="height: 100%; margin: 0px;">
    <head>
        <meta charset="UTF-8">
        <title> Agenda</title>
        <link rel="stylesheet"  type="text/css" href="../../CSS/agenda.css">
        <script type="text/javascript" src="../../script/agenda.js"></script>
    </head>
    <body style="height: 100%; margin: 0px;">


        <div class="contenedor">



            <div class="introduccion">
                <div class="contenedora" id="contenedor1">
                    <img src="../../imagenes/temafotografia/AgendaWeb/fondo1.jpg" class="fondo" id="imagen1">
                </div>
                <div class="contenedorb" id="contenedor2">
                    <img src="../../imagenes/temafotografia/AgendaWeb/fondo2.jpg" class="fondo" id="imagen2">
                </div> 
                <div class="nombremodulo" id="log"> <img class="logo" src="../../imagenes/logos/agenda.png"> </div>
            </div>
        </div>
        <div class="cuerpo">
            <form action="agenda.jsp" method="post" name="creacion">
                
                <h1 Style="opacity: 0" name="usuario">Hola <c:out value="${user}" /></h1>
                Tipo de actividad : <select name="tipoactividad">
                    <option value="1"> Tarea</option>
                    <option value="2"> Actividad cultural</option>
                    <option value="3"> Actividad deportiva</option>
                    <option value="4"> Personal</option>
                    <option value="5"> Del proyecto</option>
                </select>

                <br>
                Nombre de la actividad: <input type="text" name="nombreactividad">
                <br>
                Fecha de inicio  <input type="date" name="fechainicio">
                <br>
                Fecha de termino  <input type="date" name="fechatermino">
                <br>
                Descripcion <textarea rows="4" cols="50" name="descripcion"> </textarea>
                <br>
                Prioridad 
                <select name="prioridad">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>

                </select>
               
                <input type="submit" name="enviar" value="Registrar actividad">




            </form>


       
                 <%
           Connection c=null;
           Statement sta=null; 
           ResultSet r=null; 
           


            try{ 
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            c=DriverManager.getConnection("jdbc:mysql://localhost/smartdatabase","root","n0m3l0");
            sta=c.createStatement();
                
                
                
            }
            catch(SQLException error){
                
                out.println(error.toString());
            }
            
            try{
            String nombrebusqueda="javier"; //cambiar al usuario una ves hecha las sesiones
            r=sta.executeQuery("SELECT * FROM actividad where idUsuario='"+nombrebusqueda+"';");
            
            
            out.println("<table border= 1><tr><td>Actividad</td><td>Tipo</td><td>Inicio</td><td>Termino</td><td>Descripcion</td><td>Prioridad</td>");
            
            while(r.next()){
                
                String actividad = r.getString("NombreAct");
                String tipo = r.getString("IdTipoAct");
                String Fechaini = r.getString("FechaIni");
                Integer Fechafin = r.getInt("FechaFin");
                String Descripcion = r.getString("Descripción");
                String prioridad = r.getString("Prioridad");

                 
                 out.println("<tr><td>"+actividad+"</td>");
                 out.println("<td>"+tipo+"</td>");
                 out.println("<td>"+Fechaini+"</td>");
                 out.println("<td>"+Fechafin+"</td>");
                 out.println("<td>"+Descripcion+"</td>");
                 out.println("<td>"+prioridad+"</td>"); 

                 out.println("</tr>");
                 
                 }
             out.println("</table>");
            
            
            
            
            
            
            }
            catch(SQLException error){
                 out.println(error.toString());
            }
            %>
         </div>
    </body>
</html>
