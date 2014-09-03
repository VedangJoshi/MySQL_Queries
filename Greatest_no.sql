delimiter #
create procedure largest_no(in a int,
                            in b int,
                            in c int,
                            out res int)
begin
    if (a>b && a>c) then
      set res=a; 
    elseif (b>a && b>c) then
      set res=b; 
    elseif (c>a && c>b) then
      set res=c;
    end if;
end#
delimiter ; 


mysql> set @res=1;
Query OK, 0 rows affected (0.02 sec)

mysql> call largest_no(5,8,1,@res);
Query OK, 0 rows affected (0.01 sec)

mysql> select @res;
+------+
| @res |
+------+
|    8 |
+------+
1 row in set (0.00 sec)


mysql> set @res=1;
Query OK, 0 rows affected (0.00 sec)

mysql> call largest_no(1,5,2,@res);
Query OK, 0 rows affected (0.00 sec)

mysql> select @res;
+------+
| @res |
+------+
|    5 |
+------+
1 row in set (0.00 sec)

mysql> 