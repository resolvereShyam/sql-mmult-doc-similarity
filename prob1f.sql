SELECT COUNT(*) FROM
( (SELECT docid
FROM Frequency as f
WHERE term='transactions') as t
JOIN
(SELECT docid
FROM Frequency as f
WHERE term='world') as w
ON t.docid = w.docid );