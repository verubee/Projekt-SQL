/*
     Write a query that ranks accounts according to the following criteria:
        number of given loans (decreasing),
        amount of given loans (decreasing),
        average loan amount,
    Only fully paid loans are considered. (status A, C)

 */


WITH ranking_accounts AS (SELECT account_id,
                                 COUNT(loan_id) AS number_of_loans,
                                 SUM(loan_id)   AS amount_of_loans,
                                 AVG(amount)    AS avg_loan_amount
                          FROM loan
                          WHERE status in ('A', 'C')
                          GROUP BY account_id)

SELECT *,
       ROW_NUMBER() OVER (ORDER BY amount_of_loans) AS rank_amount_of_loans,
       ROW_NUMBER() over (ORDER BY number_of_loans) AS rank_number_of_loans
FROM ranking_accounts;
