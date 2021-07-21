CREATE TRIGGER ScoreOnCustomer
ON customer
AFTER INSERT
AS
  DECLARE @Ref BIGINT
  SELECT @Ref = (SELECT Reference   
  FROM INSERTED)

  UPDATE customer
  SET Score = Score + 5
  WHERE UUId = @Ref;
GO
