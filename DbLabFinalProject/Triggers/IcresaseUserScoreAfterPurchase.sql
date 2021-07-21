CREATE TRIGGER ScoreOnOrder
ON [Order]
AFTER INSERT
AS
  DECLARE @UUId BIGINT
  SELECT @UUId = (SELECT UUId   
  FROM INSERTED)

  DECLARE @PaidAmount INT
  SELECT @PaidAmount = (SELECT PaidAmount   
  FROM INSERTED)

  UPDATE customer
  SET Score = Score + 0.002 * @PaidAmount
  WHERE UUId = @UUId;
GO