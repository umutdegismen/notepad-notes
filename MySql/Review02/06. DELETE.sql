################################
-- DELETE
################################

SELECT * FROM ALBANIA;
DELETE FROM ALBANIA WHERE sport = 'Voleyball';

DELETE FROM ALBANIA;

SELECT * FROM TURKIYE;
-- PLEASE BE VERY CAREFUL, because it deletes everything from the table
TRUNCATE TABLE TURKIYE;