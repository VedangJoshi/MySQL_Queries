delimiter $
drop procedure if exists find_course;
create procedure find_course()
begin
   
    declare if_end int default 0;       
    declare c_name varchar(50);
    declare dept   varchar(50);
    declare c_no   varchar(10);
    
     
 
    declare find_all cursor for
            select course_name,course_no,dept from course;

    declare continue handler 
    for     not found 
    set     if_end=1; 
    
  
    open find_all;    
    lup:loop
           
            if if_end=1 then leave lup;
            end if;
            fetch find_all into c_name,c_no,dept;
                  select c_name,c_no,dept;
    end loop;
    
    close find_all;
end$
delimiter ;     

**************************************************************************

mysql> source cursor.sql;
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call find_course();
+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| DBMS   | 101  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| TOC    | 102  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| WT     | 103  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| SE     | 104  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| CNT    | 105  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| ESDL   | 107  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| TOC    | 202  | NULL |
+--------+------+------+
1 row in set (0.01 sec)

+--------+------+------+
| c_name | c_no | dept |
+--------+------+------+
| TOC    | 202  | NULL |
+--------+------+------+
1 row in set (0.03 sec)

Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql>

                                               