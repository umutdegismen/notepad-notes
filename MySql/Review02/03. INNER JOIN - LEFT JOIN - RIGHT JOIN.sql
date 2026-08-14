################################
-- INNER JOIN
################################

SELECT *
FROM TURKIYE AS T
INNER JOIN ALBANIA AS A ON T.sport = A.sport;

################################
-- LEFT JOIN
################################

SELECT * 
FROM TURKIYE AS T 
LEFT JOIN ALBANIA AS A ON T.sport = A.sport;

-- SELECT the players from the TURKIYE table that are not competing with anyone
SELECT * 
FROM TURKIYE AS T 
LEFT JOIN ALBANIA AS A ON T.sport = A.sport
WHERE A.player IS NULL;

################################
-- RIGHT JOIN
################################

SELECT *
FROM TURKIYE AS T
RIGHT JOIN ALBANIA AS A ON T.sport = A.sport;

################################
-- FULL OUTER JOIN is NOT supported by MySQL
################################
