
DATABASE: Northwind

// Employee tablosundan kim kime rapor ediyor ekrana getir.

	
	SELECT 
		e.EmployeeId AS EmployeeID,
		e.FirstName + ' ' + e.LastName AS 'Employee Name',
		m.EmployeeId AS ManagerID,
		ISNULL (m.FirstName + ' ' + m.LastName, 'NO MANAGER') AS 'Manager Name'
	FROM 
		Employees e 
	LEFT JOIN 
		Employees m ON e.ReportsTo = m.EmployeeId
	ORDER BY 
		EmployeeId;