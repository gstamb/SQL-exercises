-- Link to the problem https://www.hackerrank.com/challenges/binary-search-tree-1

-- The database schema consists of 1 table
--TABLE 1: BST
-- N, Integer
-- P, Integer



-- Problem:
-- You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.



-- name: Binary Tree Nodes

-- Solution:
SELECT N,
CASE
    WHEN N = (SELECT N FROM BST WHERE P IS NULL) THEN "Root"
    WHEN N in (SELECT P FROM BST) THEN "Inner"
    ELSE "Leaf"
END
FROM BST
ORDER BY N
 