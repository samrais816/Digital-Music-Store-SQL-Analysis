# 🎵 Digital Music Store Database Analysis (SQL)

## 📌 Project Overview & Objective
This repository contains a compréhensive data analysis of a digital music store's relational database using PostgreSQL. The core objective is to analyze transaction patterns, identify high-value demographics, map organizational employee hierarchies, and extract actionable commercial insights to support data-driven decision-making (such as strategic marketing and live event planning).

## 🗄️ Relational Database & Table Structure
The database mirrors a production-level ecosystem structured across **11 interconnected relational tables**. The analysis navigates core entities including:
* **Business Operations:** `employee` (staff structures and reporting tiers) and `customer` (global purchaser data).
* **Transactional Records:** `invoice` (order summaries) and `invoice_line` (granular transaction items).
* **Music Catalog Framework:** `track`, `album`, `artist`, `genre`, `media_type`, `playlist`, and `playlist_track`.

## 🛠️ Key Technical SQL Skills Demonstrated
* **Relational Joins:** Executing `INNER JOIN` and multi-table matching structures to combine normalized data.
* **Data Aggregation:** Deploying aggregate functions like `SUM()`, `COUNT()`, and `AVG()` paired with `GROUP BY` clauses.
* **Filtering & Sorting:** Custom data sorting using `ORDER BY`, conditional rows via `LIMIT`, and data partitioning.

---

## 🔍 Business Questions Addressed: Phase 1 (Easy Set)

### Q1: Who is the senior-most employee based on job title?
* **Insight:** Identified the highest organizational tier rank (`L7`) to accurately map human resource hierarchy.
* **Key Syntax Used:** `ORDER BY DESC`, `LIMIT 1`.

### Q2: Which countries represent our highest market volume?
* **Insight:** Pinpointed the geographical distribution of transaction frequency to highlight primary international markets.
* **Key Syntax Used:** `COUNT()`, `GROUP BY`.

### Q3: What are the top 3 values of total invoice?
* **Insight:** Isolated the highest transaction amounts recorded to evaluate peak transaction values.
* **Key Syntax Used:** `ORDER BY DESC`, `LIMIT 3`.

### Q4: Which city has the best customer density for an upcoming Music Festival?
* **Insight:** Aggregated total revenue to uncover the single city generating the highest financial returns for strategic marketing placement.
* **Key Syntax Used:** `SUM()`, `GROUP BY`.

### Q5: Who is our highest-value customer?
* **Insight:** Linked customer profiles directly to invoice data to highlight individual loyalty and highest spending metrics.
* **Key Syntax Used:** `INNER JOIN`, `SUM()`, `GROUP BY`.
