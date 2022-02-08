## DESCARREGAR DRIVERS JDBC

Descarrega les últimes versions dels drivers JDBC (que connecten Java amb bases de dades instal.lades):
[https://dev.mysql.com/downloads/connector/j/]

Triar Platform Independent; i se us baixarà un projecte amb un ZIP que dins conté un JAR.
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

## TUTORIALS INTERESSANTS

* [https://www.tutorialspoint.com/jdbc/index.htm]
* [https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html]
* [http://pdf.coreservlets.com]
