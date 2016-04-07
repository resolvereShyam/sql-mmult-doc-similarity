SELECT COUNT(*)
FROM (SELECT f.docid, SUM(f.count) AS totWords
    FROM Frequency as f
    GROUP BY f.docid
    HAVING totWords>300);