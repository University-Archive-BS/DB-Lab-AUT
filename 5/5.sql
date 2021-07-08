Create TRIGGER AvoidDropTable
ON DATABASE 
FOR DROP_TABLE 
AS
    IF EVENTDATA().value('data(/EVENT_INSTANCE/ObjectName)[1]', 'SYSNAME') = 'Book'
    BEGIN
        PRINT 'You must disable AvoidDropTable trigger to drop Book.'
        ROLLBACK
    END
GO

DROP TABLE Book