/*
 On the database site, we can find information that there are a total of 682 granted loans in the database, of which 606
 have been repaid and 76 have not.

Let's assume that we don't have information about which status corresponds to a repaid loan and which does not. In this
 situation, we need to infer this information from the data.

To do this, write a query to help you answer the question of which statuses represent repaid loans and which represent
unpaid loans.
 */

 SELECT * FROM loan;

SELECT
    status,
    count(status)
FROM loan
GROUP BY status
ORDER BY status;
