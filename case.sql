create procedure proc_case(IN a INT)
begin
declare b INT;
declare c INT;
set b=10;
case a
     when 0 then select c+b;
     when 1 then select c+b;
     else select c+b;
end case;
end;

