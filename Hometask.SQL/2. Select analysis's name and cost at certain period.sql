SELECT Analysis.an_name AS Name, Analysis.an_cost AS Cost FROM Orders
JOIN Analysis ON Orders.ord_an = Analysis.an_id
WHERE Orders.ord_datetime >= '2020-02-05' AND Orders.ord_datetime < '2020-02-12';