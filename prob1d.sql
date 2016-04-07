SELECT COUNT(DISTINCT docid)
FROM Frequency
WHERE term = 'law' OR term = 'legal';