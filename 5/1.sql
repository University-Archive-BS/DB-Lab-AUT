CREATE TRIGGER IgnoreInsert 
ON Book
INSTEAD OF INSERT 
AS
	PRINT 'No change was done'
GO

INSERT Book VALUES ('Quran', 2002, 'Ali', 40)