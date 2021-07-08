CREATE PROCEDURE Q2
@num INT
AS
	DECLARE @temp AS INT = (SELECT COUNT(*) FROM tblStudent WHERE stuGrade < 10)
	IF @temp < @num
		UPDATE tblStudent
		SET stuGrade = stuGrade + 1
		WHERE stuGrade < 10 AND stuGrade > 9
	ELSE
		UPDATE tblStudent
		SET stuGrade = stuGrade + 0.5
		WHERE stuGrade < 10 AND stuGrade > 9.5
GO

EXEC Q2 4