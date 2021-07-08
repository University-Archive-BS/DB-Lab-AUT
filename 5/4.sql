CREATE VIEW VBook 
AS
    SELECT Bookname, authorname, QTY
    FROM Book
GO

CREATE TRIGGER QTYThreshold ON VBook
INSTEAD OF INSERT 
AS 
BEGIN
	SET NOCOUNT ON

	DECLARE @Bookname VARCHAR(30)
	SET @Bookname = (SELECT INSERTED.BookName FROM INSERTED)

    DECLARE @authorname VARCHAR(40)
    SET @authorName = (SELECT INSERTED.authorname FROM INSERTED)

    DECLARE @QTY int
	SET @QTY = (SELECT INSERTED.QTY from INSERTED)

    IF @QTY < 1000
        INSERT VBook VALUES (@Bookname, @authorname, 1000)
    ELSE			 
        INSERT VBook VALUES (@Bookname, @authorname, @QTY)
END
GO

INSERT VBook VALUES ('History', 'Saeedeh', 900)
INSERT VBook VALUES ('Geography', 'Zahra', 1500)

SELECT * FROM VBook