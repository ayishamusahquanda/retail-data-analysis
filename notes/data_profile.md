OrderID

Non-blanks: 1214

Blanks: 0

Format: O#####

Notes: There are no duplicates



OrderDate

Non-blanks: 1214

Blanks: 0

Earliest Date: 01/01/2025

Latest Date: 08/31/2026

Format: MM/DD/YYYY

Weird things: 5 rows have text-stored dates like 28/9/2025 and 15/01/2025



CustomerID

Non-blanks: 1214

Blanks: 0

Format: C####

Unique number IDs: 180

Average orders per customer: \~6.7

Weird things: none visible



CustomerName

Non-blanks: 1214

Blanks: 0

Unique customer names: 149

Unique customer names (normalized): 132

Format: FirstName LastName

Weird things: 15 names are in uppercase, and those same names have spaces before them

Notes: every customer ID maps to exactly one name; 48 IDs share names with other IDs, which is expected with the Ghanaian naming system. CustomerName is not a unique identifier; CustomerID is the key.



Region

Non-blanks: 1214

Blanks: 0

Unique values: 14

Unique values after PROPER(TRIM): 7

Weird things: regions were in lowercase



Column: ProductID

Non-blanks: 1214

Blanks: 0

Unique product IDs: 20

format: P###











