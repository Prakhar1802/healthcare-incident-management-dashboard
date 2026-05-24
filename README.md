# Healthcare Incident Management & SLA Analytics Dashboard

A complete end-to-end healthcare operations analytics project built using **SQL** and **Power BI** to analyze incident management, SLA performance, analyst efficiency, root causes, and client operations.

This project simulates a real-world healthcare support environment where incidents are tracked, analyzed, and visualized to improve operational efficiency and service reliability.

---

# Project Objectives

- Analyze healthcare incident trends and operational performance
- Monitor SLA compliance and resolution efficiency
- Identify top root causes affecting operations
- Evaluate analyst performance and workload distribution
- Understand client-wise incident behavior
- Create interactive dashboards for business decision-making

---

# Tools & Technologies Used

## SQL (MySQL)
- Joins
- Aggregations
- CASE Statements
- Common Table Expressions (CTEs)
- Subqueries
- HAVING Clauses

## Power BI
- Interactive Dashboards
- KPI Cards
- Matrix Visuals
- Slicers & Filters
- Trend Analysis
- SLA Analytics

---

# Dataset Overview

The dataset contains operational healthcare incident records including:

- Incident ID
- Incident Category
- Priority
- Status
- Root Cause
- Resolution Time
- Analyst Information
- Client Information
- Job Details
- Created & Resolved Dates

---

# Dashboard Pages

## Page 1 — Operations Overview Dashboard

### Key Metrics
- Total Incidents
- Open Incidents
- Resolved Incidents
- Critical Incidents
- Average Resolution Time

### Visuals Included
- Incident Count by Status
- Incident Count by Priority
- Top Root Causes
- Top Analysts by Incident Handling

### Key Insights
- Medium and High priority incidents contributed the highest workload
- API Failure and Database Lock were the most common root causes
- Most incidents were successfully resolved

---

## Page 2 — SLA & Resolution Analytics

### Visuals Included
- SLA Category Distribution
- Average Resolution Time by Analyst
- Incident Trends Over Time
- Root Cause by Incident Category Matrix
- Resolved vs Open Incident Analysis

### Key Insights
- Majority of incidents were resolved under Fast SLA
- Some analysts had significantly higher resolution times
- SLA delays were linked with recurring root causes

---

## Page 3 — Client & Operations Analysis

### Visuals Included
- Top Clients by Incident Volume
- Region-wise Incident Analysis
- Analyst Efficiency Analysis
- Jobs Causing Most Incidents
- Client vs Priority Breakdown

### Key Insights
- NovaCare Systems generated the highest number of incidents
- North America had the largest operational workload
- ETL and API-related jobs created recurring operational issues

---

# SQL Concepts Used

## Basic SQL
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING

## Intermediate SQL
- CASE Statements
- Aggregate Functions
- Subqueries
- Conditional Aggregation

## Advanced SQL
- Common Table Expressions (CTEs)
- Multi-table Joins
- SLA Classification Logic
- Analyst Performance Analytics

---

# Business Insights

- Operational workload is concentrated around Medium and High priority incidents
- Recurring API failures and database locks are major operational risks
- Certain analysts consistently outperform others in resolution efficiency
- A small group of clients contributes disproportionately high incident volume
- SLA monitoring can help improve operational response time

---

# Recommendations

- Improve API and database monitoring
- Rebalance analyst workload distribution
- Implement proactive incident alerting
- Create dedicated monitoring for high-volume clients
- Focus on reducing recurring root causes

---

# Repository Structure

```text
healthcare-incident-management-dashboard/
│
├── SQL Queries/
│   ├── DB Script.sql
│   ├── Analysis.sql
│
├── Power BI Dashboard/
│   ├── Healthcare_Incident_Dashboard.pbix
│   ├── dashboard_screenshots/
│
├── Report/
│   ├── Healthcare_Incident_Management_Report.pdf
│
├── Dataset/
│   ├── incidents.csv
│   ├── analysts.csv
│   ├── clients.csv
|   ├── jobs.csv
│
└── README.md
