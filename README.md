# m15uf1-a06-first-mysql-javaweb
Guia de passos per a crear un projecte Java Web (Servlets+JSP) per a connectar amb una base de dades MySQL.
Pròximament.

### Programari requerit per desenvolupar aplicacions web amb Java:

* IDE amb suport per PHP → Apache Netbeans 12.
* **JDK → JDK 8 actualitzada.**
També caldrà tenir una JDK 11.
* **Servidor web configurat amb Java → Apache Tomcat 9.0.20 o Glassfish 5.**
* Llibreria JavaEE Web 7 (Apache Netbeans la inclou)
* **Sistema Gestor de Base de Dades → MySQL o MariaDB**
* Programa Administració BD → PHPMyAdmin o HeidiSQL. 
Són opcions lleugeres, alternatives a la consola de mysql

Si teniu un una instal·lació XAMPP / LAMPP, podeu aprofitar el MySQL i fins i tot el client XAMPP (no recomanable en entorns reals)

### Instal·lació MySQL a Ubuntu 18/20.

**Instal·lar els paquets.**
```
sudo apt update
sudo apt install mysql-server mysql-client
```
**Configurar la seguretat.**
```
sudo mysql_secure_installation
```

```
Enter current password for root (enter for none): rootroot
Set root password? y
New password: rootroot
Re-enter new password: rootroot
Remove anonymous users? y
Disallow root login remotely? y
Reload privilege tables now? y
```

**Reiniciar els serveis.**
```
sudo systemctl restart apache2
sudo systemctl restart mysql
```

**Accedir a MySQL.**
```
sudo mysql --version
sudo mysql -u root -p
```

Més info a https://help.ubuntu.com/lts/serverguide/mysql.html

### Instal·lació MySQL a Windows.

Incorpora servidor MySQL i client gràfic.
https://www.adslzone.net/esenciales/windows-10/instalar-mysql/



### Instal·lació client MySQL multiplataforma dbBeaver.

A Linux:
```
sudo snap install dbeaver-ce
```

Més info a https://dbeaver.io/download/


