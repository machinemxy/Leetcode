-- https://leetcode.com/problems/consecutive-numbers/description/

SELECT distinct num as ConsecutiveNums FROM Logs
WHERE (id + 1, num) in (select * from Logs) and (id + 2, num) in (select * from Logs)
