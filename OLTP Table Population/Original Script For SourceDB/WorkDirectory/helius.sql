CREATE  TABLE `helius`.`Currency` (
  `CurrencyCode` CHAR(3) NOT NULL ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`CurrencyCode`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`SalesTerritory` (
  `TerritoryId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `CountryRegionCode` VARCHAR(3) NULL ,
  `Group` VARCHAR(50) NULL ,
  `SalesYTD` DECIMAL(19,4) NULL ,
  `SalesLastYear` DECIMAL(19,4) NULL ,
  `CostYTD` DECIMAL(19,4) NULL ,
  `CostLastYear` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`TerritoryId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`CreditCard` (
  `CreditCardId` INT(10) NOT NULL AUTO_INCREMENT ,
  `CardType` VARCHAR(50) NULL ,
  `CardNumber` VARCHAR(25) NULL ,
  `ExpMonth` INT(10) NULL ,
  `ExpYear` INT(10) NULL ,
  PRIMARY KEY (`CreditCardId`) ,
  UNIQUE INDEX `CardNumber_UNIQUE` (`CardNumber` ASC) );
CREATE  TABLE `helius`.`Department` (
  `DepartmentId` INT(5) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `GroupName` VARCHAR(1024) NULL ,
  PRIMARY KEY (`DepartmentId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`Shift` (
  `ShiftId` INT(3) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `StartTime` DATETIME NULL ,
  `EndTime` DATETIME NULL ,
  PRIMARY KEY (`ShiftId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,
  UNIQUE INDEX `Stime` (`StartTime` ASC, `EndTime` ASC) );
CREATE  TABLE `helius`.`AddressType` (
  `AddressTypeId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`AddressTypeId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`CountryRegion` (
  `CountryRegionCode` VARCHAR(8) NOT NULL ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`CountryRegionCode`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`Contact` (
  `ContactId` INT(10) NOT NULL AUTO_INCREMENT ,
  `NameStyle` TINYINT(1)  NULL ,
  `Title` VARCHAR(8) NULL ,
  `FirstName` VARCHAR(250) NULL ,
  `MiddleName` VARCHAR(250) NULL ,
  `LastName` VARCHAR(250) NULL ,
  `Suffix` VARCHAR(10) NULL ,
  `EmailAddress` VARCHAR(50) NULL ,
  `EmailPromotion` INT(11)  NULL ,
  `Phone` VARCHAR(250) NULL ,
  `PasswordHash` VARCHAR(40) NULL ,
  `PasswordSalt` VARCHAR(10) NULL ,
  `AdditionalContactInfo` VARCHAR(1024) NULL ,
  PRIMARY KEY (`ContactId`) );
CREATE  TABLE `helius`.`ContactType` (
  `ContactTypeId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`ContactTypeId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`UnitMeasure` (
  `UnitMeasureCode` CHAR(3) NOT NULL ,
  `Name` VARCHAR(250) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`UnitMeasureCode`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`Vendor` (
  `VendorId` INT(10) NOT NULL AUTO_INCREMENT ,
  `AccountNumber` VARCHAR(250) NULL ,
  `Name` VARCHAR(250) NULL ,
  `CreditRating` INT(11)  NULL ,
  `PreferredVendorState` TINYINT(1)  NULL ,
  `ActiveFlag` TINYINT(1)  NULL ,
  `PurchasingWebServiceURL` VARCHAR(1024) NULL ,
  PRIMARY KEY (`VendorId`) ,
  UNIQUE INDEX `AccountNumber_UNIQUE` (`AccountNumber` ASC) );
CREATE  TABLE `helius`.`ShipMethod` (
  `ShipMethodId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `ShipBase` DECIMAL(19,4) NULL ,
  `ShipRate` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`ShipMethodId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`ProductCategory` (
  `ProductCategoryId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`ProductCategoryId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`ProductModel` (
  `ProductModelId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `CatalogDescription` VARCHAR(1024) NULL ,
  `Instructions` VARCHAR(1024) NULL ,
  `RowGuid` VARCHAR(250) NULL ,
  PRIMARY KEY (`ProductModelId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,
  UNIQUE INDEX `RowGuid_UNIQUE` (`RowGuid` ASC) );
CREATE  TABLE `helius`.`Location` (
  `LocationId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `CostRate` DECIMAL(19,4) NULL ,
  `Availability` DECIMAL(8,2) NULL ,
  PRIMARY KEY (`LocationId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) );
CREATE  TABLE `helius`.`ProductSubCategory` (
  `ProductSubCategoryId` INT(10) NOT NULL AUTO_INCREMENT ,
  `ProductCategoryId` INT(10) NULL ,
  `Name` VARCHAR(250) NULL ,
  PRIMARY KEY (`ProductSubCategoryId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,
  INDEX `ProductCategory` (`ProductCategory` ASC) ,
  CONSTRAINT `ProductCategory`
    FOREIGN KEY (`ProductCategoryId` )
    REFERENCES `helius`.`productcategory` (`ProductCategoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Customer` (
  `CustomerId` INT(10) NOT NULL AUTO_INCREMENT ,
  `TerritoryId` INT(10) NULL ,
  `AccountNumber` VARCHAR(10) NULL ,
  `CustomerType` CHAR(1) NULL ,
  PRIMARY KEY (`CustomerId`) ,
  UNIQUE INDEX `AccountNumber_UNIQUE` (`AccountNumber` ASC) ,
  INDEX `TerritoryId` (`TerritoryId` ASC) ,
  CONSTRAINT `TerritoryId`
    FOREIGN KEY (`TerritoryId` )
    REFERENCES `helius`.`salesterritory` (`TerritoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Employee` (
  `EmployeeId` INT(10) NOT NULL AUTO_INCREMENT ,
  `NationalIdNumber` VARCHAR(15) NULL ,
  `ContactId` INT(10) NULL ,
  `LoginId` VARCHAR(250) NULL ,
  `ManagerId` INT(10) NULL ,
  `ShiftId` INT(10) NULL ,
  `Title` VARCHAR(50) NULL ,
  `BirthDate` DATETIME NULL ,
  `MaritalStatus` CHAR(1) NULL ,
  `Gender` CHAR(1) NULL ,
  `HireDate` DATETIME NULL ,
  `SalariedFlag` TINYINT(1)  NULL ,
  `VacationHours` INT(10) NULL ,
  `SickLeaveHours` INT(10) NULL ,
  `CurrentFlag` TINYINT(1)  NULL ,
  PRIMARY KEY (`EmployeeId`) ,
  UNIQUE INDEX `NationalIdNumber_UNIQUE` (`NationalIdNumber` ASC) ,
  UNIQUE INDEX `LoginId_UNIQUE` (`LoginId` ASC) ,
  INDEX `ContactId` (`ContactId` ASC) ,
  CONSTRAINT `ContactId`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`SalesPerson` (
  `SalesPersonId` INT(10) NOT NULL ,
  `TerritoryId` INT(10) NULL ,
  `SalesQuota` DECIMAL(19,4) NULL ,
  `Bonus` DECIMAL(19,4) NULL ,
  `CommisionPct` DECIMAL(10,4) NULL ,
  `SalesYTD` DECIMAL(19,4) NULL ,
  `SalesLastYear` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`SalesPersonId`) ,
  INDEX `Employee` (`SalesPersonId` ASC) ,
  INDEX `Territory` (`TerritoryId` ASC) ,
  CONSTRAINT `Employee`
    FOREIGN KEY (`SalesPersonId` )
    REFERENCES `helius`.`employee` (`EmployeeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Territory`
    FOREIGN KEY (`TerritoryId` )
    REFERENCES `helius`.`salesterritory` (`TerritoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`EmployeeDepartmentHistory` (
  `EmployeeId` INT(10) NOT NULL ,
  `DepartmentId` INT(10) NOT NULL ,
  `StartDate` DATETIME NOT NULL ,
  `ShiftId` INT(10) NOT NULL ,
  `EndDate` DATETIME NULL ,
  PRIMARY KEY (`EmployeeId`, `StartDate`, `ShiftId`, `DepartmentId`) ,
  INDEX `EmployeeId` (`EmployeeId` ASC) ,
  INDEX `DepartmentId` (`DepartmentId` ASC) ,
  INDEX `ShiftId` (`ShiftId` ASC) ,
  CONSTRAINT `EmployeeId`
    FOREIGN KEY (`EmployeeId` )
    REFERENCES `helius`.`employee` (`EmployeeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DepartmentId`
    FOREIGN KEY (`DepartmentId` )
    REFERENCES `helius`.`department` (`DepartmentId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
#  CONSTRAINT `ShiftId`
#    FOREIGN KEY (`ShiftId` )
#    REFERENCES `helius`.`shift` (`ShiftId` )
#    ON DELETE NO ACTION
#    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Individual` (
  `CustomerId` INT(10) NOT NULL ,
  `ContactId` INT(10) NULL ,
  `Demographics` VARCHAR(1024) NULL ,
  PRIMARY KEY (`CustomerId`) ,
  INDEX `Customer` (`CustomerId` ASC) ,
  INDEX `Contact` (`ContactId` ASC) ,
  CONSTRAINT `Customer`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `helius`.`customer` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contact`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Store` (
  `CustomerId` INT(10) NOT NULL ,
  `Name` VARCHAR(1024) NULL ,
  `Demographics` VARCHAR(1024) NULL ,
  `RowGuid` VARCHAR(250) NULL ,
  `SalesPersonId` INT(10) NULL ,
  PRIMARY KEY (`CustomerId`) ,
  UNIQUE INDEX `RowGuid_UNIQUE` (`RowGuid` ASC) ,
  INDEX `CustomerI` (`CustomerId` ASC) ,
  INDEX `SalesPersonI` (`SalesPersonId` ASC) ,
  CONSTRAINT `CustomerI`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `helius`.`customer` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SalesPersonI`
    FOREIGN KEY (`SalesPersonId` )
    REFERENCES `helius`.`salesperson` (`SalesPersonId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`StateProvince` (
  `StateProvinceId` INT(10) NOT NULL AUTO_INCREMENT ,
  `StateProvinceCode` CHAR(3) NULL ,
  `CountryRegionCode` VARCHAR(8) NULL ,
  `IsOnlyStateProvinceFlag` TINYINT(1)  NULL ,
  `Name` VARCHAR(250) NULL ,
  `TerritoryId` INT(10) NULL ,
  PRIMARY KEY (`StateProvinceId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,
  UNIQUE INDEX `code` (`StateProvinceCode` ASC, `CountryRegionCode` ASC) ,
  INDEX `CountryRegionc` (`CountryRegionCode` ASC) ,
  INDEX `TerritoryIDe` (`TerritoryId` ASC) ,
  CONSTRAINT `CountryRegionc`
    FOREIGN KEY (`CountryRegionCode` )
    REFERENCES `helius`.`countryregion` (`CountryRegionCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TerritoryIDe`
    FOREIGN KEY (`TerritoryId` )
    REFERENCES `helius`.`salesterritory` (`TerritoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`SalesTaxRate` (
  `SalesTaxRateId` INT(10) NOT NULL AUTO_INCREMENT ,
  `StateProvinceId` INT(10) NULL ,
  `TaxType` INT(10) NULL ,
  `TaxRate` DECIMAL(19,4) NULL ,
  `Name` VARCHAR(1024) NULL ,
  PRIMARY KEY (`SalesTaxRateId`) ,
  UNIQUE INDEX `ST` (`TaxType` ASC, `StateProvinceId` ASC) ,
  INDEX `StateProvince` (`SalesTaxRateId` ASC) ,
  CONSTRAINT `StateProvince`
    FOREIGN KEY (`SalesTaxRateId` )
    REFERENCES `helius`.`stateprovince` (`StateProvinceId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Address` (
  `AddressId` INT(10) NOT NULL AUTO_INCREMENT ,
  `AddressLine1` VARCHAR(60) NULL ,
  `AddressLine2` VARCHAR(60) NULL ,
  `City` VARCHAR(30) NULL ,
  `StateProvinceId` INT(10) NULL ,
  `PostalCode` VARCHAR(15) NULL ,
  PRIMARY KEY (`AddressId`) ,
  UNIQUE INDEX `U2` (`AddressLine1` ASC, `AddressLine2` ASC, `City` ASC, `StateProvinceId` ASC, `PostalCode` ASC) ,
  INDEX `stateProvincee` (`StateProvinceId` ASC) ,
  CONSTRAINT `stateProvincee`
    FOREIGN KEY (`StateProvinceId` )
    REFERENCES `helius`.`stateprovince` (`StateProvinceId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`EmployeeAddress` (
  `EmployeeId` INT(10) NOT NULL ,
  `AddressId` INT(10) NOT NULL ,
  PRIMARY KEY (`EmployeeId`, `AddressId`) ,
  INDEX `Emp` (`EmployeeId` ASC) ,
  INDEX `Add` (`AddressId` ASC) ,
  CONSTRAINT `Emp`
    FOREIGN KEY (`EmployeeId` )
    REFERENCES `helius`.`employee` (`EmployeeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Add`
    FOREIGN KEY (`AddressId` )
    REFERENCES `helius`.`address` (`AddressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`VendorAddress` (
  `VendorId` INT(10) NOT NULL ,
  `AddressId` INT(10) NOT NULL ,
  `AddressTypeId` INT(10) NULL ,
  PRIMARY KEY (`VendorId`, `AddressId`) ,
  INDEX `Vendor` (`VendorId` ASC) ,
  INDEX `Address` (`AddressId` ASC) ,
  INDEX `AddressTypeId` (`AddressTypeId` ASC) ,
  CONSTRAINT `Vendor`
    FOREIGN KEY (`VendorId` )
    REFERENCES `helius`.`vendor` (`VendorId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address`
    FOREIGN KEY (`AddressId` )
    REFERENCES `helius`.`address` (`AddressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddressTypeId`
    FOREIGN KEY (`AddressTypeId` )
    REFERENCES `helius`.`addresstype` (`AddressTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`StoreContact` (
  `CustomerId` INT(10) NOT NULL ,
  `ContactId` INT(10) NOT NULL ,
  `ContactTypeId` INT(10) NULL ,
  PRIMARY KEY (`CustomerId`, `ContactId`) ,
  INDEX `Customerr` (`CustomerId` ASC) ,
  INDEX `Contactt` (`ContactId` ASC) ,
  INDEX `ContactTypeIdd` (`ContactTypeId` ASC) ,
  CONSTRAINT `Customerr`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `helius`.`customer` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contactt`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
#  CONSTRAINT `ContactTypeIdd`
#    FOREIGN KEY (`ContactTypeId` )
#    REFERENCES `helius`.`contacttype` (`ContactTypeId` )
#    ON DELETE NO ACTION
#    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`VendorContact` (
  `VendorId` INT(10) NOT NULL ,
  `ContactId` INT(10) NOT NULL ,
  `ContactTypeId` INT(10) NULL ,
  PRIMARY KEY (`VendorId`, `ContactId`) ,
  INDEX `Vend` (`VendorId` ASC) ,
  INDEX `Cont` (`ContactId` ASC) ,
  INDEX `ContactTyp` (`ContactTypeId` ASC) ,
  CONSTRAINT `Vend`
    FOREIGN KEY (`VendorId` )
    REFERENCES `helius`.`vendor` (`VendorId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Cont`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
#  CONSTRAINT `ContactTyp`
#    FOREIGN KEY (`ContactTypeId` )
#    REFERENCES `helius`.`contacttype` (`ContactTypeId` )
#    ON DELETE NO ACTION
#    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`PurchaseOrderHeader` (
  `PurchaseOrderId` INT(10) NOT NULL AUTO_INCREMENT ,
  `RevisionNumnber` INT(10) NULL ,
  `Status` INT(10) NULL ,
  `EmployeeId` INT(10) NULL ,
  `VendorId` INT(10) NULL ,
  `ShipMethodId` INT(10) NULL ,
  `OrderDate` DATETIME NULL ,
  `ShipDate` DATETIME NULL ,
  `SubTotal` DECIMAL(19,4) NULL ,
  `TaxAmt` DECIMAL(19,4) NULL ,
  `Freight` DECIMAL(19,4) NULL ,
  `TotalDue` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`PurchaseOrderId`) ,
  INDEX `Empl` (`EmployeeId` ASC) ,
  INDEX `Ven` (`VendorId` ASC) ,
  INDEX `ShipMeth` (`ShipMethodId` ASC) ,
  CONSTRAINT `Empl`
    FOREIGN KEY (`EmployeeId` )
    REFERENCES `helius`.`employee` (`EmployeeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ven`
    FOREIGN KEY (`VendorId` )
    REFERENCES `helius`.`vendor` (`VendorId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ShipMeth`
    FOREIGN KEY (`ShipMethodId` )
    REFERENCES `helius`.`shipmethod` (`ShipMethodId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Product` (
  `ProductId` INT(10) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(250) NULL ,
  `ProductNumber` VARCHAR(25) NULL ,
  `MakeFlag` TINYINT(1)  NULL ,
  `FinishedGoodFlag` TINYINT(1)  NULL ,
  `Color` VARCHAR(20) NULL ,
  `SafetyStockLevel` INT(10) NULL ,
  `RecorderPoint` INT(10) NULL ,
  `StandardCost` DECIMAL(19,4) NULL ,
  `ListPrice` DECIMAL(19,4) NULL ,
  `Size` VARCHAR(40) NULL ,
  `SizeUnitMeasureCode` CHAR(3) NULL ,
  `WeightUnitMeasureCode` CHAR(3) NULL ,
  `Weight` DECIMAL(10) NULL ,
  `DaysToManufacture` INT(10) NULL ,
  `ProductLine` CHAR(10) NULL ,
  `Class` CHAR(10) NULL ,
  `Style` CHAR(10) NULL ,
  `ProductSubCategoryId` INT(10) NULL ,
  `ProductModelId` INT(10) NULL ,
  `SellStartDate` DATETIME NULL ,
  `SellEndDate` DATETIME NULL ,
  `DiscontinueDate` DATETIME NULL ,
  PRIMARY KEY (`ProductId`) ,
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) ,
  UNIQUE INDEX `ProductNumber_UNIQUE` (`ProductNumber` ASC) ,
  INDEX `ProductM` (`ProductModelId` ASC) ,
  INDEX `ProductSub` (`ProductSubCategoryId` ASC) ,
  INDEX `Size` (`SizeUnitMeasureCode` ASC) ,
  INDEX `Weight` (`WeightUnitMeasureCode` ASC) ,
#  CONSTRAINT `ProductM`
#    FOREIGN KEY (`ProductModelId` )
#    REFERENCES `helius`.`productmodel` (`ProductModelId` )
#    ON DELETE NO ACTION
#    ON UPDATE NO ACTION,
  CONSTRAINT `ProductSub`
    FOREIGN KEY (`ProductSubCategoryId` )
    REFERENCES `helius`.`productsubcategory` (`ProductSubCategoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Size`
    FOREIGN KEY (`SizeUnitMeasureCode` )
    REFERENCES `helius`.`unitmeasure` (`UnitMeasureCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Weight`
    FOREIGN KEY (`WeightUnitMeasureCode` )
    REFERENCES `helius`.`unitmeasure` (`UnitMeasureCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`ProductVendor` (
  `ProductId` INT(10) NOT NULL ,
  `VendorId` INT(10) NOT NULL ,
  `AverageLeadTime` INT(10) NULL ,
  `StandardPrice` DECIMAL(19,4) NULL ,
  `LastReceiptCost` DECIMAL(19,4) NULL ,
  `LastReceiptDate` DATETIME NULL ,
  `MinOrderQty` INT(10) NULL ,
  `MaxOrderQty` INT(10) NULL ,
  `OnOrderQty` INT(10) NULL ,
  `UnitMeasureCode` CHAR(3) NULL ,
  PRIMARY KEY (`ProductId`, `VendorId`) ,
  INDEX `Produ` (`ProductId` ASC) ,
  INDEX `Vendd` (`VendorId` ASC) ,
  INDEX `Unitt` (`UnitMeasureCode` ASC) ,
  CONSTRAINT `Produ`
    FOREIGN KEY (`ProductId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Vendd`
    FOREIGN KEY (`VendorId` )
    REFERENCES `helius`.`vendor` (`VendorId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Unitt`
    FOREIGN KEY (`UnitMeasureCode` )
    REFERENCES `helius`.`unitmeasure` (`UnitMeasureCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`ProductInventory` (
  `ProductId` INT(10) NOT NULL ,
  `LocationId` INT(10) NOT NULL ,
  `Shelf` VARCHAR(10) NULL ,
  `Bin` INT(10) NULL ,
  `Quantity` INT(10) NULL ,
  PRIMARY KEY (`ProductId`, `LocationId`) ,
  INDEX `Loc` (`LocationId` ASC) ,
  INDEX `Pro` (`ProductId` ASC) ,
  CONSTRAINT `Loc`
    FOREIGN KEY (`LocationId` )
    REFERENCES `helius`.`location` (`LocationId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pro`
    FOREIGN KEY (`ProductId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`ProductListPriceHistory` (
  `ProductId` INT(10) NOT NULL ,
  `StartDate` DATETIME NOT NULL ,
  `EndDate` DATETIME NULL ,
  `ListPrice` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`ProductId`, `StartDate`) ,
  INDEX `Proddct` (`ProductId` ASC) ,
  CONSTRAINT `Proddct`
    FOREIGN KEY (`ProductId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`ContactCreditCard` (
  `ContactId` INT(10) NOT NULL ,
  `CreditCardId` INT(10) NOT NULL ,
  PRIMARY KEY (`ContactId`, `CreditCardId`) ,
  INDEX `CredC` (`CreditCardId` ASC) ,
  INDEX `Contcct` (`ContactId` ASC) ,
  CONSTRAINT `CredC`
    FOREIGN KEY (`CreditCardId` )
    REFERENCES `helius`.`creditcard` (`CreditCardId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contcct`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`PurchaseOrderDetail` (
  `PurchaseOrderId` INT(10) NOT NULL ,
  `PurchaseOrderDetailId` INT(10) NOT NULL AUTO_INCREMENT ,
  `DueDate` DATETIME NULL ,
  `OrderQty` INT(10) NULL ,
  `ProductId` INT(10) NULL ,
  `UnitPrice` DECIMAL(19,4) NULL ,
  `LineTotal` DECIMAL(19,4) NULL ,
  `ReceivedQty` DECIMAL(8,2) NULL ,
  `RejectedQty` DECIMAL(8,2) NULL ,
  `StockedQty` DECIMAL(9,2) NULL ,
  PRIMARY KEY (`PurchaseOrderDetailId`, `PurchaseOrderId`) ,
  INDEX `Proddcct` (`ProductId` ASC) ,
  INDEX `PurchaseOrder` (`PurchaseOrderId` ASC) ,
  CONSTRAINT `Proddcct`
    FOREIGN KEY (`ProductId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PurchaseOrder`
    FOREIGN KEY (`PurchaseOrderId` )
    REFERENCES `helius`.`purchaseorderheader` (`PurchaseOrderId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`CurrencyRate` (
  `CurrencyRateId` INT(10) NOT NULL AUTO_INCREMENT ,
  `CurrencyRateDate` DATETIME NULL ,
  `FromCurrencyCode` CHAR(3) NULL ,
  `ToCurrencyCode` CHAR(3) NULL ,
  `AverageRate` DECIMAL(19,4) NULL ,
  `EndOfDayRate` DECIMAL(19,4) NULL ,
  PRIMARY KEY (`CurrencyRateId`) ,
  UNIQUE INDEX `U!` (`CurrencyRateDate` ASC, `FromCurrencyCode` ASC, `ToCurrencyCode` ASC) ,
  INDEX `fromcurrency` (`FromCurrencyCode` ASC) ,
  INDEX `tocurrency` (`ToCurrencyCode` ASC) ,
  CONSTRAINT `fromcurrency`
    FOREIGN KEY (`FromCurrencyCode` )
    REFERENCES `helius`.`currency` (`CurrencyCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tocurrency`
    FOREIGN KEY (`ToCurrencyCode` )
    REFERENCES `helius`.`currency` (`CurrencyCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`Customeraddress` (
  `CustomerId` INT(10) NOT NULL ,
  `AddressId` INT(10) NOT NULL ,
  `AddressTypeId` INT(10) NULL ,
  PRIMARY KEY (`CustomerId`, `AddressId`) ,
  INDEX `Cust` (`CustomerId` ASC) ,
  INDEX `Adres` (`AddressId` ASC) ,
  INDEX `Adrestyp` (`AddressTypeId` ASC) ,
  CONSTRAINT `Cust`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `helius`.`customer` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Adres`
    FOREIGN KEY (`AddressId` )
    REFERENCES `helius`.`address` (`AddressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Adrestyp`
    FOREIGN KEY (`AddressTypeId` )
    REFERENCES `helius`.`addresstype` (`AddressTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`BillOfMaterials` (
  `BillOfMaterialsId` INT(10) NOT NULL AUTO_INCREMENT ,
  `ProductAssemblyId` INT(10) NULL ,
  `ComponentId` INT(10) NULL ,
  `StartDate` DATETIME NULL ,
  `EndDate` DATETIME NULL ,
  `UnitMeasureCode` CHAR(3) NULL ,
  `BomLevel` INT(10) NULL ,
  `PerAssemblyQty` DECIMAL(8,2) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`BillOfMaterialsId`) ,
  UNIQUE INDEX `U1` (`ProductAssemblyId` ASC, `ComponentId` ASC, `StartDate` ASC) ,
  INDEX `ProdctAs` (`ProductAssemblyId` ASC) ,
  INDEX `Component` (`ComponentId` ASC) ,
  INDEX `Unit` (`UnitMeasureCode` ASC) ,
  CONSTRAINT `ProdctAs`
    FOREIGN KEY (`ProductAssemblyId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Component`
    FOREIGN KEY (`ComponentId` )
    REFERENCES `helius`.`product` (`ProductId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Unit`
    FOREIGN KEY (`UnitMeasureCode` )
    REFERENCES `helius`.`unitmeasure` (`UnitMeasureCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`SalesOrderHeader` (
  `SalesOrderId` INT(10) NOT NULL AUTO_INCREMENT ,
  `RevisionNumber` INT(10) NULL ,
  `OrderDate` DATETIME NULL ,
  `DueDate` DATETIME NULL ,
  `ShipDate` DATETIME NULL ,
  `Status` INT(10) NULL ,
  `OnlineOrderFlag` TINYINT(1)  NULL ,
  `SalesOrderNumber` VARCHAR(25) NULL ,
  `PurchaseOrderNumber` VARCHAR(1024) NULL ,
  `AccountNumber` VARCHAR(1024) NULL ,
  `CustomerId` INT(10) NULL ,
  `ContactId` INT(10) NULL ,
  `SalesPersonId` INT(10) NULL ,
  `TerritoryId` INT(10) NULL ,
  `BillToAddressId` INT(10) NULL ,
  `ShipToAddressId` INT(10) NULL ,
  `ShipMethodId` INT(10) NULL ,
  `CreditCardApprovalCode` VARCHAR(15) NULL ,
  `CurrencyRateCode` INT(10) NULL ,
  `SubTotal` DECIMAL(19,4) NULL ,
  `TaxAmt` DECIMAL(19,4) NULL ,
  `Freight` DECIMAL(19,4) NULL ,
  `TotalDue` DECIMAL(19,4) NULL ,
  `Comment` VARCHAR(128) NULL ,
  `CreditCardId` INT(10) NULL ,
  PRIMARY KEY (`SalesOrderId`) ,
  UNIQUE INDEX `SalesOrderNumber_UNIQUE` (`SalesOrderNumber` ASC) ,
  INDEX `BillTo` (`BillToAddressId` ASC) ,
  INDEX `ShipTo` (`ShipToAddressId` ASC) ,
  INDEX `ShipMethd` (`ShipMethodId` ASC) ,
  INDEX `Crncy` (`CurrencyRateCode` ASC) ,
  INDEX `Crdt` (`CreditCardId` ASC) ,
  INDEX `Custm` (`CustomerId` ASC) ,
  INDEX `Contc` (`ContactId` ASC) ,
  INDEX `Salsp` (`SalesPersonId` ASC) ,
  INDEX `Teri` (`TerritoryId` ASC) ,
  CONSTRAINT `BillTo`
    FOREIGN KEY (`BillToAddressId` )
    REFERENCES `helius`.`address` (`AddressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ShipTo`
    FOREIGN KEY (`ShipToAddressId` )
    REFERENCES `helius`.`address` (`AddressId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ShipMethd`
    FOREIGN KEY (`ShipMethodId` )
    REFERENCES `helius`.`shipmethod` (`ShipMethodId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Crncy`
    FOREIGN KEY (`CurrencyRateCode` )
    REFERENCES `helius`.`currencyrate` (`CurrencyRateId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Crdt`
    FOREIGN KEY (`CreditCardId` )
    REFERENCES `helius`.`creditcard` (`CreditCardId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Custm`
    FOREIGN KEY (`CustomerId` )
    REFERENCES `helius`.`customer` (`CustomerId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Contc`
    FOREIGN KEY (`ContactId` )
    REFERENCES `helius`.`contact` (`ContactId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Salsp`
    FOREIGN KEY (`SalesPersonId` )
    REFERENCES `helius`.`salesperson` (`SalesPersonId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Teri`
    FOREIGN KEY (`TerritoryId` )
    REFERENCES `helius`.`salesterritory` (`TerritoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE  TABLE `helius`.`SalesOrderDetail` (
  `SalesOrderId` INT(10) NOT NULL ,
  `SalesOrderDetailId` INT(10) NOT NULL AUTO_INCREMENT ,    `ProductId` INT(10) NOT NULL ,
  `CarrierTrackingNumber` VARCHAR(25) NULL ,
  `OrderQty` INT(10) NULL ,
  `UnitPrice` DECIMAL(19,4) NULL ,
  `UnitPriceDiscount` DECIMAL(19,4) NULL ,
  `LineTotal` DECIMAL(38,6) NULL ,
  PRIMARY KEY (`SalesOrderDetailId`, `SalesOrderId`) ,
  INDEX `SalesOrdr` (`SalesOrderId` ASC) ,
  CONSTRAINT `SalesOrdr`
    FOREIGN KEY (`SalesOrderId` )
    REFERENCES `helius`.`salesorderheader` (`SalesOrderId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION ,	  CONSTRAINT `ProductIdFK`    FOREIGN KEY (`ProductId` )    REFERENCES `helius`.`Product` (`ProductId` )    ON DELETE NO ACTION    ON UPDATE NO ACTION);