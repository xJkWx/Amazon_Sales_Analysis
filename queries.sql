SELECT *
FROM amazon_sale_report.amazon_sale_report

-- Które kategorie produktów sprzedają sie najlepiej?
SELECT 
    Category,
    COUNT("Order ID") AS liczba_zamowien,
    SUM(Amount) AS przychod_total,
    ROUND(AVG(Amount), 2) AS srednia_wartosc
FROM amazon_sale_report.amazon_sale_report
WHERE Status != 'Cancelled'
GROUP BY Category
ORDER BY przychod_total DESC;

-- Sprzedaż według statusu zamówienia
SELECT 
    Status,
    COUNT("Order ID") AS liczba_zamowien,
    ROUND(SUM(Amount), 2) AS wartosc_total
FROM amazon_sale_report.amazon_sale_report
GROUP BY Status
ORDER BY liczba_zamowien DESC;

-- Top 10 miast z największą sprzedażą
SELECT 
    "ship-city",
    COUNT("Order ID") AS liczba_zamowien,
    ROUND(SUM(Amount), 2) AS przychod_total
FROM amazon_sale_report.amazon_sale_report
WHERE Status != 'Cancelled'
GROUP BY "ship-city"
ORDER BY przychod_total DESC
LIMIT 10;

-- Sprzedaż B2B vs B2C
SELECT 
    B2B,
    COUNT("Order ID") AS liczba_zamowien,
    ROUND(SUM(Amount), 2) AS przychod_total,
    ROUND(AVG(Amount), 2) AS srednia_wartosc
FROM amazon_sale_report.amazon_sale_report
WHERE Status != 'Cancelled'
GROUP BY B2B;

-- Który kanał sprzedaży działa lepiej?
SELECT 
    "Sales Channel",
    COUNT("Order ID") AS liczba_zamowien,
    ROUND(SUM(Amount), 2) AS przychod_total
FROM amazon_sale_report.amazon_sale_report
WHERE Status != 'Cancelled'
GROUP BY "Sales Channel"
ORDER BY przychod_total DESC;