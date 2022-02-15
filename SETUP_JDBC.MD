## DESCARREGAR DRIVERS JDBC

Descarrega les últimes versions dels drivers JDBC (que connecten Java amb bases de dades instal.lades):

### MYSQL
[https://dev.mysql.com/downloads/connector/j/]
Triar Platform Independent; i se us baixarà un projecte amb un ZIP que dins conté un JAR.

### MARIADB
[https://mariadb.com/downloads/connectors/]
Triar SourceCode; i se us baixarà un projecte amb un ZIP que dins conté un JAR.

Aquesta és la llibreria que necessitareu!

## CREACIÓ BASE DE DADES D'EXEMPLE.

````
CREATE TABLE `users` (
`username` varchar(50) NOT NULL,
`password` varchar(50) NOT NULL,
`role` varchar(50) NOT NULL,
PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
````

## Configurar la cadena de connexió a JDBC.

Esta forma solo funciona con MYSQL.
````
//Paso 1: cargo el driver de mysql
Class.forName("com.mysql.jdbc.Driver").newInstance();
            
//Paso 2:hacer la conexión
conn = DriverManager.getConnection("jdbc:mysql://localhost/biodatabasem15uf1","root","root");
````


### Mejor este código, que es compatible con MySQL y MariaDB.
````
  //Cargaremos el driver JDBC de acceso a MySQL/MariaDB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException error) {
            System.out.println("Error al cargar el driver JDBC de MySQL: " + error.getMessage());
        }
 
        //Realizamos la conexión con el servidor MySQL/MariaDB
        //Con los datos de conexión: dirección, puerto, usuario y contraseña
        //En este ejemplo suponemos que el servidor MySQL está en localhost, puerto 3306, usuario root, sin contraseña
        Connection conBD = null;
        try {
            conBD = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/lista_compra?serverTimezone=UTC",
                    "root", "");
        } catch (SQLException error) {
            System.out.println("Error al conectar con el servidor MySQL/MariaDB: " + error.getMessage());
        }
````


## TUTORIALS INTERESSANTS

* [https://www.tutorialspoint.com/jdbc/index.htm]
* [https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html]
* [http://pdf.coreservlets.com]
