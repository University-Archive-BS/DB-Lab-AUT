SELECT EmpDept.Emp_id, EmpDept.Emp_Name, PrjEmp.Prj_Name, EmpDept.Dept_Name
FROM (SELECT PrjDef.Prj_Name, Prj.Emp_id
		FROM PrjDef JOIN Prj
		ON PrjDef.PrjDef_id = Prj.PrjDef_id) AS PrjEmp 
		JOIN 
		(SELECT Emp.Emp_id, Emp.Name AS Emp_Name, Dept.Name AS Dept_Name
		FROM Emp JOIN Dept
		ON Dept.DeptNo = Emp.DeptNo) AS EmpDept
ON PrjEmp.Emp_id = EmpDept.Emp_id;