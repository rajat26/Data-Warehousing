DELIMITER $$
DROP PROCEDURE IF EXISTS `helius`.`UpdateShiftAndHistory`$$

CREATE PROCEDURE `helius`.`UpdateShiftAndHistory` ()
BEGIN
DECLARE o decimal(19,4);
DECLARE id int;
DECLARE newo int;
DECLARE b decimal(19,4);
DECLARE c decimal(19,4);
DECLARE ytd decimal(19,4);
DECLARE sly decimal(19,4);
DECLARE r1 decimal(10,2);
DECLARE r2 decimal(10,2);
DECLARE hd DATE;
DECLARE d2 DATE;
DECLARE n varchar(256);

declare done int default 0;

DECLARE my_cursor CURSOR FOR SELECT EmployeeID, HireDate FROM `helius`.`employee`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN my_cursor;
set newo=1;
REPEAT
set r1 = rand()*2;
set r2 = rand()*14 + 1;
FETCH my_cursor INTO id, hd;
if r1 < 1 then
    insert into EmployeeDepartmentHistory values (id, r2, hd, 0, CURRENT_DATE());
else
    set d2 = DATE_ADD(hd, INTERVAL 1 YEAR);
    insert into EmployeeDepartmentHistory values (id, r2, hd, newo, d2 );
    insert into EmployeeDepartmentHistory values (id, r2+1, d2, 0, CURRENT_DATE());
    SELECT Name into n from Department where DepartmentID = (r2 DIV 1);
    insert into Shift values (newo, n, d2, CURRENT_DATE());
    set newo = newo+1;
end if;
UNTIL done END REPEAT;

CLOSE my_cursor;
END
