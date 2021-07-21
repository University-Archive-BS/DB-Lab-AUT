CREATE TRIGGER CountOnPurchase
ON OrderItem
AFTER INSERT
AS
  DECLARE @ProductId BIGINT
  SELECT @ProductId = (SELECT ProductId   
  FROM INSERTED)

  UPDATE Product
  SET [RemainingCount] = [RemainingCount] - 1
  WHERE ProductId = @ProductId;
GO