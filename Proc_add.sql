 delimiter $
 drop procedure if exists Print3;
 create procedure Print3(in a int,out b int)
 begin
      set b=a*2; 
 end$
 delimiter ;


mysql> source Proc_add.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> call Print3(2,@b);
Query OK, 0 rows affected (0.02 sec)

mysql> select @b;
+------+
| @b   |
+------+
|    4 |
+------+
1 row in set (0.00 sec)
