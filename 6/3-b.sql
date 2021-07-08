CREATE FUNCTION get_employee_dep (@employee_id INT)
RETURNS VARCHAR(50)
AS
BEGIN
     DECLARE @tmp AS VARCHAR(50) = (SELECT DISTINCT(dependent_name)
 									FROM Employee
 									WHERE employee_id = @employee_id)
    RETURN @tmp
END

-- DECLARE @temp VARCHAR(50)
-- EXEC @temp = get_employee_dep @employee_id = 1 
-- PRINT @temp