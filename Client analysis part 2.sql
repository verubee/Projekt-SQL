/*     Make analyses that answer the questions:

       which area has the most clients,
       in which area the highest number of loans was paid,
       in which area the highest amount of loans was paid.
       Select only owners of accounts as clients.
*/

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
GROUP BY dt.district_id
