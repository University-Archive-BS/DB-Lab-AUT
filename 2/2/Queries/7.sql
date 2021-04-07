SELECT PrjDef.Prj_Name, SUM(Prj.duration * Emp.Salary) AS Income
FROM 
	PrjDef 
	JOIN 
	Prj ON PrjDef.PrjDef_id = Prj.PrjDef_id
	JOIN
	Emp ON Emp.Emp_id = Prj.Emp_id
WHERE PrjDef.profit > 500 AND DATEDIFF(YEAR, PrjDef.deadline, GETDATE()) < 1
GROUP BY PrjDef.Prj_Name;