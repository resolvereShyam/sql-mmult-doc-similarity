-- -- Strategy when creating transpose of frequency
-- CREATE VIEW IF NOT EXISTS freqT (docid, term, count)
-- AS SELECT term, docid, count FROM frequency;

-- -- SELECT * FROM freqT;

-- SELECT a.docid, b.term, SUM(a.count*b.count)
-- -- SELECT a.docid, b.term
-- FROM frequency AS a JOIN freqT AS b
-- ON a.term = b.docid AND a.docid < b.term
-- -- WHERE a.term = b.term AND a.docid < b.docid
-- GROUP BY a.docid, b.term
-- LIMIT 30000;

-- Strategy when using only views
CREATE VIEW IF NOT EXISTS a AS
SELECT * FROM frequency WHERE docid='10080_txt_crude' OR docid='17035_txt_earn';

CREATE VIEW IF NOT EXISTS b AS
SELECT * FROM frequency WHERE docid='10080_txt_crude' OR docid='17035_txt_earn';

SELECT a.docid, b.docid, SUM(a.count*b.count)
FROM a JOIN b
ON a.term = b.term AND a.docid < b.docid
GROUP BY a.docid, b.docid;
