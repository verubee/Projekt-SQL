/*
        Write a query that prepares a summary of the granted loans in the following dimensions:
            year, quarter, month,
            year, quarter,
            year,
            total.

        Display the following information as the result of the summary:
            total amount of loans,
            average loan amount,
            total number of given loans.
 */

SELECT * FROM loan;

SELECT
    YEAR(date) as loan_year,
    QUARTER(date) as loan_quarter,
    MONTH(date) as loan_month,

    sum(payments) as loans_total,
    avg(payments) as loans_avg,
    count(payments) as loans_count
FROM loan
GROUP BY loan_year, loan_quarter,loan_month WITH ROLLUP
ORDER BY loan_year, loan_quarter,loan_month
