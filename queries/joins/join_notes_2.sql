-- get all billing history
SELECT * FROM billing;

-- show clients name
SELECT SUM(amount), clients.id, clients.first_name, clients.last_name, clients.email
FROM billing
JOIN  clients ON billing.clients_id = clients.id
GROUP BY clients.id;

-- count number of records combined
SELECT SUM(amount), COUNT(*) AS num_transactions, clients.id, clients.first_name, clients.last_name, clients.email
FROM billing
JOIN  clients ON billing.clients_id = clients.id
GROUP BY clients.id;


-- can rename table name
SELECT SUM(amount), COUNT(*) AS num_transactions, clients.id, clients.first_name, clients.last_name, clients.email
FROM billing AS t1
JOIN  clients AS t2  ON t1.clients_id = t2.id
GROUP BY clients.id;
















