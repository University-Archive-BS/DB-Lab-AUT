WITH PrjDefPrj AS (
SELECT Prj.Emp_id, PrjDef.Prj_Name
FROM PrjDef JOIN Prj
ON PrjDef.PrjDef_id = Prj.PrjDef_id)
SELECT PrjDefPrj.Prj_Name, AVG(Emp.Salary)
FROM Emp JOIN PrjDefPrj
ON Emp.Emp_id = PrjDefPrj.Emp_id
GROUP BY PrjDefPrj.Prj_Name;