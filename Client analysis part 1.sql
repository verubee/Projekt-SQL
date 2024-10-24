/*
    Modifying the queries from the exercise on repaid loans, answer the following questions:

    Who has more repaid loans - women or men?
    What is the average age of the borrower divided by gender?
    Hints:

    Save the result of the previously written and then modified query, for example, to a temporary table, and conduct the analysis on it.
    You can calculate the age as the difference: 2024 - the year of birth of the borrower.
 */


DROP TABLE IF EXISTS tmp_loans_by_gender;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_loans_by_gender AS
SELECT count(l.amount) as amount_count,
       sum(l.amount) as amount_sum,
       AVG(2024 - EXTRACT(YEAR from birth_date)) as age,
       c.gender
FROM loan as l
         INNER JOIN
     account as a USING (account_id)
         INNER JOIN
     disp as d USING (account_id)
         INNER JOIN
     client as c USING (client_id)
WHERE l.status IN ('A', 'C') AND d.type = 'OWNER'
GROUP BY c.gender;

select * from tmp_loans_by_gender;