/*
        Structure of financial database

        Get familiar with the schema of the database and answer the following questions:

            What are the primary keys in the individual tables?

            What relationships do particular pairs of tables have?
*/

/*
        PRIMARY KEYS:

        loan - loan_id
        order - order_id
        trans - trans_id
        card - card_id
        disp - disp_id
        account - account_id
        client - client_id
        district - district_id
 */

 /*
        RELATIONSHIPS:

        card - disp: 1-n
        disp - client: 1-1
        disp - account: 1-n
        loan - account: 1-1
        order - account: 1-n
        trans - account: 1-n
        client - district: 1-n
        account - district: 1-n
  */