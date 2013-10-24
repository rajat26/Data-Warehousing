SET PATH=%PATH%;c:\Program Files\MySQL\MySQL Server 5.5\bin
SET MySQLUser=root
SET MySQLPWD=MySQL.55
SET DB=helius
mysql --user=%MySQLUser% --password=%MySQLPWD% -e "CREATE SCHEMA `helius`;"
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < helius.sql
