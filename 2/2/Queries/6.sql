WITH PrjDefPrj AS (
SELECT Prj.duration, Prj.Emp_id, PrjDef.Prj_Name
FROM PrjDef JOIN Prj
ON PrjDef.PrjDef_id = Prj.PrjDef_id)
SELECT Emp.Name, SUM(Emp.Salary * PrjDefPrj.duration) AS Income
FROM Emp JOIN PrjDefPrj
ON Emp.Emp_id = PrjDefPrj.Emp_id
GROUP BY Emp.Name;