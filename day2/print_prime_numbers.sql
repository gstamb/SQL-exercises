-- Link to the problem https://www.hackerrank.com/challenges/print-prime-numbers/

-- The database schema consists of 1 table
-- No table this exercise



-- Problem:
-- Write a query to print all prime numbers less than or equal to 1000 . Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).



-- name: Print Prime Numbers

-- Solution:
WITH RECURSIVE NUMS AS (
  SELECT 1 AS N
  UNION ALL
  SELECT N + 1
  FROM NUMS
  WHERE N < 1000
)
SELECT GROUP_CONCAT(PRIMES.N SEPARATOR '&') AS PRIMES
FROM (
  SELECT N,
    CASE
      WHEN EXISTS (
        SELECT NULL 
        FROM NUMS N_INNER 
        WHERE N_INNER.N > 1 
          AND N_INNER.N < NUMS.N 
          AND MOD(NUMS.N, N_INNER.N) = 0
      ) THEN 'NO PRIME' 
      ELSE 'PRIME' 
    END IS_PRIME 
  FROM NUMS
) PRIMES
WHERE PRIMES.IS_PRIME = 'PRIME' 
  AND PRIMES.N != 1;
 