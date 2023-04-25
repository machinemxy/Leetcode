-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/

SELECT A.name AS Employee FROM Employee A LEFT JOIN Employee B ON A.managerId = B.id
WHERE A.salary > B.salary
