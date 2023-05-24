Objective:To use concept of trigger 
Problem statement: To create an trigger on employee table,data deleted from emp table to be stored in emp_old table.
Author:Bhalerao Sahil Dnyaneshwar
Roll no: 15
PRN: UCS21M1015
Batch: AS1

mysql> use book66;
Database changed
mysql> show tables;
+------------------+
| Tables_in_book66 |
+------------------+
| books            |
| deleted          |
| student          |
+------------------+

#invoking triggers
here I created 3 triggers 
1)when inserted in student ,will be inserted in book
      	delimiter $$
	create trigger ins_books
	before insert on student
	for each row
	begin
	insert into book(rno,bid,status) values(new.rno,new.bid,'I');
	end$$
	delimiter ;
	
2)when deleted from student,will be inserted in deleted
	delimiter $$
	create trigger del_books
	before delete on student
	for each row
	begin
	insert into deleted(rno,bid,doi,dor) values(old.rno,old.bid,old.doi,old.dor);
	end$$
	delimiter ;
	
3)when deleted from student,will be deleted from book
	delimiter $$
	create trigger ins_books
	after delete  on student
	for each row
	begin
	delete from books where books.rno = old.rno ;
	end$$
	delimiter ;


