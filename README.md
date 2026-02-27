# us-aviation-efficiency-esg-analysis
End-to-end data analytics project using SQL (BigQuery) and Tableau to analyze 5.8M flight records. Focuses on operational bottlenecks (Taxi-Out) and environmental impact (CO2 emissions).
# U.S. Aviation Performance: Operational Efficiency & ESG Analysis

![Dashboard Preview](dashboard_preview.png)

## 🔗 Live Project
> **(https://public.tableau.com/app/profile/bruno.garc.a4217/viz/Airlinesoptimisation/Dashboard1)**

---

## 📝 Executive Summary
This project analyzes **5.8 million flight records** from 2015 to identify operational bottlenecks and quantify the environmental impact of ground delays in the U.S. aviation network. 

By integrating data from airlines, airports, and flight schedules, the analysis provides a dual perspective: **Operational Efficiency** (Taxi-out times) and **Sustainability (ESG)** (CO2 emissions during ground idle time).

## 🛠️ Tech Stack & Methodology
* **Data Warehouse:** Google BigQuery (SQL) used for cleaning, joining, and aggregating 5.8M rows.
* **Visualization:** Tableau for executive-level dashboarding.
* **Business Framework:** Applied ADE (Business Administration) principles to link operational KPIs with financial and environmental costs.

## 📊 Key Insights
* **Bottleneck Identification:** High-traffic airports show a direct correlation between volume and inefficient taxi-out times, leading to increased fuel burn.
* **ESG Impact:** Quantified the carbon footprint specifically generated during ground delays, providing a baseline for sustainability reporting.
* **Financial Impact:** Estimated the hidden costs of delays using an industry-standard rate of $75/minute.

## 📂 Repository Structure
* `/sql`: Contains the `analysis_queries.sql` script used in BigQuery.
* `/Dashboard.twbx`: The packaged Tableau workbook for full auditability.
* `/raw_data`: Sample files and documentation of the dataset.

---
**Author:** Bruno García López 
**Field:** Business Administration & Data Analytics
