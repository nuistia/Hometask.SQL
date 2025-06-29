-- More test data to see difference 
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb9',  '2020-03-03 10:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1'), -- Біохімія
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc01', '2020-04-10 11:15:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1'), -- Біохімія

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc02', '2021-02-01 09:30:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3'), -- Гормони
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc03', '2021-03-15 14:45:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3'), -- Гормони

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc04', '2022-02-05 08:15:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4'), -- Онкомаркери
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc05', '2022-03-12 12:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4'), -- Онкомаркери
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc06', '2022-04-01 10:10:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4'), -- Онкомаркери

('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbc07', '2021-04-10 16:20:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2'); -- Біохімія


SELECT 
    g.gr_name AS GroupName,
    YEAR(o.ord_datetime) AS OrderYear,
    MONTH(o.ord_datetime) AS OrderMonth,
    COUNT(*) AS MonthlyCount,
    SUM(COUNT(*)) OVER (
        PARTITION BY g.gr_name, YEAR(o.ord_datetime)
        ORDER BY MONTH(o.ord_datetime)
    ) AS RunningTotal
FROM Orders o
JOIN Analysis a ON o.ord_an = a.an_id
JOIN Groups g ON a.an_group = g.gr_id
GROUP BY 
    g.gr_name,
    YEAR(o.ord_datetime),
    MONTH(o.ord_datetime)
ORDER BY 
    g.gr_name,
    OrderYear,
    OrderMonth;