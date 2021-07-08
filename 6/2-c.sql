SELECT payment_number
FROM Payment JOIN Loan ON Payment.loan_number = Loan.loan_number 
JOIN Branch on Loan.branch_name = Branch.branch_name
WHERE Branch.branch_city = 'Tehran'