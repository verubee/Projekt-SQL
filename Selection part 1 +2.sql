/*
     Check the database for the clients who meet the following results:

    their account balance is above 1000,
    they have more than 5 loans,
    they were born after 1990.
    And we assume that the account balance is loan amount - payments.
 */

SELECT c.client_id,

       sum(amount - payments) as client_balance,
       count(loan_id)         as number_of_loans
FROM loan as l
         INNER JOIN
     account as a using (account_id)
         INNER JOIN
     disp as d using (account_id)
         INNER JOIN
     client as c using (client_id)
         INNER JOIN
     district as dt on
         c.district_id = dt.district_id
WHERE l.status IN ('A', 'C')
  AND d.type = 'OWNER'
# AND EXTRACT(YEAR FROM c.birth_date) > 1990
GROUP BY c.client_id
HAVING sum(amount - payments) > 1000
# AND count(loan_id) > 5
ORDER BY number_of_loans DESC;

