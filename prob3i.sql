-- Strategy when using only views
DROP VIEW IF EXISTS srchUnionTbl;

CREATE VIEW IF NOT EXISTS srchUnionTbl AS
SELECT * FROM frequency
UNION
SELECT 'q' as docid, 'washington' as term, 1 as count 
UNION
SELECT 'q' as docid, 'taxes' as term, 1 as count
UNION 
SELECT 'q' as docid, 'treasury' as term, 1 as count;

DROP VIEW IF EXISTS a;
DROP VIEW IF EXISTS b;

CREATE VIEW IF NOT EXISTS a AS
SELECT * FROM srchUnionTbl;
CREATE VIEW IF NOT EXISTS b AS
SELECT * FROM srchUnionTbl;

SELECT * 
FROM(SELECT a.docid, b.docid, SUM(a.count*b.count) as ranking
    FROM a JOIN b
    ON a.term = b.term
    GROUP BY a.docid, b.docid)
WHERE docid = 'q'
ORDER by ranking DESC;
