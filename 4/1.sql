CREATE PROCEDURE Q1
@Status VARCHAR(10) OUTPUT
AS
	DECLARE @temp AS INT = (SELECT COUNT(*) FROM tblStudent WHERE stuGrade < 10)
	IF @temp <= 1
		SET @Status = 'GOOD'
	ELSE
		IF @temp <= 3
			SET @Status = 'NORMAL'
		ELSE
			SET @Status = 'BAD'
GO

DECLARE @Result VARCHAR(10)
EXEC Q1 
@Status = @Result OUTPUT
PRINT @Result