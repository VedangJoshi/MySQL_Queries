    delimiter $
    drop procedure if exists Print2;
    create procedure Print2( IN cname varchar(50))
       begin
           select * from course 
           where course_name=cname;
       end$
    delimiter ;

mysql> source  plsql12.sql;
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> call Print2('TOC');
+-------------+-----------+------+------------+
| course_name | course_no | dept | date       |
+-------------+-----------+------+------------+
| TOC         | 102       | IT   | 2014-07-03 |
| TOC         | 202       | Comp | 2014-07-03 |
+-------------+-----------+------+------------+
2 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)