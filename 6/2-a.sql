CREATE VIEW borrower_view AS
SELECT Customer.customer_name, Customer.customer_id, Loan.amount, Loan.branch_name
FROM Customer JOIN Loan ON Loan.customer_id = Customer.customer_id

-- SELECT * FROM borrower_view;