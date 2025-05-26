WITH CTE AS ( SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
DENSE_RANK() OVER ( PARTITION BY d.name ORDER BY e.salary DESC ) AS 'rnk'
FROM Employee e
LEFT JOIN Department d ON d.id = e.departmentId 
GROUP BY Department, Employee)

SELECT Department, Employee, Salary FROM CTE
WHERE rnk < 4