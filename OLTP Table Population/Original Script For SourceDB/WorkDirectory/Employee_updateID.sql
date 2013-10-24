update Employee set ManagerId = 0 where EmployeeId <= 10;
update Employee set ManagerId = 1 where ManagerId = 0 and EmployeeId > 10