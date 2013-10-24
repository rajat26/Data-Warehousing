DELIMITER $$
DROP PROCEDURE IF EXISTS `helius`.`UpdateProductListPriceHistory`$$

CREATE PROCEDURE `helius`.`UpdateProductListPriceHistory` ()
BEGIN
DECLARE o decimal(19,4);
DECLARE id int;
DECLARE newo int;
DECLARE c decimal(19,4);
DECLARE r1 decimal(10,4);
DECLARE r2 decimal(10,4);
DECLARE d1 DATE;
DECLARE d2 DATE;
DECLARE d3 DATE;
DECLARE n varchar(256);

declare done int default 0;

DECLARE my_cursor CURSOR FOR SELECT ProductID, ListPrice, SellStartDate, SellEndDate FROM `helius`.`Product`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN my_cursor;
set newo=1;
REPEAT
set r1 = rand()*2;
set r2 = rand()*0.4 + 0.8;
FETCH my_cursor INTO id, c, d1, d2;
if r1 < 1 then
    insert into productlistpricehistory values (id, d1, d2, c);
else
    set d3 = DATE_ADD(d1, INTERVAL 1 YEAR);
    if d2 < d3 then
        insert into productlistpricehistory values (id, d1, d2, c);
    else
        insert into productlistpricehistory values (id, d1, d3, c);
        insert into productlistpricehistory values (id, d3, d2, c*r2);
    end if;
end if;
UNTIL done END REPEAT;

CLOSE my_cursor;
END
