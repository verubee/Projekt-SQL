/*  Write a procedure to refresh the table you created (you can call it e.g. cards_at_expiration) containing the
    following columns:

    client_id,
    card_id,
    expiration_date - assume that the card can be active for 3 years after issue date,
    client_address (column A3 is enough).
    Note: The card table has cards that were issued until the end of 1998.

    Determining the card's expiration date:

    Suppose we have a card issued on 2020-01-01, its expiration date according to the exercise conditions is 2023-01-01.
    Because we want to mail new cards a week before the expiration date,
       then we just need to check the condition 2023-01-01 - 7 days = 2022-12-25 <= DATE <= 2023-01-01.

 */

CREATE TABLE cards_at_expiration
(
    client_id       int                      not null,
    card_id         int default 0            not null,
    expiration_date date                     null,
    A3              varchar(15) charset utf8 not null,
    generated_for_date date                     null
);

DELIMITER $$
DROP PROCEDURE IF EXISTS generate_cards_at_expiration_report;
CREATE PROCEDURE generate_cards_at_expiration_report(p_date DATE)
BEGIN
    TRUNCATE TABLE cards_at_expiration;
    INSERT INTO cards_at_expiration
    WITH cte AS (
        SELECT c2.client_id,
               c.card_id,
               date_add(c.issued, interval 3 year) as expiration_date,
               d2.A3
        FROM
            card as c
                 INNER JOIN
             disp as d using (disp_id)
                 INNER JOIN
             client as c2 using (client_id)
                 INNER JOIN
             district as d2 using (district_id)
    )
    SELECT
           *,
           p_date
    FROM cte
    WHERE p_date BETWEEN DATE_ADD(expiration_date, INTERVAL -7 DAY) AND expiration_date
    ;
END;
DELIMITER ;


CALL generate_cards_at_expiration_report('2001-01-01');
SELECT * FROM cards_at_expiration;






