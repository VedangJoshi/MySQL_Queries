delimiter //
create procedure cnt(in name varchar(100))
begin
declare var1 varchar(100);
set var1="Hello";
select concat(var1,name);
end;
