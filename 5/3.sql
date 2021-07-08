CREATE TRIGGER ConstBookname 
ON Book
AFTER UPDATE
AS
    IF UPDATE(Bookname)
    BEGIN
        ROLLBACK
		RAISERROR('Change on Bookname is not allowed', 16, 1)
    END
GO


UPDATE Book
SET
    Bookname = 'Man-e-O'
WHERE  ID = 1
