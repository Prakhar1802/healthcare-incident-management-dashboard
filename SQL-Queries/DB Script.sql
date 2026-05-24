CREATE TABLE Analysts (
    analyst_id INT PRIMARY KEY,
    analyst_name VARCHAR(50),
    experience_level VARCHAR(20),
    shift VARCHAR(20)
);

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    job_name VARCHAR(100),
    job_type VARCHAR(100),
    scheduled_time DATETIME
);

CREATE TABLE Incidents (
    incident_id INT PRIMARY KEY,
    client_id INT,
    job_id INT,
    analyst_id INT,
    incident_category VARCHAR(50),
    priority VARCHAR(50),
    status VARCHAR(50),
    root_cause VARCHAR(100),
    created_date DATETIME,
    resolved_date DATETIME,
    resolution_time INT,

    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
    FOREIGN KEY (analyst_id) REFERENCES Analysts(analyst_id)
);

-- Incident Tracker SQL Dump
-- Schema: Analysts, Clients, Jobs, Incidents
-- 200 incidents with realistic skew patterns


CREATE TABLE IF NOT EXISTS Analysts (
    analyst_id       INT PRIMARY KEY,
    analyst_name     VARCHAR(50),
    experience_level VARCHAR(20),
    shift            VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Clients (
    client_id   INT PRIMARY KEY,
    client_name VARCHAR(50),
    region      VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Jobs (
    job_id         INT PRIMARY KEY,
    job_name       VARCHAR(100),
    job_type       VARCHAR(100),
    scheduled_time DATETIME
);

CREATE TABLE IF NOT EXISTS Incidents (
    incident_id       INT PRIMARY KEY,
    client_id         INT,
    job_id            INT,
    analyst_id        INT,
    incident_category VARCHAR(50),
    priority          VARCHAR(50),
    status            VARCHAR(50),
    root_cause        VARCHAR(100),
    created_date      DATETIME,
    resolved_date     DATETIME,
    resolution_time   INT,
    FOREIGN KEY (client_id)  REFERENCES Clients(client_id),
    FOREIGN KEY (job_id)     REFERENCES Jobs(job_id),
    FOREIGN KEY (analyst_id) REFERENCES Analysts(analyst_id)
);

-- ── Analysts ──────────────────────────────
INSERT INTO Analysts VALUES (1, 'Priya Sharma', 'Senior', 'Morning');
INSERT INTO Analysts VALUES (2, 'James O''Brien', 'Junior', 'Night');
INSERT INTO Analysts VALUES (3, 'Lin Wei', 'Senior', 'Morning');
INSERT INTO Analysts VALUES (4, 'Carlos Mendez', 'Mid', 'Afternoon');
INSERT INTO Analysts VALUES (5, 'Aisha Patel', 'Mid', 'Afternoon');
INSERT INTO Analysts VALUES (6, 'Tom Nguyen', 'Junior', 'Night');
INSERT INTO Analysts VALUES (7, 'Rachel Kim', 'Senior', 'Morning');
INSERT INTO Analysts VALUES (8, 'David Osei', 'Junior', 'Afternoon');
INSERT INTO Analysts VALUES (9, 'Fatima Al-Hassan', 'Mid', 'Night');
INSERT INTO Analysts VALUES (10, 'Marcus Bell', 'Mid', 'Morning');

-- ── Clients ───────────────────────────────
INSERT INTO Clients VALUES (1, 'Blue Shield Partners', 'North America');
INSERT INTO Clients VALUES (2, 'Apex Financial Group', 'Europe');
INSERT INTO Clients VALUES (3, 'NovaCare Systems', 'North America');
INSERT INTO Clients VALUES (4, 'Meridian Logistics', 'Asia Pacific');
INSERT INTO Clients VALUES (5, 'Orion Tech Solutions', 'Europe');
INSERT INTO Clients VALUES (6, 'Cascade Insurance', 'North America');
INSERT INTO Clients VALUES (7, 'Vertex Pharma', 'Middle East');
INSERT INTO Clients VALUES (8, 'Summit Benefits Corp', 'North America');
INSERT INTO Clients VALUES (9, 'Ironclad Manufacturing', 'Asia Pacific');
INSERT INTO Clients VALUES (10, 'Pacific Data Services', 'Asia Pacific');
INSERT INTO Clients VALUES (11, 'Redwood Health Plans', 'North America');
INSERT INTO Clients VALUES (12, 'Atlantic Wealth Mgmt', 'Europe');
INSERT INTO Clients VALUES (13, 'CoreBridge Analytics', 'Europe');
INSERT INTO Clients VALUES (14, 'Skyline Retail Group', 'Latin America');
INSERT INTO Clients VALUES (15, 'Quantum Cloud Corp', 'North America');

-- ── Jobs ──────────────────────────────────
INSERT INTO Jobs VALUES (1, 'Daily ETL Pipeline', 'ETL', '2024-01-01 02:00:00');
INSERT INTO Jobs VALUES (2, 'Claims Batch Processing', 'Batch', '2024-01-01 22:00:00');
INSERT INTO Jobs VALUES (3, 'Nightly DB Sync', 'Database', '2024-01-01 01:00:00');
INSERT INTO Jobs VALUES (4, 'Payment Reconciliation', 'Finance', '2024-01-01 06:00:00');
INSERT INTO Jobs VALUES (5, 'Eligibility Feed Ingest', 'Integration', '2024-01-01 04:00:00');
INSERT INTO Jobs VALUES (6, 'Member Data Export', 'Export', '2024-01-01 07:00:00');
INSERT INTO Jobs VALUES (7, 'Invoice Generation', 'Finance', '2024-01-01 08:00:00');
INSERT INTO Jobs VALUES (8, 'Audit Log Archival', 'Maintenance', '2024-01-01 03:00:00');
INSERT INTO Jobs VALUES (9, 'API Data Pull', 'Integration', '2024-01-01 05:00:00');
INSERT INTO Jobs VALUES (10, 'Report Distribution', 'Reporting', '2024-01-01 09:00:00');

-- ── Incidents (200 rows) ──────────────────
INSERT INTO Incidents VALUES (1, 3, 3, 3, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2024-10-24 12:53:50', '2024-10-27 08:53:50', 4080);
INSERT INTO Incidents VALUES (2, 8, 10, 7, 'Payment Posting Failure', 'Medium', 'Resolved', 'Database Lock', '2024-10-17 11:29:18', '2024-10-19 13:29:18', 3000);
INSERT INTO Incidents VALUES (3, 3, 8, 8, 'Claim Processing Delay', 'High', 'In Progress', 'Network Issue', '2025-02-14 15:59:01', NULL, NULL);
INSERT INTO Incidents VALUES (4, 2, 6, 7, 'Payment Posting Failure', 'Low', 'Resolved', 'API Failure', '2024-10-08 14:04:33', '2024-10-11 11:04:33', 4140);
INSERT INTO Incidents VALUES (5, 7, 4, 1, 'Eligibility Verification Failure', 'Medium', 'Open', 'Invalid Input Data', '2024-05-04 21:45:07', NULL, NULL);
INSERT INTO Incidents VALUES (6, 6, 3, 7, 'Eligibility Verification Failure', 'High', 'Open', 'Server Downtime', '2025-01-02 22:54:32', NULL, NULL);
INSERT INTO Incidents VALUES (7, 6, 7, 7, 'ETL Failure', 'Low', 'Resolved', 'API Failure', '2024-04-15 11:47:45', '2024-04-18 06:47:45', 4020);
INSERT INTO Incidents VALUES (8, 14, 1, 3, 'Claim Processing Delay', 'Medium', 'Resolved', 'Database Lock', '2024-04-08 03:21:05', '2024-04-10 01:21:05', 2760);
INSERT INTO Incidents VALUES (9, 6, 1, 10, 'Claim Processing Delay', 'High', 'Resolved', 'Database Lock', '2024-04-26 20:24:19', '2024-04-29 01:24:19', 3180);
INSERT INTO Incidents VALUES (10, 3, 5, 1, 'Claim Processing Delay', 'Critical', 'In Progress', 'Network Issue', '2025-03-11 17:09:33', NULL, NULL);
INSERT INTO Incidents VALUES (11, 7, 4, 3, 'Database Timeout', 'Low', 'Resolved', 'Invalid Input Data', '2024-02-26 05:26:13', '2024-02-28 22:26:13', 3900);
INSERT INTO Incidents VALUES (12, 8, 1, 3, 'Database Timeout', 'Medium', 'In Progress', 'Database Lock', '2024-11-06 05:32:39', NULL, NULL);
INSERT INTO Incidents VALUES (13, 12, 9, 3, 'ETL Failure', 'Medium', 'Open', 'API Failure', '2024-11-05 14:04:03', NULL, NULL);
INSERT INTO Incidents VALUES (14, 3, 4, 7, 'Database Timeout', 'Low', 'Resolved', 'API Failure', '2024-07-12 23:07:44', '2024-07-15 01:07:44', 3000);
INSERT INTO Incidents VALUES (15, 11, 2, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'Server Downtime', '2024-08-15 14:28:16', '2024-08-17 08:28:16', 2520);
INSERT INTO Incidents VALUES (16, 8, 5, 7, 'Payment Posting Failure', 'Critical', 'In Progress', 'Database Lock', '2024-05-03 19:48:03', NULL, NULL);
INSERT INTO Incidents VALUES (17, 10, 10, 3, 'Eligibility Verification Failure', 'High', 'In Progress', 'API Failure', '2024-06-02 12:35:35', NULL, NULL);
INSERT INTO Incidents VALUES (18, 10, 5, 3, 'Claim Processing Delay', 'Critical', 'Resolved', 'Database Lock', '2024-07-21 17:04:42', '2024-07-23 23:04:42', 3240);
INSERT INTO Incidents VALUES (19, 13, 4, 7, 'Payment Posting Failure', 'Critical', 'In Progress', 'API Failure', '2024-03-28 06:01:23', NULL, NULL);
INSERT INTO Incidents VALUES (20, 3, 9, 5, 'Database Timeout', 'Critical', 'Resolved', 'Network Issue', '2025-01-31 23:53:31', '2025-02-03 08:53:31', 3420);
INSERT INTO Incidents VALUES (21, 3, 7, 9, 'Payment Posting Failure', 'High', 'Resolved', 'Database Lock', '2024-08-11 07:27:23', '2024-08-12 09:27:23', 1560);
INSERT INTO Incidents VALUES (22, 15, 5, 7, 'ETL Failure', 'High', 'Resolved', 'API Failure', '2024-10-13 18:52:48', '2024-10-16 18:52:48', 4320);
INSERT INTO Incidents VALUES (23, 11, 10, 6, 'Database Timeout', 'Medium', 'Open', 'Network Issue', '2024-11-02 13:00:54', NULL, NULL);
INSERT INTO Incidents VALUES (24, 3, 8, 3, 'Database Timeout', 'Low', 'Open', 'API Failure', '2024-10-29 03:54:03', NULL, NULL);
INSERT INTO Incidents VALUES (25, 15, 3, 4, 'Database Timeout', 'Medium', 'In Progress', 'Database Lock', '2024-10-24 05:11:32', NULL, NULL);
INSERT INTO Incidents VALUES (26, 14, 8, 2, 'Eligibility Verification Failure', 'Critical', 'Resolved', 'API Failure', '2024-05-11 15:22:01', '2024-05-12 01:22:01', 600);
INSERT INTO Incidents VALUES (27, 15, 9, 5, 'ETL Failure', 'Low', 'Resolved', 'Server Downtime', '2024-01-04 01:27:25', '2024-01-06 22:27:25', 4140);
INSERT INTO Incidents VALUES (28, 1, 6, 3, 'Payment Posting Failure', 'Medium', 'Open', 'Network Issue', '2024-11-04 13:30:57', NULL, NULL);
INSERT INTO Incidents VALUES (29, 4, 4, 1, 'Eligibility Verification Failure', 'High', 'In Progress', 'API Failure', '2024-11-20 10:48:48', NULL, NULL);
INSERT INTO Incidents VALUES (30, 3, 8, 2, 'Claim Processing Delay', 'Medium', 'Resolved', 'Server Downtime', '2024-06-02 23:27:36', '2024-06-05 23:27:36', 4320);
INSERT INTO Incidents VALUES (31, 4, 9, 1, 'ETL Failure', 'High', 'Open', 'Invalid Input Data', '2024-04-16 08:59:38', NULL, NULL);
INSERT INTO Incidents VALUES (32, 2, 9, 1, 'Payment Posting Failure', 'Medium', 'Resolved', 'Database Lock', '2024-05-05 03:17:07', '2024-05-06 23:17:07', 2640);
INSERT INTO Incidents VALUES (33, 13, 7, 7, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2025-02-08 20:38:34', '2025-02-08 22:38:34', 120);
INSERT INTO Incidents VALUES (34, 14, 2, 2, 'Claim Processing Delay', 'High', 'Resolved', 'Database Lock', '2024-03-03 06:38:31', '2024-03-04 03:38:31', 1260);
INSERT INTO Incidents VALUES (35, 13, 8, 9, 'Database Timeout', 'Medium', 'Resolved', 'Database Lock', '2024-01-16 19:54:54', '2024-01-18 10:54:54', 2340);
INSERT INTO Incidents VALUES (36, 3, 1, 10, 'Database Timeout', 'High', 'In Progress', 'Invalid Input Data', '2024-11-28 01:06:40', NULL, NULL);
INSERT INTO Incidents VALUES (37, 1, 3, 8, 'Eligibility Verification Failure', 'High', 'Resolved', 'Database Lock', '2024-01-27 20:22:19', '2024-01-29 21:22:19', 2940);
INSERT INTO Incidents VALUES (38, 9, 9, 8, 'Claim Processing Delay', 'High', 'Open', 'Network Issue', '2024-08-12 07:08:36', NULL, NULL);
INSERT INTO Incidents VALUES (39, 6, 4, 7, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2024-07-20 19:08:57', '2024-07-21 16:08:57', 1260);
INSERT INTO Incidents VALUES (40, 2, 1, 8, 'Eligibility Verification Failure', 'Critical', 'Resolved', 'Invalid Input Data', '2024-05-19 14:44:16', '2024-05-21 05:44:16', 2340);
INSERT INTO Incidents VALUES (41, 13, 3, 1, 'Eligibility Verification Failure', 'High', 'Open', 'Network Issue', '2024-01-28 15:38:22', NULL, NULL);
INSERT INTO Incidents VALUES (42, 14, 8, 5, 'ETL Failure', 'Medium', 'In Progress', 'API Failure', '2025-01-06 09:46:05', NULL, NULL);
INSERT INTO Incidents VALUES (43, 2, 9, 9, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2024-03-19 00:39:11', '2024-03-21 08:39:11', 3360);
INSERT INTO Incidents VALUES (44, 14, 3, 6, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2024-07-18 06:02:29', '2024-07-19 04:02:29', 1320);
INSERT INTO Incidents VALUES (45, 10, 9, 7, 'Eligibility Verification Failure', 'Low', 'In Progress', 'Invalid Input Data', '2024-11-22 23:57:25', NULL, NULL);
INSERT INTO Incidents VALUES (46, 8, 4, 3, 'Database Timeout', 'Medium', 'Resolved', 'API Failure', '2024-03-16 08:55:13', '2024-03-16 12:55:13', 240);
INSERT INTO Incidents VALUES (47, 6, 6, 10, 'Claim Processing Delay', 'Critical', 'Resolved', 'Invalid Input Data', '2024-07-16 23:59:05', '2024-07-17 01:59:05', 120);
INSERT INTO Incidents VALUES (48, 3, 6, 5, 'ETL Failure', 'Medium', 'In Progress', 'Database Lock', '2025-02-16 07:52:36', NULL, NULL);
INSERT INTO Incidents VALUES (49, 6, 1, 3, 'Database Timeout', 'Medium', 'Resolved', 'Database Lock', '2024-10-21 20:03:28', '2024-10-21 23:03:28', 180);
INSERT INTO Incidents VALUES (50, 3, 7, 3, 'Claim Processing Delay', 'Medium', 'Resolved', 'Server Downtime', '2024-05-16 15:48:12', '2024-05-17 19:48:12', 1680);
INSERT INTO Incidents VALUES (51, 9, 2, 2, 'ETL Failure', 'Medium', 'Resolved', 'Server Downtime', '2024-10-14 04:55:42', '2024-10-16 20:55:42', 3840);
INSERT INTO Incidents VALUES (52, 13, 9, 4, 'Database Timeout', 'Medium', 'In Progress', 'Server Downtime', '2025-02-16 13:42:17', NULL, NULL);
INSERT INTO Incidents VALUES (53, 14, 4, 2, 'Database Timeout', 'Medium', 'Open', 'Network Issue', '2024-07-07 19:47:22', NULL, NULL);
INSERT INTO Incidents VALUES (54, 10, 9, 2, 'ETL Failure', 'High', 'In Progress', 'Database Lock', '2024-04-04 17:18:32', NULL, NULL);
INSERT INTO Incidents VALUES (55, 3, 8, 7, 'Payment Posting Failure', 'High', 'Resolved', 'API Failure', '2024-07-01 16:05:27', '2024-07-04 13:05:27', 4140);
INSERT INTO Incidents VALUES (56, 13, 5, 9, 'Payment Posting Failure', 'High', 'Open', 'Network Issue', '2024-12-18 10:54:10', NULL, NULL);
INSERT INTO Incidents VALUES (57, 4, 10, 7, 'ETL Failure', 'High', 'Open', 'Server Downtime', '2024-04-10 17:47:23', NULL, NULL);
INSERT INTO Incidents VALUES (58, 3, 10, 8, 'Eligibility Verification Failure', 'Low', 'Open', 'API Failure', '2024-06-07 04:49:38', NULL, NULL);
INSERT INTO Incidents VALUES (59, 15, 1, 7, 'Payment Posting Failure', 'High', 'Resolved', 'Invalid Input Data', '2024-04-14 17:31:36', '2024-04-16 06:31:36', 2220);
INSERT INTO Incidents VALUES (60, 11, 2, 10, 'Database Timeout', 'High', 'Resolved', 'API Failure', '2024-03-15 18:56:08', '2024-03-16 04:56:08', 600);
INSERT INTO Incidents VALUES (61, 7, 5, 3, 'Claim Processing Delay', 'High', 'Resolved', 'Server Downtime', '2024-02-24 05:53:06', '2024-02-25 14:53:06', 1980);
INSERT INTO Incidents VALUES (62, 3, 5, 4, 'Eligibility Verification Failure', 'Medium', 'Resolved', 'Network Issue', '2025-01-24 14:41:19', '2025-01-26 06:41:19', 2400);
INSERT INTO Incidents VALUES (63, 3, 5, 8, 'Claim Processing Delay', 'Medium', 'Open', 'API Failure', '2024-04-10 00:06:05', NULL, NULL);
INSERT INTO Incidents VALUES (64, 3, 6, 8, 'Eligibility Verification Failure', 'Medium', 'In Progress', 'API Failure', '2024-04-22 07:13:12', NULL, NULL);
INSERT INTO Incidents VALUES (65, 4, 7, 5, 'Eligibility Verification Failure', 'High', 'Open', 'Server Downtime', '2024-12-21 15:51:20', NULL, NULL);
INSERT INTO Incidents VALUES (66, 1, 2, 1, 'Claim Processing Delay', 'Medium', 'Open', 'Database Lock', '2024-08-29 04:14:52', NULL, NULL);
INSERT INTO Incidents VALUES (67, 8, 4, 1, 'ETL Failure', 'High', 'In Progress', 'Network Issue', '2024-06-18 08:06:32', NULL, NULL);
INSERT INTO Incidents VALUES (68, 4, 1, 3, 'Payment Posting Failure', 'High', 'In Progress', 'API Failure', '2024-09-28 10:05:55', NULL, NULL);
INSERT INTO Incidents VALUES (69, 3, 6, 2, 'Eligibility Verification Failure', 'Critical', 'Resolved', 'Network Issue', '2025-02-10 07:42:27', '2025-02-12 14:42:27', 3300);
INSERT INTO Incidents VALUES (70, 15, 10, 7, 'Database Timeout', 'High', 'Resolved', 'Database Lock', '2025-02-18 16:37:35', '2025-02-20 08:37:35', 2400);
INSERT INTO Incidents VALUES (71, 9, 6, 1, 'Claim Processing Delay', 'Low', 'Open', 'API Failure', '2025-03-09 11:06:05', NULL, NULL);
INSERT INTO Incidents VALUES (72, 4, 9, 3, 'Database Timeout', 'High', 'Resolved', 'Server Downtime', '2025-03-02 13:47:14', '2025-03-04 03:47:14', 2280);
INSERT INTO Incidents VALUES (73, 14, 7, 1, 'Claim Processing Delay', 'High', 'Open', 'Database Lock', '2025-01-03 19:46:19', NULL, NULL);
INSERT INTO Incidents VALUES (74, 13, 9, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'Network Issue', '2024-07-20 03:26:43', '2024-07-20 17:26:43', 840);
INSERT INTO Incidents VALUES (75, 15, 6, 9, 'Claim Processing Delay', 'Low', 'Resolved', 'Network Issue', '2024-10-12 14:55:35', '2024-10-14 16:55:35', 3000);
INSERT INTO Incidents VALUES (76, 3, 2, 3, 'Eligibility Verification Failure', 'High', 'In Progress', 'Network Issue', '2024-11-12 18:24:58', NULL, NULL);
INSERT INTO Incidents VALUES (77, 3, 3, 9, 'Database Timeout', 'Critical', 'Resolved', 'Database Lock', '2024-01-22 00:38:37', '2024-01-24 23:38:37', 4260);
INSERT INTO Incidents VALUES (78, 3, 4, 5, 'Payment Posting Failure', 'Medium', 'Open', 'API Failure', '2024-10-25 04:21:28', NULL, NULL);
INSERT INTO Incidents VALUES (79, 15, 1, 1, 'Payment Posting Failure', 'Medium', 'Resolved', 'API Failure', '2024-08-22 04:45:47', '2024-08-23 11:45:47', 1860);
INSERT INTO Incidents VALUES (80, 15, 3, 7, 'Payment Posting Failure', 'High', 'Open', 'API Failure', '2024-04-10 04:02:31', NULL, NULL);
INSERT INTO Incidents VALUES (81, 14, 6, 10, 'Eligibility Verification Failure', 'Critical', 'Open', 'Database Lock', '2024-01-13 02:44:38', NULL, NULL);
INSERT INTO Incidents VALUES (82, 9, 8, 4, 'Payment Posting Failure', 'High', 'Open', 'Database Lock', '2024-06-20 00:15:10', NULL, NULL);
INSERT INTO Incidents VALUES (83, 9, 3, 1, 'Claim Processing Delay', 'Critical', 'Resolved', 'API Failure', '2024-08-12 02:16:40', '2024-08-12 05:16:40', 180);
INSERT INTO Incidents VALUES (84, 11, 1, 7, 'Database Timeout', 'Low', 'Open', 'Invalid Input Data', '2024-11-01 14:30:11', NULL, NULL);
INSERT INTO Incidents VALUES (85, 14, 8, 8, 'Claim Processing Delay', 'Medium', 'In Progress', 'Network Issue', '2024-01-25 18:47:35', NULL, NULL);
INSERT INTO Incidents VALUES (86, 8, 6, 7, 'Eligibility Verification Failure', 'High', 'Resolved', 'Network Issue', '2024-07-24 00:14:41', '2024-07-24 23:14:41', 1380);
INSERT INTO Incidents VALUES (87, 6, 2, 5, 'Payment Posting Failure', 'High', 'Resolved', 'Invalid Input Data', '2024-08-23 14:19:21', '2024-08-26 04:19:21', 3720);
INSERT INTO Incidents VALUES (88, 3, 1, 1, 'Database Timeout', 'Medium', 'Resolved', 'Network Issue', '2024-01-14 19:35:08', '2024-01-15 16:35:08', 1260);
INSERT INTO Incidents VALUES (89, 3, 5, 5, 'Database Timeout', 'Medium', 'In Progress', 'Network Issue', '2024-10-17 21:55:10', NULL, NULL);
INSERT INTO Incidents VALUES (90, 1, 9, 7, 'Payment Posting Failure', 'Medium', 'Resolved', 'API Failure', '2024-09-04 09:35:04', '2024-09-05 08:35:04', 1380);
INSERT INTO Incidents VALUES (91, 3, 10, 3, 'ETL Failure', 'Medium', 'Resolved', 'Database Lock', '2024-12-28 19:12:28', '2024-12-29 23:12:28', 1680);
INSERT INTO Incidents VALUES (92, 12, 7, 5, 'Database Timeout', 'High', 'Resolved', 'API Failure', '2024-06-16 09:51:43', '2024-06-16 18:51:43', 540);
INSERT INTO Incidents VALUES (93, 15, 4, 1, 'Payment Posting Failure', 'Medium', 'In Progress', 'API Failure', '2024-06-27 16:58:16', NULL, NULL);
INSERT INTO Incidents VALUES (94, 3, 1, 3, 'ETL Failure', 'High', 'In Progress', 'Database Lock', '2024-07-22 08:39:43', NULL, NULL);
INSERT INTO Incidents VALUES (95, 7, 3, 4, 'Eligibility Verification Failure', 'Critical', 'In Progress', 'Network Issue', '2024-12-03 12:42:52', NULL, NULL);
INSERT INTO Incidents VALUES (96, 11, 3, 3, 'Eligibility Verification Failure', 'Critical', 'Resolved', 'API Failure', '2024-04-15 11:41:30', '2024-04-18 01:41:30', 3720);
INSERT INTO Incidents VALUES (97, 6, 8, 10, 'Eligibility Verification Failure', 'Medium', 'Resolved', 'API Failure', '2024-12-26 09:20:05', '2024-12-26 22:20:05', 780);
INSERT INTO Incidents VALUES (98, 15, 8, 4, 'Claim Processing Delay', 'Low', 'Resolved', 'API Failure', '2024-09-01 04:14:38', '2024-09-01 12:14:38', 480);
INSERT INTO Incidents VALUES (99, 3, 2, 7, 'Eligibility Verification Failure', 'Medium', 'Resolved', 'Database Lock', '2024-01-01 06:09:12', '2024-01-01 21:09:12', 900);
INSERT INTO Incidents VALUES (100, 11, 3, 1, 'Claim Processing Delay', 'High', 'In Progress', 'API Failure', '2024-02-16 17:38:19', NULL, NULL);
INSERT INTO Incidents VALUES (101, 11, 1, 10, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2025-02-05 14:48:55', '2025-02-05 15:48:55', 60);
INSERT INTO Incidents VALUES (102, 3, 6, 2, 'Database Timeout', 'Medium', 'Resolved', 'Invalid Input Data', '2024-01-14 12:11:42', '2024-01-16 22:11:42', 3480);
INSERT INTO Incidents VALUES (103, 8, 1, 1, 'Claim Processing Delay', 'High', 'In Progress', 'Database Lock', '2024-10-13 10:49:01', NULL, NULL);
INSERT INTO Incidents VALUES (104, 11, 8, 3, 'Database Timeout', 'High', 'Resolved', 'API Failure', '2025-01-18 21:56:03', '2025-01-18 23:56:03', 120);
INSERT INTO Incidents VALUES (105, 3, 10, 4, 'ETL Failure', 'Medium', 'Resolved', 'Server Downtime', '2024-11-25 21:36:14', '2024-11-27 21:36:14', 2880);
INSERT INTO Incidents VALUES (106, 14, 1, 7, 'Claim Processing Delay', 'Medium', 'In Progress', 'API Failure', '2024-07-28 09:24:50', NULL, NULL);
INSERT INTO Incidents VALUES (107, 14, 5, 10, 'Payment Posting Failure', 'Medium', 'Resolved', 'Database Lock', '2025-02-22 06:44:41', '2025-02-22 17:44:41', 660);
INSERT INTO Incidents VALUES (108, 6, 2, 1, 'Claim Processing Delay', 'Low', 'In Progress', 'API Failure', '2024-06-20 13:17:50', NULL, NULL);
INSERT INTO Incidents VALUES (109, 2, 3, 8, 'Eligibility Verification Failure', 'Medium', 'Resolved', 'Invalid Input Data', '2024-01-06 14:54:20', '2024-01-08 10:54:20', 2640);
INSERT INTO Incidents VALUES (110, 5, 8, 3, 'Claim Processing Delay', 'Medium', 'Resolved', 'Database Lock', '2024-01-18 18:52:28', '2024-01-19 02:52:28', 480);
INSERT INTO Incidents VALUES (111, 3, 6, 1, 'Payment Posting Failure', 'Low', 'Open', 'Database Lock', '2025-03-25 04:30:06', NULL, NULL);
INSERT INTO Incidents VALUES (112, 3, 4, 3, 'ETL Failure', 'Medium', 'In Progress', 'Server Downtime', '2024-03-06 04:18:02', NULL, NULL);
INSERT INTO Incidents VALUES (113, 3, 10, 8, 'Claim Processing Delay', 'Medium', 'In Progress', 'Invalid Input Data', '2024-06-29 17:32:08', NULL, NULL);
INSERT INTO Incidents VALUES (114, 6, 9, 2, 'Payment Posting Failure', 'Medium', 'Resolved', 'Network Issue', '2024-12-12 15:55:58', '2024-12-13 21:55:58', 1800);
INSERT INTO Incidents VALUES (115, 3, 1, 9, 'Claim Processing Delay', 'Critical', 'Resolved', 'Database Lock', '2024-06-08 09:40:27', '2024-06-08 22:40:27', 780);
INSERT INTO Incidents VALUES (116, 11, 3, 5, 'ETL Failure', 'Critical', 'In Progress', 'Database Lock', '2024-01-12 11:15:31', NULL, NULL);
INSERT INTO Incidents VALUES (117, 3, 4, 1, 'ETL Failure', 'Low', 'Open', 'Server Downtime', '2024-07-28 01:20:11', NULL, NULL);
INSERT INTO Incidents VALUES (118, 12, 6, 7, 'Claim Processing Delay', 'Medium', 'Resolved', 'API Failure', '2024-12-30 09:51:25', '2024-12-31 11:51:25', 1560);
INSERT INTO Incidents VALUES (119, 3, 2, 5, 'Database Timeout', 'Medium', 'In Progress', 'Database Lock', '2024-02-03 04:10:08', NULL, NULL);
INSERT INTO Incidents VALUES (120, 10, 1, 6, 'Eligibility Verification Failure', 'High', 'Resolved', 'Invalid Input Data', '2024-12-28 20:48:18', '2024-12-29 11:48:18', 900);
INSERT INTO Incidents VALUES (121, 8, 4, 3, 'ETL Failure', 'Low', 'Resolved', 'Server Downtime', '2024-05-21 21:56:11', '2024-05-22 23:56:11', 1560);
INSERT INTO Incidents VALUES (122, 9, 2, 1, 'Eligibility Verification Failure', 'Critical', 'Resolved', 'Server Downtime', '2024-07-07 01:40:25', '2024-07-08 04:40:25', 1620);
INSERT INTO Incidents VALUES (123, 11, 9, 8, 'ETL Failure', 'High', 'In Progress', 'Database Lock', '2024-07-29 09:36:01', NULL, NULL);
INSERT INTO Incidents VALUES (124, 15, 9, 7, 'Payment Posting Failure', 'Low', 'Resolved', 'Network Issue', '2025-02-21 07:31:30', '2025-02-23 04:31:30', 2700);
INSERT INTO Incidents VALUES (125, 11, 4, 9, 'Eligibility Verification Failure', 'High', 'Open', 'Invalid Input Data', '2024-02-24 01:13:46', NULL, NULL);
INSERT INTO Incidents VALUES (126, 3, 9, 1, 'Claim Processing Delay', 'Medium', 'In Progress', 'Database Lock', '2024-01-13 17:44:55', NULL, NULL);
INSERT INTO Incidents VALUES (127, 3, 6, 3, 'Eligibility Verification Failure', 'Low', 'Resolved', 'Database Lock', '2024-07-14 18:47:56', '2024-07-16 17:47:56', 2820);
INSERT INTO Incidents VALUES (128, 3, 8, 1, 'Database Timeout', 'High', 'Resolved', 'Invalid Input Data', '2024-10-16 09:11:05', '2024-10-17 17:11:05', 1920);
INSERT INTO Incidents VALUES (129, 3, 4, 2, 'Eligibility Verification Failure', 'Medium', 'Open', 'Database Lock', '2025-03-20 12:23:34', NULL, NULL);
INSERT INTO Incidents VALUES (130, 3, 5, 1, 'Payment Posting Failure', 'Critical', 'Resolved', 'Invalid Input Data', '2024-08-24 06:58:28', '2024-08-24 10:58:28', 240);
INSERT INTO Incidents VALUES (131, 3, 6, 5, 'ETL Failure', 'High', 'In Progress', 'Invalid Input Data', '2025-02-20 20:24:21', NULL, NULL);
INSERT INTO Incidents VALUES (132, 2, 7, 3, 'Eligibility Verification Failure', 'High', 'Resolved', 'API Failure', '2024-05-31 05:27:12', '2024-06-01 01:27:12', 1200);
INSERT INTO Incidents VALUES (133, 12, 2, 8, 'Payment Posting Failure', 'Low', 'Resolved', 'API Failure', '2025-01-27 18:30:43', '2025-01-29 22:30:43', 3120);
INSERT INTO Incidents VALUES (134, 13, 8, 7, 'ETL Failure', 'High', 'Resolved', 'Network Issue', '2024-10-13 08:57:37', '2024-10-14 16:57:37', 1920);
INSERT INTO Incidents VALUES (135, 2, 1, 3, 'ETL Failure', 'High', 'Resolved', 'Database Lock', '2025-03-13 02:41:18', '2025-03-14 05:41:18', 1620);
INSERT INTO Incidents VALUES (136, 8, 1, 7, 'Database Timeout', 'Medium', 'Resolved', 'API Failure', '2024-07-17 07:58:31', '2024-07-17 15:58:31', 480);
INSERT INTO Incidents VALUES (137, 8, 2, 1, 'Payment Posting Failure', 'Medium', 'In Progress', 'Database Lock', '2024-06-11 13:29:44', NULL, NULL);
INSERT INTO Incidents VALUES (138, 13, 2, 5, 'ETL Failure', 'Critical', 'Resolved', 'Database Lock', '2024-04-22 00:53:54', '2024-04-23 06:53:54', 1800);
INSERT INTO Incidents VALUES (139, 14, 2, 8, 'Payment Posting Failure', 'Medium', 'In Progress', 'Invalid Input Data', '2025-03-11 00:50:22', NULL, NULL);
INSERT INTO Incidents VALUES (140, 4, 7, 7, 'Eligibility Verification Failure', 'High', 'Resolved', 'API Failure', '2024-06-28 04:08:26', '2024-06-28 23:08:26', 1140);
INSERT INTO Incidents VALUES (141, 6, 6, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'Server Downtime', '2025-01-16 04:31:05', '2025-01-18 23:31:05', 4020);
INSERT INTO Incidents VALUES (142, 1, 7, 7, 'Eligibility Verification Failure', 'Low', 'In Progress', 'Server Downtime', '2024-11-14 17:32:55', NULL, NULL);
INSERT INTO Incidents VALUES (143, 3, 2, 4, 'Claim Processing Delay', 'Medium', 'In Progress', 'Invalid Input Data', '2024-06-23 06:13:13', NULL, NULL);
INSERT INTO Incidents VALUES (144, 10, 6, 3, 'ETL Failure', 'High', 'Resolved', 'API Failure', '2024-06-02 17:32:52', '2024-06-04 22:32:52', 3180);
INSERT INTO Incidents VALUES (145, 14, 3, 5, 'ETL Failure', 'Critical', 'Resolved', 'Invalid Input Data', '2024-10-10 01:03:57', '2024-10-10 17:03:57', 960);
INSERT INTO Incidents VALUES (146, 3, 6, 2, 'Eligibility Verification Failure', 'High', 'Resolved', 'Database Lock', '2024-05-02 03:57:52', '2024-05-02 07:57:52', 240);
INSERT INTO Incidents VALUES (147, 15, 10, 1, 'Eligibility Verification Failure', 'Low', 'Resolved', 'Database Lock', '2025-01-24 01:48:41', '2025-01-25 15:48:41', 2280);
INSERT INTO Incidents VALUES (148, 13, 1, 4, 'Payment Posting Failure', 'Medium', 'Resolved', 'Network Issue', '2024-10-19 12:56:45', '2024-10-21 07:56:45', 2580);
INSERT INTO Incidents VALUES (149, 10, 10, 1, 'Payment Posting Failure', 'High', 'Resolved', 'API Failure', '2024-06-05 15:57:12', '2024-06-06 03:57:12', 720);
INSERT INTO Incidents VALUES (150, 3, 3, 5, 'Payment Posting Failure', 'Medium', 'Resolved', 'Server Downtime', '2024-04-22 23:15:43', '2024-04-23 07:15:43', 480);
INSERT INTO Incidents VALUES (151, 3, 4, 7, 'Claim Processing Delay', 'Medium', 'Resolved', 'Invalid Input Data', '2024-04-20 22:24:35', '2024-04-21 01:24:35', 180);
INSERT INTO Incidents VALUES (152, 4, 4, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'API Failure', '2025-02-04 22:11:42', '2025-02-07 14:11:42', 3840);
INSERT INTO Incidents VALUES (153, 14, 1, 9, 'Database Timeout', 'Medium', 'Resolved', 'API Failure', '2024-01-01 00:39:14', '2024-01-01 17:39:14', 1020);
INSERT INTO Incidents VALUES (154, 1, 9, 4, 'Payment Posting Failure', 'High', 'Resolved', 'API Failure', '2024-10-15 07:04:45', '2024-10-16 13:04:45', 1800);
INSERT INTO Incidents VALUES (155, 2, 10, 7, 'Claim Processing Delay', 'High', 'Open', 'Server Downtime', '2024-01-30 20:11:25', NULL, NULL);
INSERT INTO Incidents VALUES (156, 5, 6, 5, 'Database Timeout', 'Critical', 'Open', 'Server Downtime', '2024-02-11 21:01:07', NULL, NULL);
INSERT INTO Incidents VALUES (157, 8, 10, 3, 'Payment Posting Failure', 'Medium', 'In Progress', 'Server Downtime', '2024-12-25 03:34:08', NULL, NULL);
INSERT INTO Incidents VALUES (158, 11, 6, 2, 'ETL Failure', 'Medium', 'Resolved', 'Network Issue', '2024-11-29 21:42:39', '2024-11-30 07:42:39', 600);
INSERT INTO Incidents VALUES (159, 12, 10, 2, 'Payment Posting Failure', 'High', 'In Progress', 'Database Lock', '2025-03-30 21:49:02', NULL, NULL);
INSERT INTO Incidents VALUES (160, 15, 8, 3, 'ETL Failure', 'High', 'In Progress', 'Server Downtime', '2024-06-26 16:12:38', NULL, NULL);
INSERT INTO Incidents VALUES (161, 6, 4, 3, 'Eligibility Verification Failure', 'High', 'Resolved', 'Database Lock', '2024-05-16 14:22:06', '2024-05-17 16:22:06', 1560);
INSERT INTO Incidents VALUES (162, 4, 8, 5, 'ETL Failure', 'Low', 'Resolved', 'API Failure', '2024-07-15 23:04:01', '2024-07-17 06:04:01', 1860);
INSERT INTO Incidents VALUES (163, 11, 3, 3, 'Eligibility Verification Failure', 'Low', 'In Progress', 'Network Issue', '2024-09-20 12:52:52', NULL, NULL);
INSERT INTO Incidents VALUES (164, 3, 4, 5, 'Payment Posting Failure', 'Critical', 'In Progress', 'Database Lock', '2024-01-03 11:18:35', NULL, NULL);
INSERT INTO Incidents VALUES (165, 15, 8, 3, 'Database Timeout', 'High', 'In Progress', 'Invalid Input Data', '2024-11-22 10:19:48', NULL, NULL);
INSERT INTO Incidents VALUES (166, 13, 5, 2, 'Claim Processing Delay', 'Critical', 'Open', 'Network Issue', '2024-01-02 08:56:36', NULL, NULL);
INSERT INTO Incidents VALUES (167, 2, 10, 7, 'ETL Failure', 'Critical', 'Resolved', 'Invalid Input Data', '2025-02-23 18:55:19', '2025-02-24 06:55:19', 720);
INSERT INTO Incidents VALUES (168, 11, 4, 8, 'Database Timeout', 'Medium', 'Resolved', 'Invalid Input Data', '2024-11-08 13:36:34', '2024-11-09 15:36:34', 1560);
INSERT INTO Incidents VALUES (169, 5, 5, 4, 'Database Timeout', 'Medium', 'Resolved', 'Database Lock', '2025-02-07 22:55:11', '2025-02-09 03:55:11', 1740);
INSERT INTO Incidents VALUES (170, 11, 9, 7, 'Claim Processing Delay', 'Medium', 'Resolved', 'Network Issue', '2024-11-20 18:32:33', '2024-11-22 04:32:33', 2040);
INSERT INTO Incidents VALUES (171, 3, 5, 4, 'Database Timeout', 'Medium', 'In Progress', 'Server Downtime', '2024-02-08 21:41:30', NULL, NULL);
INSERT INTO Incidents VALUES (172, 6, 10, 3, 'Claim Processing Delay', 'High', 'Resolved', 'Network Issue', '2024-11-07 09:43:58', '2024-11-08 08:43:58', 1380);
INSERT INTO Incidents VALUES (173, 15, 10, 3, 'Payment Posting Failure', 'Medium', 'Open', 'API Failure', '2025-02-26 02:10:43', NULL, NULL);
INSERT INTO Incidents VALUES (174, 9, 1, 7, 'ETL Failure', 'Low', 'Resolved', 'Invalid Input Data', '2024-08-26 17:23:05', '2024-08-28 00:23:05', 1860);
INSERT INTO Incidents VALUES (175, 11, 6, 7, 'Eligibility Verification Failure', 'High', 'Open', 'Invalid Input Data', '2024-05-13 21:53:11', NULL, NULL);
INSERT INTO Incidents VALUES (176, 3, 4, 9, 'ETL Failure', 'Low', 'Resolved', 'Network Issue', '2024-06-16 12:46:35', '2024-06-18 09:46:35', 2700);
INSERT INTO Incidents VALUES (177, 3, 1, 1, 'Database Timeout', 'Medium', 'Open', 'Invalid Input Data', '2024-10-09 19:24:33', NULL, NULL);
INSERT INTO Incidents VALUES (178, 5, 4, 6, 'Database Timeout', 'Medium', 'In Progress', 'API Failure', '2025-03-21 02:19:38', NULL, NULL);
INSERT INTO Incidents VALUES (179, 2, 10, 3, 'ETL Failure', 'Medium', 'Resolved', 'Server Downtime', '2024-10-02 11:38:29', '2024-10-03 05:38:29', 1080);
INSERT INTO Incidents VALUES (180, 14, 8, 2, 'Database Timeout', 'Low', 'In Progress', 'API Failure', '2024-09-06 02:48:07', NULL, NULL);
INSERT INTO Incidents VALUES (181, 11, 7, 4, 'Claim Processing Delay', 'High', 'In Progress', 'Network Issue', '2025-03-29 07:12:01', NULL, NULL);
INSERT INTO Incidents VALUES (182, 3, 5, 7, 'Claim Processing Delay', 'High', 'In Progress', 'API Failure', '2024-01-12 02:37:12', NULL, NULL);
INSERT INTO Incidents VALUES (183, 3, 1, 6, 'ETL Failure', 'High', 'Open', 'API Failure', '2024-08-28 10:06:11', NULL, NULL);
INSERT INTO Incidents VALUES (184, 10, 2, 6, 'Eligibility Verification Failure', 'High', 'In Progress', 'Invalid Input Data', '2024-12-17 07:08:33', NULL, NULL);
INSERT INTO Incidents VALUES (185, 3, 1, 2, 'Payment Posting Failure', 'Low', 'In Progress', 'Network Issue', '2024-02-07 18:36:13', NULL, NULL);
INSERT INTO Incidents VALUES (186, 1, 10, 3, 'ETL Failure', 'Medium', 'Resolved', 'Invalid Input Data', '2024-10-03 10:55:32', '2024-10-06 04:55:32', 3960);
INSERT INTO Incidents VALUES (187, 13, 2, 7, 'Eligibility Verification Failure', 'Medium', 'Open', 'API Failure', '2024-04-17 07:17:47', NULL, NULL);
INSERT INTO Incidents VALUES (188, 9, 1, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'Invalid Input Data', '2024-03-16 10:19:25', '2024-03-17 01:19:25', 900);
INSERT INTO Incidents VALUES (189, 3, 3, 1, 'ETL Failure', 'Critical', 'Resolved', 'Network Issue', '2024-10-31 06:18:53', '2024-11-01 07:18:53', 1500);
INSERT INTO Incidents VALUES (190, 4, 6, 10, 'ETL Failure', 'Medium', 'In Progress', 'Database Lock', '2024-02-14 07:42:51', NULL, NULL);
INSERT INTO Incidents VALUES (191, 12, 9, 1, 'ETL Failure', 'High', 'Resolved', 'Database Lock', '2024-01-08 19:08:01', '2024-01-09 01:08:01', 360);
INSERT INTO Incidents VALUES (192, 3, 3, 1, 'Database Timeout', 'Low', 'Open', 'Database Lock', '2024-07-31 13:44:12', NULL, NULL);
INSERT INTO Incidents VALUES (193, 10, 4, 10, 'Database Timeout', 'Medium', 'Resolved', 'Network Issue', '2024-04-10 02:06:05', '2024-04-13 02:06:05', 4320);
INSERT INTO Incidents VALUES (194, 3, 6, 1, 'ETL Failure', 'Medium', 'Resolved', 'Invalid Input Data', '2024-10-19 13:26:38', '2024-10-21 16:26:38', 3060);
INSERT INTO Incidents VALUES (195, 3, 5, 3, 'Payment Posting Failure', 'Medium', 'Resolved', 'Database Lock', '2024-07-08 07:13:46', '2024-07-10 04:13:46', 2700);
INSERT INTO Incidents VALUES (196, 1, 5, 3, 'Claim Processing Delay', 'High', 'Resolved', 'Database Lock', '2025-01-07 05:15:20', '2025-01-09 22:15:20', 3900);
INSERT INTO Incidents VALUES (197, 6, 9, 9, 'Eligibility Verification Failure', 'High', 'In Progress', 'Database Lock', '2024-03-29 14:39:35', NULL, NULL);
INSERT INTO Incidents VALUES (198, 1, 6, 7, 'ETL Failure', 'Medium', 'Resolved', 'Invalid Input Data', '2024-11-12 23:59:17', '2024-11-14 00:59:17', 1500);
INSERT INTO Incidents VALUES (199, 2, 3, 4, 'Payment Posting Failure', 'Low', 'Resolved', 'Network Issue', '2025-01-11 22:53:30', '2025-01-13 19:53:30', 2700);
INSERT INTO Incidents VALUES (200, 6, 9, 2, 'Payment Posting Failure', 'High', 'In Progress', 'Invalid Input Data', '2024-04-14 00:45:35', NULL, NULL);