delimiter $
drop procedure if exists mycalc;
create procedure mycalc(in var1 int,in var2 int,in opt int)
begin
    declare var3 int default 0;
    case opt
         when 1 then 
                   set var3=var1+var2;
                   select concat('Sum is: ', var3) as Result;
         when 2 then 
                   set var3=var1-var2;
                   select concat('Difference is: ',var3) as Result;
         when 3 then 
                   set var3=var1/var2; 
                   select concat('Division is: ',var3) as Result;
         when 4 then 
                   set var3=var1*var2;
                   select concat('Multiplication is: ', var3) as Result;
     end case;
end$
delimiter ;

                   
mysql> source calc.sql
Query OK, 0 rows affected, 1 warning (0.03 sec)

Query OK, 0 rows affected (0.06 sec)

mysql> call mycalc(1,2,1);
+--------------------------+
| concat('Sum is: ', var3) |
+--------------------------+
| Sum is: 3                |
+--------------------------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

mysql> call mycalc(1,2,4);
+-------------------------------------+
| concat('Multiplication is: ', var3) |
+-------------------------------------+
| Multiplication is: 2                |
+-------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call mycalc(33,3,3);
+------------------------------+
| concat('Division is: ',var3) |
+------------------------------+
| Division is: 11              |
+------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> call mycalc(1,2,4);
+----------------------+
| message              |
+----------------------+
| Multiplication is: 2 |
+----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)



mysql> call mycalc(1,2,4);
+----------------------+
| Result               |
+----------------------+
| Multiplication is: 2 |
+----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call mycalc(1,2,3);
+----------------+
| Result         |
+----------------+
| Division is: 1 |
+----------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> call mycalc(1,2,2);
+-------------------+
| Result            |
+-------------------+
| Difference is: -1 |
+-------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.02 sec)

mysql>