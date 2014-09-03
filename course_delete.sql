delimiter $
create Trigger delete_log 
before delete 
on     room
for    each row 

begin
      insert into course_deletion_log values( concat(concat('Course Name :',old.course_name),concat('Course_number :',old.course_no))
                                              concat(concat('Department :',old.dept))
                                                     concat('Date of Deletion :',now)))                                                                  
        
end;$
delimiter ;
