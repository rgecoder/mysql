

SELECT sites.domain_name, leads.first_name, leads.last_name
FROM sites
JOIN leads ON sites.id = leads.sites_id; 


SELECT clients.first_name AS clients_first, clients.last_name, 
sites.domain_name, leads.first_name AS leads_first
FROM clients
JOIN sites ON clients.id = sites.clients_id
JOIN leads on sites.id = leads.sites_id; 

SELECT clients.first_name, clients.last_name, sites.domain_name
FROM clients
LEFT JOIN sites ON clients.id = sites.clients_id;

SELECT clients.first_name, clients.last_name, SUM(billing.amount)
FROM clients
JOIN billing ON clients.id = billing.clients_id
GROUP BY clients.id;

SELECT clients.first_name, clients.last_name, GROUP_CONCAT('  ' ,  sites.domain_name) AS domains
FROM clients
JOIN sites ON clients.id = sites.clients_id
GROUP BY clients.id;

SELECT sites.domain_name, COUNT(leads.id)
FROM sites
JOIN leads ON sites.id = leads.sites_id
GROUP BY sites.id;


