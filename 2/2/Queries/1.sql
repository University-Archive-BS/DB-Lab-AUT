WITH PrjGrouped AS 
(SELECT PrjDef_id, COUNT(*) AS PrjDef_count 
FROM Prj COUN 
GROUP BY PrjDef_id)
SELECT PrjDef.PrjDef_id, PrjDef.Prj_Name
FROM PrjGrouped JOIN PrjDef
ON PrjGrouped.PrjDef_id = PrjDef.PrjDef_id
WHERE PrjGrouped.PrjDef_count < 4;