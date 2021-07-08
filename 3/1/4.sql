SET IDENTITY_INSERT persons ON 
BEGIN TRANSACTION T
INSERT INTO persons(P_Id, LastName, FirstName, Address, City) VALUES (7, 'Tjessem', 'Jakob', 'Nissestien 67', 'Sandnes', '0012452456223');
SELECT P_Id, LastName, FirstName
FROM persons
ORDER BY FirstName
COMMIT TRANSACTION T;
SET IDENTITY_INSERT persons OFF