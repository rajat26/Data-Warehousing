call UpdateSalesPersonInfo;
call UpdateProductListPriceHistory;
call UpdateShiftAndHistory;
call UpdateSalesOrderDetail;

CREATE TABLE `dwconfig` (
  `iddwConfig` int(11) NOT NULL,
  `lastRun` datetime NOT NULL,
  PRIMARY KEY (`iddwConfig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into dwConfig values (1, '1970-01-01');
