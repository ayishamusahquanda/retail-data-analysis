\# Cleaning Log — raw\_sales.csv



Decisions

1\. CustomerName — applied PROPER(TRIM). Normalized unique: 132.

2\. Region — applied PROPER(TRIM). 14 → 7 unique.

3\. Product — applied PROPER(TRIM). 20 unique(no change).

4\. Category — applied PROPER(TRIM). 8 unique(converted to Title Case).

5\. SalesPerson — applied PROPER(TRIM). 14 → 8 unique.

6\. OrderDate — converted 5 text dates to real dates, standardized to YYYY-MM-DD.

7\. Quantity blanks (10 rows)\*\* — removed (incomplete orders).

8\. Quantity = -1 (6 rows)\*\* — kept as returns.

9\. UnitPrice blanks (8 rows)\*\* — removed (incomplete).

10\. UnitPrice variation per product\*\* — kept as is (business decision: prices reflect time-based changes).



Questions

\- UnitPrice varies per product — not resolved, but documented.

\- 132 customer names vs 180 customer IDs — expected (common Ghanaian names).



Final row count

\- Started: 1214

\- Removed: \~18 (blanks in Quantity/UnitPrice)

\- Final: \~1196

