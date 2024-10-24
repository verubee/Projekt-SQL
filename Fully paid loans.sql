/*
        Find out the balance of repaid loans, divided by client gender. (status A,C)

        Additionally, use a method of your choice to check whether the query is correct.

        gender - client  // loan -> account -> disp -> client

        TYPE DISP!!!

 */

-- First attempt query
SELECT sum(l.amount) as amount,
       c.gender
FROM loan as l
         INNER JOIN
     account as a USING (account_id)
         INNER JOIN
     disp as d USING (account_id)
         INNER JOIN
     client as c USING (client_id)
WHERE l.status IN ('A', 'C')
GROUP BY c.gender;

-- Checking the query
select *
FROM loan as l
         INNER JOIN
     account as a USING (account_id)
         INNER JOIN
     disp as d USING (account_id)
         INNER JOIN
     client as c USING (client_id)

/* join probehl uspesne, ale obsahuje duplikaty -> client_id je odlisne,
ale account_id je stejne a stejne jsou i udaje o pujce. Ve sloupci type(disp table) je "OWNER" a "DISPONENT",
tudiz tento problem vyresime vyfiltrovanim pouze "OWNER".

*/

-- Corrected query
SELECT sum(l.amount) as amount,
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




