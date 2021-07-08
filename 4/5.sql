SELECT *,
	Rank() OVER (ORDER BY PostalCode) AS PostalCodeRank,
	DENSE_RANK() OVER (ORDER BY PostalCode) AS PostalCodeDenseRank,
	ROW_NUMBER() OVER (ORDER BY PostalCode) AS PostalCodeRowNumber
FROM question_5