SET PATH=%PATH%;c:\Program Files\MySQL\MySQL Server 5.5\bin
SET MySQLUser=root
SET MySQLPWD=MySQL.55
SET DB=helius
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < ShipMethod.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Location.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < UnitMeasure.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Currency.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < CurrencyRate.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < CountryRegion.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < SalesTerritory.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < StateProvince.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Contact.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < CreditCard.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < ContactCreditCard.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Department.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Employee.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Employee_updateID.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < SalesPerson.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < SalesPerson_pc.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Customer.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Store.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < StoreContact.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Individual.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < ProductCategory.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < ProductSubCategory.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Product.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < UpdateProductListPriceHistory_pc.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < EmployeeDepartmentHistory.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < UpdateShiftAndHistory_pc.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < Addresses.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < SalesOrderHeader.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < UpdateSalesOrderDetail.sql
mysql --user=%MySQLUser% --password=%MySQLPWD% %DB% < CallProcedures.sql
