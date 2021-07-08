SET IDENTITY_INSERT persons ON 
DECLARE @Tjessem_Phone AS nvarchar(13) = (SELECT Phone FROM persons WHERE LastName = 'Tjessem');
IF @Tjessem_Phone > '0011234567890'
INSERT INTO persons(P_Id, LastName, FirstName, Address, City, Phone) VALUES (6, 'Taylor', 'Jackson', 'Nisseisten 87', 'Sandnes', '0011234567890');
ELSE
INSERT INTO persons(P_Id, LastName, FirstName, Address, City, Phone) VALUES (8, 'Taylor', 'Jackson', 'Nisseisten 87', 'Sandnes', '0011234567890');
SET IDENTITY_INSERT persons OFF