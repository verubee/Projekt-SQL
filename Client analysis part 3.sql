/*
     Use the query created in the previous task and modify it to determine the percentage of each district in the total
     amount of loans granted.
 */


WITH district_analysis_numbered AS(
SELECT dt.district_id,
       count(c.client_id) as number_of_clients,
       count(amount) as number_of_loans,
       sum(amount)   as total_of_loans
FROM loan as l
         INNER JOIN
     account as a USING (account_id)
         INNER JOIN
     disp as d USING (account_id)
         INNER JOIN
     client as c USING (client_id)
INNER JOIN
    district as dt on c.district_id = dt.district_id
WHERE status IN ('A', 'C')
  AND type = 'OWNER'
GROUP BY dt.district_id)
SELECT *,
       total_of_loans / SUM(total_of_loans) OVER () AS percentage
FROM district_analysis_numbered
ORDER BY percentage DESC
