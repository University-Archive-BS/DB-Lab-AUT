
DISABLE TRIGGER IgnoreInsert 
ON Book;
GO

CREATE TRIGGER LogInsertDelete
ON Book
AFTER INSERT, DELETE
AS
	INSERT Book_Audit 
		SELECT *, 1 from INSERTED
		UNION
        SELECT *, 0 from DELETED
GO

INSERT Book VALUES ('Mafatih', 2012, 'Saeed', 50)
INSERT Book VALUES ('Sahifeh', 2010, 'Mohamad', 60)

DELETE 
FROM Book
WHERE ID = 2

SELECT * FROM Book_Audit