SELECT * FROM clients
JOIN billing ON billing.clients_id = clients_id
ORDER BY clients.id;

SELECT sum(amount) AS total,  count(*) AS num_transactions, clients.id, clients.first_name, clients.last_name, clients.email FROM billing
JOIN clients on billing.clients_id = clients.id
GROUP BY clients.id;

SELECT sum(amount) AS total,  YEAR(charged_datetime), count(*) AS num_transactions, clients.id, clients.first_name, clients.last_name, clients.email FROM billing 
JOIN clients ON billing.clients_id = clients.id
GROUP BY clients.id, YEAR(charged_datetime);






