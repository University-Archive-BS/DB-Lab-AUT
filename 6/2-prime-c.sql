CREATE PROCEDURE get_customer_data
@account_number INT
AS
BEGIN
WAITFOR DELAY '00:00:10'
SELECT Account.account_number, Account.balance, Customer.customer_id, 
	Customer.customer_name, Customer.customer_street, Customer.customer_city, Depositor.access_date
FROM Account JOIN Depositor on Account.account_number = Depositor.account_number 
JOIN Customer ON Depositor.customer_id = Customer.customer_id
WHERE Account.account_number = @account_number
END

-- EXEC get_customer_data 1