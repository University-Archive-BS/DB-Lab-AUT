CREATE FUNCTION Q4 (@name VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
	DECLARE @temp AS FLOAT = (SELECT AVG(stuGrade) FROM tblStudent WHERE stuName = @name)
	RETURN @temp
END
GO

DECLARE @Result FLOAT
EXEC @Result = Q4 @name = 'Ali'
PRINT @Result