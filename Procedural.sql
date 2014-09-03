(1) delimiter $
    create procedure Print3()
    begin
    select 'Hello World!' as message;
    end$
    delimiter ;


mysql> source  Procedural.sql;
Query OK, 0 rows affected (0.02 sec)

mysql> call Print3;
+--------------+
| message      |
+--------------+
| Hello World! |
+--------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


    