/* EXERCICIO LEETCODE*/

SELECT P.project_id, round(SUM(experience_years)/count(P.project_id),2) AS average_years
FROM Project P
INNER JOIN Employee E
ON P.employee_id = E.employee_id
GROUP BY P.project_id;
