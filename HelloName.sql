 delimiter $
 drop procedure if exists Print_name;
 create procedure Print_name(in name varchar(50))
 begin
   select concat('Hello ',name) as message;   
 end$
 delimiter ;

mysql> source HelloName.sql

Query OK, 0 rows affected (0.00 sec)

mysql> call Print_name('Vedang');
+--------------+
| message      |
+--------------+
| Hello Vedang |
+--------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)