delimiter $
drop procedure if exists course_in_buildings;
create procedure course_in_buildings(in mybuild varchar(50))
begin
   
    declare if_end   int default 0;       
    declare room_num varchar(50);
    declare build    varchar(50);
    declare cap      int;
     
 
    declare find_all cursor for
            select   room_no,capacity,building from room
            where    building=mybuild;

    declare continue handler 
    for not found 
    set if_end=1;
       
  
    open find_all;    
    lup:loop   
            if if_end=1 then leave lup;
            end if;         
            fetch find_all into room_num,cap,build;
                  select   room_num,cap,build;
            
    end loop;
    
    close find_all;
end$
delimiter ;     
