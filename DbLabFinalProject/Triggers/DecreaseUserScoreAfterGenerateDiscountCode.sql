CREATE TRIGGER ScoreOnDiscount
ON Discount
AFTER INSERT
AS
  DECLARE @UUId BIGINT
  SELECT @UUId = (SELECT UUId   
  FROM INSERTED)

  DECLARE @Amount INT
  SELECT @Amount = (SELECT Amount   
  FROM INSERTED)

  UPDATE customer
  SET Score = Score - 0.005 * @Amount
  WHERE UUId = @UUId;
GO