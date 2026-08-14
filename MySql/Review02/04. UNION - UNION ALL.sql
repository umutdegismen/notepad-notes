################################
-- UNION
################################

SELECT * FROM TURKIYE;
SELECT * FROM ALBANIA;

-- How can I get the list of all players and sports in both teams?

SELECT player, sport FROM TURKIYE
UNION
SELECT * FROM ALBANIA;

################################
-- UNION ALL VS. UNION
################################

SELECT sport FROM TURKIYE
UNION
SELECT sport FROM ALBANIA;

SELECT sport FROM TURKIYE
UNION ALL
SELECT sport FROM ALBANIA;