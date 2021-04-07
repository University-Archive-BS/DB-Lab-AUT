WITH PrjDefPrjB AS (
SELECT Prj.duration, Prj.Emp_id
FROM PrjDef JOIN Prj
ON PrjDef.PrjDef_id = Prj.PrjDef_id
WHERE PrjDef.Prj_Name = 'B')
SELECT SUM(Emp.Salary * PrjDefPrjB.duration)
FROM Emp JOIN PrjDefPrjB
ON Emp.Emp_id = PrjDefPrjB.Emp_id;