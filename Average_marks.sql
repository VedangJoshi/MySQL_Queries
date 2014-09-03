delimiter $
drop procedure if exists Find_grade;
create procedure Find_grade(in num int)
begin  
     declare if_end int default 0; 
     declare ma1 int;     
     declare ma2 int;
     declare ma3 int;
     declare avrg int;
     declare find_grade cursor
     for     select m1,m2,m3
             from   student;

     declare continue handler 
     for not found 
     set if_end=1; 
    
     open find_grade;    
     lup: loop           
            if(if_end=1) 
               then leave lup;
            end if;

            fetch find_grade 
            into ma1,ma2,ma3;
            set avrg=(ma1+ma2+ma3)/3;
            select ma1,ma2,ma3,avrg;
     end loop;
     close find_grade;     
end$
delimiter ;     
