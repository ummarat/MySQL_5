SELECT
	(SELECT customers.LName FROM customers WHERE orders.CustomerNo = customers.CustomerNo) AS CustLName, 
	(SELECT customers.FName FROM customers WHERE orders.CustomerNo = customers.CustomerNo) AS CustFName,
	(SELECT customers.MName FROM customers WHERE orders.CustomerNo = customers.CustomerNo) AS CustMName,
	(SELECT employees.LName FROM employees WHERE orders.EmployeeID = employees.EmployeeID) AS EmpLName, 
	(SELECT employees.FName FROM employees WHERE orders.EmployeeID = employees.EmployeeID) AS EmpFName,
	(SELECT employees.MName FROM employees WHERE orders.EmployeeID = employees.EmployeeID) AS EmpMName
FROM orders
WHERE orders.OrderID IN (SELECT orderdetails.OrderID FROM orderdetails WHERE orderdetails.TotalPrice>1000)
GROUP BY CustLName, CustFName, CustMName, EmpLName, EmpFName, EmpMName;