DELIMITER $$
DROP PROCEDURE IF EXISTS `helius`.`UpdateSalesPersonInfo`$$

CREATE PROCEDURE `helius`.`UpdateSalesPersonInfo` ()
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

declare done int default 0;

DECLARE my_cursor CURSOR FOR SELECT SalesPersonId, SalesQuota FROM `helius`.`salesperson`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

OPEN my_cursor;
set r1 = rand()*0.5 + 0.5;
set r2 = rand()*0.5 + 0.5;
REPEAT
FETCH my_cursor INTO id, o;
set newo = FLOOR(o);
set newo=(newo DIV 10)*10;
set c = (newo DIV 250)*0.5;
set r1 = rand()*0.5 + 0.5;
set r2 = rand()*0.5 + 0.5;
set ytd = newo * 11 * r1;
set sly = newo * 12 * r2;
set b = ytd/11*c/100;
update `helius`.`salesperson` set SalesQuota=newo, Bonus=b, CommisionPct=c, SalesYTD=ytd, SalesLastYear=sly where SalesPersonId = id;
UNTIL done END REPEAT;

CLOSE my_cursor;
END
