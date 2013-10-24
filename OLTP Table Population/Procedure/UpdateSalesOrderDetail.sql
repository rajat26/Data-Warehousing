DELIMITER $$
DROP PROCEDURE IF EXISTS `helius`.`UpdateSalesOrderDetail`$$

CREATE PROCEDURE `helius`.`UpdateSalesOrderDetail` ()
BEGIN
DECLARE o decimal(19,4);
DECLARE id int;
DECLARE newo int;
DECLARE c decimal(19,4);
DECLARE r1 decimal(10,4);
DECLARE r2 decimal(10,4);
DECLARE r3 decimal(10,4);
DECLARE r4 decimal(10,4);
DECLARE r5 decimal(10,4);
DECLARE price decimal(10,4);
DECLARE r21 decimal(10,4);
DECLARE i1 int;
DECLARE i2 int;
DECLARE i3 int;
DECLARE i4 int;
DECLARE i5 int;
DECLARE i21 int;
DECLARE d1 DATE;
DECLARE d2 DATE;
DECLARE d3 DATE;
DECLARE n varchar(256);
DECLARE total decimal(19,4);

declare done int default 0;

DECLARE my_cursor CURSOR FOR SELECT salesorderID, orderdate FROM `helius`.`salesorderheader`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN my_cursor;
set newo=0;
REPEAT
set total = 0;
set r1 = rand()*4;
set r2 = rand()*8;
set r21= rand()*8;
set r3 = rand()*49;
set r4 = rand()*89;
set i2 = r2 DIV 1;
set i21 = r21 DIV 1;
set i3 = (r3 DIV 1)+1;
set i4 = (r4 DIV 1)+10;
FETCH my_cursor INTO id, d1;
if r1 < 1 then
    select listprice into price from product where ProductId = i3;
    insert into salesorderdetail values (id, i3, '12345678', i4, price, 0, price*i4);
    set total = total + price*i4;
else
    select listprice into price from product where ProductId = i3;
    insert into salesorderdetail values (id, i3, '12345678', i4, price, 0, price*i4);
    set total = total + price*i4;
    REPEAT
    set r5 = rand()*8;
    set i5 = r5 DIV 1+1;
    set r4 = rand()*89;
    set i4 = (r4 DIV 1)+10;
    if( i5 = i3 ) then
        set i5 = i5-1;
    end if;
    if( i5 = 0 ) then
        set i5 = i5+2;
    end if;
    select listprice into price from product where ProductId = i5;
    insert into salesorderdetail values (id, i5, '12345678', i4, price, 0, price*i4);
    set total = total + price*i4;
    set newo = newo+1;
    set i3 = i5;
    UNTIL newo>=r1 END REPEAT;
end if;
    update salesorderheader set duedate = DATE_ADD(d1, INTERVAL i2+i21 MONTH), Shipdate = DATE_ADD(d1, INTERVAL i2 MONTH), Subtotal = total, TaxAmt = total* 0.1385, Freight = total*0.005, TotalDue = total*0.75 where salesorderid = id;
UNTIL done END REPEAT;

CLOSE my_cursor;
END
