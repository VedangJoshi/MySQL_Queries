delimiter $
create Trigger Check_Building_Name
before update on room
for each row 
begin
    if( substring(new.room_no,4,-1)!=old.building ) then
      signal sqlstate '10102' 
      set message_text='Room_no literal should be the same as first letter in Building Name';        
     end if;
end;$
delimiter ;

*******************************************************************************************************************

mysql> source Trigger_Update.sql
ERROR 1359 (HY000): Trigger already exists
mysql> source Trigger_Update.sql
Query OK, 0 rows affected (0.03 sec)

mysql> update room set room_no='B304' where building='C';
ERROR 1644 (10102): Building Name literal should be the same as first letter in Room_no
mysql> update room set building='C' where room_no='B302';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from room;
+---------+----------+----------+
| room_no | capacity | building |
+---------+----------+----------+
| A104    |       30 | A        |
| B203    |       30 | B        |
| C302    |       30 | C        |
| C304    |       30 | C        |
| C306    |       30 | C        |
| C404    |       30 | C        |
+---------+----------+----------+
6 rows in set (0.00 sec)

mysql> select * from room;
+---------+----------+----------+
| room_no | capacity | building |
+---------+----------+----------+
| A104    |       30 | A        |
| B203    |       30 | B        |
| C302    |       30 | C        |
| C304    |       30 | C        |
| C306    |       30 | C        |
| C404    |       30 | C        |
+---------+----------+----------+
6 rows in set (0.00 sec)

mysql> update room set building='C' where room_no='B302';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from room;
+---------+----------+----------+
| room_no | capacity | building |
+---------+----------+----------+
| A104    |       30 | A        |
| B203    |       30 | B        |
| C302    |       30 | C        |
| C304    |       30 | C        |
| C306    |       30 | C        |
| C404    |       30 | C        |
+---------+----------+----------+
6 rows in set (0.00 sec)

mysql> update room set building='C' where room_no='B302';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> source Trigger_Update.sql
Query OK, 0 rows affected (0.03 sec)

mysql> update room set room_no='B304' where building='C';
ERROR 1644 (10102): Building Name literal should be the same as first letter in Room_no
mysql> update room set building='C' where room_no='B302';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from room;
+---------+----------+----------+
| room_no | capacity | building |
+---------+----------+----------+
| A104    |       30 | A        |
| B203    |       30 | B        |
| C302    |       30 | C        |
| C304    |       30 | C        |
| C306    |       30 | C        |
| C404    |       30 | C        |
+---------+----------+----------+
6 rows in set (0.00 sec)
