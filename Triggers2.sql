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