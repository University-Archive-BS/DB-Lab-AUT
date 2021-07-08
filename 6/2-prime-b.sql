CREATE PROCEDURE get_payment_branch
@payment_number INT, @branch_name VARCHAR(50) OUTPUT
AS
SET @branch_name = (SELECT Branch.branch_name
FROM Payment JOIN Loan ON Payment.loan_number = Loan.loan_number 
JOIN Branch ON Branch.branch_name = Loan.branch_name
WHERE Payment.payment_number = @payment_number)

-- DECLARE @Res VARCHAR(50)
-- EXEC get_payment_branch 1, @branch_name = @Res OUTPUT;
-- PRINT @Res