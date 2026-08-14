################################
-- UPDATE
################################

SELECT * FROM TURKIYE;

UPDATE TURKIYE SET player = 'ilayda' WHERE player = 'Dikec';

-- Without a WHERE clause, it would change the information of all records
UPDATE TURKIYE SET player = 'Sevval';