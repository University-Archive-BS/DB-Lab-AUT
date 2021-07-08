CREATE TABLE PaymentLogs (
	payment_number INT NOT NULL,
	change_date DATETIME DEFAULT GETDATE() NOT NULL,
	command VARCHAR(6) NOT NULL,
	payment_date DATE,
	payment_amount INT,
	loan_number INT
)
GO
 
CREATE TRIGGER payment_change
ON Payment
AFTER INSERT, DELETE
AS
BEGIN
	DECLARE @command VARCHAR(6)
		SET @command = CASE
			WHEN EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
				THEN 'Update'
			WHEN EXISTS(SELECT * FROM INSERTED)
				THEN 'Insert'
			WHEN EXISTS(SELECT * FROM DELETED)
				THEN 'Delete'
			ELSE NULL
		END
	IF @command = 'Delete'
		INSERT INTO PaymentLogs (payment_number, change_date, command, payment_date, payment_amount, loan_number)
		SELECT d.payment_number, GETDATE(), @command, d.payment_date, d.payment_amount, d.loan_number
		FROM DELETED d
	 
	IF @command = 'Insert'
		INSERT INTO PaymentLogs (payment_number, change_date, command, payment_date, payment_amount, loan_number)
		SELECT i.payment_number, GETDATE(), @command, i.payment_date, i.payment_amount, i.loan_number
		FROM INSERTED i
END
GO

INSERT Payment (payment_number, payment_date, payment_amount, loan_number) VALUES (2, '2018-02-05', 200, 1)