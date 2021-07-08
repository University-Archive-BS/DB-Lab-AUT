SELECT FirstName, LastName, Addr = (
	CASE  
	WHEN Address LIKE '%Street%' THEN REPLACE(Address, 'Street', 'St.')
	WHEN Address LIKE '%Number%' THEN REPLACE(Address, 'Number', 'No.')
	WHEN Address LIKE '%St.%' THEN Address
	WHEN Address LIKE '%No.%' THEN Address
	ELSE CONCAT(Address, ' (Invalid Address)')
	END
)
FROM persons;