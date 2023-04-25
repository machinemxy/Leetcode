-- https://leetcode.com/problems/duplicate-emails/description/

SELECT A.email Email FROM
(SELECT email, COUNT(1) n FROM Person GROUP BY email) A
WHERE A.n > 1
