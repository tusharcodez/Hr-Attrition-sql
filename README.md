<div align="center">

# HR Attrition Analysis — SQL Project

![SQL Server](https://img.shields.io/badge/SQL-Microsoft%20SQL%20Server-blue?style=flat-square&logo=microsoftsqlserver)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![Domain](https://img.shields.io/badge/Domain-HR%20Analytics-orange?style=flat-square)

</div>

---

## Overview

Analysis of employee attrition patterns using SQL on Microsoft SQL Server. The project identifies key drivers of employee turnover — overtime, salary gaps, tenure, and work-life balance — and surfaces high-risk employee segments to support data-driven HR decisions.

---

## Business Problem

> *"Employee turnover costs companies 6-9 months of an employee's salary in recruitment and training costs. Identifying at-risk employees before they leave is far cheaper than replacing them."*

---

## Dataset

| Property | Detail |
|---|---|
| Source | [IBM HR Analytics Dataset — Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) |
| Records | 1,470 employees |
| Target | `Attrition` (Yes / No) |

**Key columns:** `Department`, `JobRole`, `MonthlyIncome`, `OverTime`, `WorkLifeBalance`, `YearsAtCompany`, `DistanceFromHome`, `JobSatisfaction`

---

## SQL Techniques Used

`GROUP BY` `CASE WHEN` `Aggregate Functions` `Subqueries` `Window Functions` `INFORMATION_SCHEMA` `Duplicate Detection` `Conditional Aggregation`

---

## Key Findings

| # | Finding | Insight |
|---|---|---|
| 1 | R&D has highest attrition count (133) | Counter-intuitive — not Sales as assumed |
| 2 | Overtime employees show 41% higher attrition | Burnout is a top driver |
| 3 | 1-year tenure employees leave most (59 cases) | Onboarding gap identified |
| 4 | HR dept has lowest avg salary + high attrition | Compensation-retention link confirmed |
| 5 | WLB score 3 has highest attrition (127) | Mid-range balance still insufficient |
| 6 | Lab Technicians, Sales Execs, Research Scientists are top 3 high-turnover roles | Role-specific interventions needed |

---

## Analysis Sections

```
hr.sql
├── Section 1 — Data Exploration
├── Section 2 — Data Quality (duplicate detection)
├── Section 3 — Attrition Analysis (6 business scenarios)
├── Section 4 — Salary Analysis
└── Section 5 — High-Risk Employee Identification
```

---

## Business Recommendations

- Introduce structured 90-day onboarding programs to reduce early attrition
- Cap or compensate overtime hours — especially in R&D and Sales
- Conduct salary benchmarking for HR and Lab Technician roles
- Flag employees with: overtime + WLB ≤ 2 + job satisfaction ≤ 2 for proactive retention

---

## How to Run

```sql
-- 1. Import the dataset into SQL Server (CSV → Import Flat File)
-- 2. Open hr.sql in SSMS
-- 3. Update USE statement to your database name
-- 4. Run section by section (Ctrl+E per block)
```

---

## Author

**Tushar** — Data Analyst | [GitHub](https://github.com/tusharcodez)

---

<div align="center">
<sub>Boston Institute of Analytics — PG Diploma in Data Science & Generative AI</sub>
</div>
