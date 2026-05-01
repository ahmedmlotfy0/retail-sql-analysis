# 🛒 Retail Sales Analysis — SQL (SQLite)

![SQL](https://img.shields.io/badge/SQL-SQLite-blue) ![Dataset](https://img.shields.io/badge/Dataset-Sample%20Superstore-orange) ![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## 📌 Overview

Exploratory data analysis on the **Sample Superstore** dataset using pure SQL.  
The goal was to answer real business questions around profitability, discount strategy, customer segmentation, and shipping — and translate findings into actionable recommendations.

| Detail | Value |
|--------|-------|
| Dataset | Sample Superstore (Kaggle) |
| Records | 9,994 orders |
| Period | 4 years of US retail data |
| Tool | SQLite (SQLiteOnline) |

---

## ❓ Business Questions

1. Which product categories and sub-categories are most — and least — profitable?
2. Does discounting drive revenue, or does it destroy margin?
3. Which regions and states generate the most sales vs. profit?
4. What are the top 10 products by revenue?
5. Which shipping mode is most used, and is it the most profitable?
6. Which customer segment generates the most value?
7. Who are the top 10 customers by lifetime value?

---

## 🔍 Key Findings

### 1. Technology Leads Profitability — Furniture Hides Losses

Technology dominates profit across all sub-categories:

| Sub-Category | Total Profit | Total Sales |
|-------------|-------------|-------------|
| Copiers | $55,617 | $149,528 |
| Phones | $44,515 | $330,007 |
| Accessories | $41,936 | $167,380 |

> ⚠️ Furniture's **Tables** sub-category generates **negative profit** despite significant sales volume — a margin problem masked by revenue figures.

---

### 2. Discounts Above 40% Destroy Margin

| Discount Level | Avg Profit / Order | Total Sales |
|---------------|-------------------|-------------|
| No Discount | +$66.90 | $1,087,908 |
| Low (10–20%) | +$71.56 | $81,928 |
| Medium (20–40%) | +$19.83 | $882,315 |
| **High (40–80%)** | **-$107.65** | $245,050 |

Orders with discounts above 40% produce an average **loss of $107.65 per order** — despite generating $245K in sales.

> 💡 **Recommendation:** Cap promotional discounts at 20% to protect margin without sacrificing volume.

---

### 3. Consumer Segment Leads — All Segments Are Profitable

| Segment | Total Revenue | Total Profit |
|---------|-------------|-------------|
| Consumer | $1,161,401 | $134,119 |
| Corporate | $706,146 | $91,979 |
| Home Office | $429,653 | $60,298 |

---

### 4. Standard Class Carries the Business

| Ship Mode | Orders | Total Revenue | Total Profit |
|-----------|--------|-------------|-------------|
| Standard Class | 5,968 | $1,358,215 | $164,088 |
| Second Class | 1,945 | $459,193 | $57,446 |
| First Class | 1,538 | $351,428 | $48,969 |
| Same Day | 543 | $128,363 | $15,891 |

> Standard Class accounts for **60% of all orders** and the majority of total profit. Same Day shipping, despite its premium positioning, contributes a disproportionately small return.

---

## 🗂️ Repository Structure

```
retail-sql-analysis/
│
├── superstore_analysis.sql   # All queries with inline comments
└── README.md                 # Business questions, findings & recommendations
```

---

## 🛠️ SQL Concepts Used

- Aggregations (`SUM`, `AVG`, `COUNT`, `ROUND`)
- `GROUP BY` / `ORDER BY`
- `CASE WHEN` bucketing
- CTEs (`WITH` clause)
- `COUNT(DISTINCT ...)` for LTV calculation

---

## 📁 Dataset

[Sample Superstore — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

---

## 🔗 Portfolio

[ahmedmlotfy0.carrd.co](https://ahmedmlotfy0.carrd.co)
