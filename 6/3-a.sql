CREATE FUNCTION get_highest_interest()
RETURNS INT
AS
BEGIN
	DECLARE @tmp AS INT = (SELECT AVG(Account.account_number)
 							FROM Account JOIN SavingAccount 
 							ON Account.account_number = SavingAccount.account_number
 							WHERE interest_rate = (SELECT MAX(interest_rate) 
 													FROM Account JOIN SavingAccount 
 													ON Account.account_number = SavingAccount.account_number))
RETURN @tmp
END

-- DECLARE @temp INT
-- EXEC @temp = get_highest_interest 
-- PRINT @temp

