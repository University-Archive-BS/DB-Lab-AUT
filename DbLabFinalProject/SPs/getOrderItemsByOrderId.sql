SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetOrderItemsByOrderId]
@OrderId INT
AS
SELECT *
FROM [OrderItem]
WHERE OrderId = @OrderId



