SELECT Account.account_number, balance, access_date
FROM Account JOIN Depositor ON Depositor.account_number = Account.account_number
WHERE Depositor.access_date >=  '2009-01-01';