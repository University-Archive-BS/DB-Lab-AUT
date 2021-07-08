CREATE TRIGGER avoid_change_branch_name 
ON Branch
AFTER UPDATE
AS
    if UPDATE(branch_name)
    BEGIN
	    ROLLBACK
        RAISERROR('Change on branch_name is not allowed', 16, 1)
    END
GO
