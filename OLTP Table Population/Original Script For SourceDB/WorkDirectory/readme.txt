1. run contact.sql script before store.sql. then store will update info from contact. and then run storecontact.sql at last.( assumption here, one store match one contact )
2. assumption, one creditcard match one contact.
3. for product table, first run product.sql and then run UpdateProductListPriceHistory_pc.sql and then run call UpdateProductListPriceHistory.
(some data type or table name should be changed) see error report.
4. run updatesalesorderdetail_pc.sql at last when every other table has already created.