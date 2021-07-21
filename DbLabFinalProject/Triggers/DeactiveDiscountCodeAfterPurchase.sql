CREATE TRIGGER DiscountOnOrder
ON "Order"
AFTER INSERT
AS
  DECLARE @DiscountId INT
  SELECT @DiscountId = (SELECT DiscountId   
  FROM INSERTED)

  IF @DiscountId = 1
  BEGIN
    UPDATE Discount
    SET IsActive = 0
    WHERE DiscountId = @DiscountId;
  END
GO
