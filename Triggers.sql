delimiter $
create Trigger Check_Cap 
before insert on room
for each row 
begin
    if(new.capacity<0||new.capacity>30) then
      signal sqlstate '10101' 
      set message_text='Capacity ranges from 0 to 30';
        
     end if;
end;$
delimiter ;

***************************************************************************

mysql> source Triggers.sql
Query OK, 0 rows affected (0.01 sec)

mysql> insert into room values('A160',-13,'A');
ERROR 1644 (42000): Capacity ranges from 0 to 30


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
