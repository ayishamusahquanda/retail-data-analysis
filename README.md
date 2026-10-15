\# Retail Data Analysis Project



Junior data analyst project for a Ghana-based retail company selling technology and office products.



\## Objective

Clean raw sales data, design a relational PostgreSQL database, and answer business questions about revenue, customers, products, regions, salespeople, and trends.



\## Project Structure

\- `raw\_data/` — untouched original files (never modify)

\- `cleaned\_data/` — cleaned versions and transformations

\- `sql\_scripts/` — schema creation and analysis queries

\- `notes/` — data profiling, cleaning log, troubleshooting



\## Tools

\- Excel (data cleaning)

\- PostgreSQL (storage + analysis)

\- Git + GitHub (version control)



\## Status

\- \[ ] Day 1: Excel cleaning

\- \[ ] Day 2: PostgreSQL import + schema

\- \[ ] Day 3: SQL analysis


# Retail Data Analysis Project

Data cleaning and analysis for a Ghana-based retail company selling 
technology and office products.

#Deliverables
- Excel cleaning: `cleaned_data/raw_sales_cleaned.csv`
- Database schema: `sql_scripts/01_schema.sql`
- SQL analysis: `sql_scripts/02_analysis.sql`
- Data profile: `notes/data_profile.md`
- Cleaning log: `notes/cleaning_log.md`
- Analysis findings: `notes/analysis_findings.md`


#Setup
PostgreSQL database `retail` with 3 tables:
- `customers` (180 rows)
- `products` (20 rows)
- `orders` (1,200 rows)


#Key Findings
- Total revenue: GHS 4,731,304
- Greater Accra and Ashanti regions = 63% of revenue
- Computers category = 69% of revenue
- 180 unique customers, strong retention (only 4 single-order customers)
- Strong Oct–Dec 2025 holiday peak

#Tools
Excel (cleaning) · PostgreSQL (storage + analysis) · Git (version control)


#Author
Ayisha Musah Quanda

