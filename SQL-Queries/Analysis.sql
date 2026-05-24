-- Basic Analysis
-- Problem 1: Retrieve all incidents that are currently Open.
SELECT * 
FROM incidents
WHERE status = "Open";

-- Proable 2: Show all High priority incidents.
SELECT *
FROM incidents
WHERE priority = "High";

-- Problem 3: Find all incidents handled by analyst_id = 3.
SELECT *
FROM incidents
WHERE analyst_id = 3;

-- Problem 4: Display incident count by status.
SELECT status, COUNT(*) AS incident_count
FROM incidents
GROUP BY status;

-- Problem 5: Find average resolution time for resolved incidents.
SELECT AVG(resolution_time) as avg_resolution_time_in_minutes
FROM incidents
WHERE status = "Resolved";

-- Slightly Analytical
-- Problem 6: Find the top 3 most common root causes.
SELECT root_cause, COUNT(root_cause)
FROM incidents
GROUP BY root_cause
ORDER BY COUNT(root_cause) DESC
LIMIT 3;

-- Problem 7: Show incident count by priority.
SELECT priority, COUNT(priority) as count
FROM incidents
GROUP BY priority;

-- Problem 8: Find which analyst handled the most incidents.
SELECT a.analyst_name AS name, 
COUNT(i.incident_id) as count
FROM analysts a
JOIN incidents i ON
i.analyst_id = a.analyst_id
GROUP BY a.analyst_id
ORDER BY COUNT(i.incident_id) DESC
LIMIT 1;

-- Problem 9: Find which client has the highest number of incidents.
SELECT c.client_name AS name, 
COUNT(i.incident_id) as count
FROM clients c
JOIN incidents i ON
i.client_id = c.client_id
GROUP BY c.client_id
ORDER BY COUNT(i.incident_id) DESC
LIMIT 1;

-- Problem 10: Find average resolution time by incident category.
SELECT incident_category, AVG(resolution_time) as avg_resolution_time_in_minutes
FROM incidents
GROUP BY incident_category;

-- Intermediate Problems
-- Problem 11: Find analysts who handled more than 20 incidents.
SELECT a.analyst_name AS name, 
COUNT(i.incident_id) as count
FROM analysts a
JOIN incidents i ON
i.analyst_id = a.analyst_id
GROUP BY a.analyst_id
HAVING COUNT(i.incident_id) > 20;

-- Problem 12: Find incident categories with average resolution time greater than 2000 minutes.
SELECT incident_category, AVG(resolution_time) AS resolution_time
FROM incidents
GROUP BY incident_category
HAVING AVG(resolution_time) > 2000;

/* Problem 13: Classify incidents into SLA categories:
Rules:
resolution_time < 1000 → Fast
1000–3000 → Medium
3000 → Slow
*/

SELECT incident_it, resolution_time,
CASE
	WHEN resolution_time < 1000 THEN 'FAST'
    WHEN resolution_time BETWEEN 1000 AND 3000 THEN 'Medium'
    WHEN resolution_time > 3000 THEN 'Slow'
    ELSE 'Unresolved'
END AS sla_category
FROM incidents;

-- Problem 14: Find clients with more incidents than the average client incident count.
SELECT c.client_name AS name, COUNT(i.incident_id) AS incident_count
FROM clients c
JOIN incidents i ON c.client_id = i.client_id
GROUP BY c.client_name
HAVING COUNT(i.incident_id) > (
    SELECT AVG(client_incident_count)
    FROM (
        SELECT COUNT(incident_id) AS client_incident_count
        FROM incidents
        GROUP BY client_id
    ) AS sub
);

-- Problem 15: Find the second highest incident-handling analyst.
SELECT a.analyst_name AS name, 
COUNT(i.incident_id) as count
FROM analysts a
JOIN incidents i ON
i.analyst_id = a.analyst_id
GROUP BY a.analyst_id
ORDER BY COUNT(i.incident_id) DESC
LIMIT 1
OFFSET 1;

-- Problem 16: Find analysts whose incident count is above average analyst incident count.
WITH AnalystCounts AS (
    SELECT 
        a.analyst_name,
        COUNT(i.incident_id) AS incident_count
    FROM analysts a
    JOIN incidents i ON a.analyst_id = i.analyst_id
    GROUP BY a.analyst_name
)
SELECT analyst_name, incident_count
FROM AnalystCounts
WHERE incident_count > (SELECT AVG(incident_count) FROM AnalystCounts);

-- Problem 17: Find clients whose total incident count is higher than the average incident count across all clients.
WITH ClientCount AS (
	SELECT c.client_name AS clients,
    COUNT(i.incident_id) AS incident_count
    FROM clients c
	JOIN incidents i ON c.client_id = i.client_id
    GROUP BY c.client_name
)
SELECT clients, incident_count
FROM ClientCount
WHERE incident_count > (SELECT AVG(incident_count) FROM ClientCount);

-- Problem 18: Find the top 3 analysts who handled the highest number of incidents.
SELECT a.analyst_name,
COUNT(i.incident_id) AS incident_count
FROM analysts a
JOIN incidents i ON a.analyst_id = i.analyst_id
GROUP BY a.analyst_name
ORDER BY COUNT(i.incident_id) DESC
LIMIT 3;

-- Problem 19: Find analysts who resolved more incidents than they currently have Open or In Progress.
WITH AnalystPerformance AS (
    SELECT 
        a.analyst_name,
        SUM(CASE WHEN i.status IN ('Open', 'In Progress') THEN 1 ELSE 0 END) AS active_incidents,
        SUM(CASE WHEN i.status = 'Resolved' THEN 1 ELSE 0 END) AS resolved_incidents
    FROM analysts a
    JOIN incidents i ON a.analyst_id = i.analyst_id
    GROUP BY a.analyst_name
)
SELECT 
    analyst_name, 
    active_incidents, 
    resolved_incidents
FROM AnalystPerformance
WHERE resolved_incidents > active_incidents;

-- Problem 20: Find the month with the highest number of incidents created.
SELECT MONTH(i.created_date) AS Month, 
COUNT(i.incident_id) AS incident_count
FROM incidents i
GROUP BY MONTH(i.created_date)
LIMIT 1;

-- Problem 21: Find analysts whose total resolved incidents are greater than 10 and average resolution time is less than 2000 minutes.
SELECT a.analyst_name,
SUM(CASE WHEN i.status = 'Resolved' THEN 1 ELSE 0 END) AS resolved_incidents
FROM analysts a
JOIN incidents i ON a.analyst_id = i.analyst_id
GROUP BY a.analyst_name
HAVING resolved_incidents > 10 
AND AVG(i.resolution_time) < 2000;