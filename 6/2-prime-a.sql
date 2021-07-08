CREATE PROCEDURE get_customer_balance
@name VARCHAR(50)
AS
SELECT Account.account_number, Account.balance
FROM Customer JOIN Depositor ON Depositor.customer_id = Customer.customer_id 
JOIN Account ON Depositor.account_number = Account.account_number
WHERE Customer.customer_name = @name

-- EXEC get_customer_balance 'Hasan'