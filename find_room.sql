delimiter $

create function course_room(rno varchar(50))
returns varchar(50)
begin  
     declare if_end int default 0; 
     declare cn varchar(50);     
     declare room varchar(5);
     declare find_all cursor
     for     select course_name
             from   course
             where  room_no=rno;

     declare continue handler 
     for     not found 
     set     if_end=1; 
    
     open find_all;    
     lup: loop           
            if if_end=1 then leave lup;
            end if;
            fetch find_all into cn;
                  select cn;
     end loop;
     close find_all;     
     return cn;
end$
delimiter ;     
