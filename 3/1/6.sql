DECLARE @temp AS INT = (SELECT MAX(P_Id) FROM persons);
WHILE @temp > 0
BEGIN
PRINT 'okay'
SET @temp = @temp - 1
END;