<%-- 
    Document   : indec
    Created on : Feb 12, 2019, 4:25:34 PM
    Author     : alumne
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
           
         Connection conn=null;//connexió, cadena
         Statement stmt = null;//la que hace la consulta "normal"
         
         PreparedStatement pstmt=null;//la que hace consulta preparada
         
         CallableStatement cstmt=null;
         
         ResultSet rst=null;//la classe quan fas un select
         
        try{
         
        /* Paso 0:
            Cread la tabla:
        CREATE TABLE `users` (
            `username` varchar(50) NOT NULL,
            `password` varchar(50) NOT NULL,
            `role` varchar(50) NOT NULL,
            PRIMARY KEY (`username`)
           ) ENGINE=InnoDB
            */
        //Paso 1: cargo el driver de mysql
        Class.forName("com.mysql.jdbc.Driver").newInstance();
            
        //Paso 2:hacer la conexión
            conn =
            DriverManager.getConnection("jdbc:mysql://localhost/biodatabasem15uf1",
                    "root","root");
         //si llegas al siguiente out es que todo va bien
            out.println("<h3>Conseguí conectarme!</h3>");

        //Paso 3: una consulta  con la conexión conn
           
        /* CONSULTA EN TRANSACCION*/
        conn.setAutoCommit(false);
        stmt = conn.createStatement();
        // Ojo! Este código no previene la inyección SQL.
        String SQL = "INSERT INTO users VALUES ('dawbio1b', 'dawbio1b', 'staff')";
        // stmt.executeUpdate(SQL);  
        // Submit a malformed SQL statement that breaks
        // SQL = "INSERTED IN users VALUES ('Pedro', 'Tez', 'staff')";
        // stmt.executeUpdate(SQL);
        // If there is no error.
        conn.commit();
        out.println("<h4>Conseguí insertar al usuario.</h4>")   ;

        /*CONSULTA A UN PROCEDIMIENTO ALMACENADO*/
        /*    cstmt=conn.prepareCall("{CALL insering(?,?,?)}");
        //donde insering es un procedimiento almacenado ya hecho en la base de datos
            cstmt.setString(1, "user10");
            cstmt.setString(2, "passw10");
            cstmt.setString(3, "role5");
            int rowsAffected=cstmt.executeUpdate();*/

            /*CONSULTA PREPARADA, SELECT CON WHERE
            /* pstmt=conn.prepareStatement("Insert into users values(?,?,?)");
            pstmt.setString(1, "user6");
            pstmt.setString(2, "passw5");
            pstmt.setString(3, "role5");
            
            int rowsAffected=pstmt.executeUpdate();
            */
            
            // Esta consulta SQL es más segura que la anterior, debido al ?
            // http://www.chuidiang.org/java/mysql/PreparedStatement-java-mysql.php
            out.println("<h3>Select * from users where username=?</h3>");
            pstmt=conn.prepareStatement("Select * from users where username=?");
            pstmt.setString(1, "user2");
            rst=pstmt.executeQuery();
            while(rst.next()){
                out.println(rst.getString("username"));
                out.println("--");
                out.println(rst.getString("password"));
                out.println("--");
                out.println(rst.getString("role"));
                out.println("<br/>");
            }
           
            /* CONSULTA "NORMAL", SELECT SIN WHERE
            stmt = conn.createStatement();
            //el objeto Statement hace la consulta 
            int rowsAffected=stmt.executeUpdate("Insert into users values('user4','passw4','staff')");
            //insert, delete, update, create table,..
            out.println("<br/>Hay "+rowsAffected+ " filas afectadas");
            */
            out.println("<h3>SELECT * from users</h3>");
            stmt = conn.createStatement();
            //el objeto Statement hace la consulta 
            rst=stmt.executeQuery("SELECT * from users");
            //rst contiene toda la tabla. La recorro
            while(rst.next()){
                out.println(rst.getString("username"));
                out.println("--");
                out.println(rst.getString("password"));
                out.println("--");
                out.println(rst.getString("role"));
                out.println("<br/>");
            }
            
// Paso 5. Select de la tabla pacientes.
//            CREATE TABLE `patients` (
//  `name` varchar(50) NOT NULL,
//  `comments` varchar(100) NOT NULL,
//  `bloodType` varchar(5) NOT NULL,
//  PRIMARY KEY (`name`)
//) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
//INSERT INTO biodatabasem15uf1.patients
//(name, comments, bloodType)
//VALUES('Miquel', 'SANO', 'A+');
            out.println("<h3>Select * from patients where comments=?</h3>");
            pstmt=conn.prepareStatement("Select * from patients where comments=?");
            pstmt.setString(1, "SALUDABLE");
            rst=pstmt.executeQuery();
            while(rst.next()){
                out.println(rst.getString("name"));
                out.println("--");
                out.println(rst.getString("comments"));
                out.println("--");
                out.println(rst.getString("bloodType"));
                out.println("<br/>");
            }
      
        }catch(ClassNotFoundException e1){
            out.println("eoeoeoeeo"+e1.getMessage());
        }catch(SQLException e2){
            //si hacemos transacción
            conn.rollback();
            out.println("SQLException"+e2.getMessage());
        }catch (Exception ex) {
            out.println(ex.getMessage());
        }finally {
            if (rst != null) {
                try {
                    rst.close();
                } catch (SQLException sqlEx) { } // ignore
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) { } // ignore

                stmt = null;
            }
        }       
        %>
    </body>
</html>
