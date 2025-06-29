CREATE DATABASE CHI_IT_TASK;
GO
USE CHI_IT_TASK;

CREATE TABLE Groups (
    gr_id UNIQUEIDENTIFIER PRIMARY KEY,
    gr_name NVARCHAR(50),
    gr_temp DECIMAL(5, 2)
);

CREATE TABLE Analysis (
    an_id UNIQUEIDENTIFIER PRIMARY KEY,
    an_name  NVARCHAR(100),
    an_cost DECIMAL(10, 2),
    an_price DECIMAL(10, 2),
    an_group UNIQUEIDENTIFIER,
    CONSTRAINT FK_Analysis_Groups FOREIGN KEY (an_group) REFERENCES Groups(gr_id)
);

CREATE TABLE Orders (
    ord_id UNIQUEIDENTIFIER PRIMARY KEY,
    ord_datetime DATETIME,
    ord_an UNIQUEIDENTIFIER,
    CONSTRAINT FK_Orders_Analysis FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

INSERT INTO Groups (gr_id, gr_name, gr_temp)
VALUES
('11111111-1111-1111-1111-111111111111', N'Біохімія', 4.00),
('22222222-2222-2222-2222-222222222222', N'Гормони', 5.00),
('33333333-3333-3333-3333-333333333333', N'Онкомаркери', 6.00),
('44444444-4444-4444-4444-444444444444', N'Загальний аналіз крові', 22.00);

INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1', N'Глюкоза', 50.00, 120.00, '11111111-1111-1111-1111-111111111111'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2', N'Холестерин', 40.00, 100.00, '11111111-1111-1111-1111-111111111111'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3', N'ТТГ', 60.00, 150.00, '22222222-2222-2222-2222-222222222222'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4', N'Альфа-фетопротеїн', 70.00, 200.00, '33333333-3333-3333-3333-333333333333'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa5', N'Загальний білок', 30.00, 90.00, '11111111-1111-1111-1111-111111111111'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa6', N'Гемоглобін', 20.00, 70.00, '44444444-4444-4444-4444-444444444444');

INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb1', '2020-02-04 08:30:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '2020-02-05 10:15:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb3', '2020-02-06 12:45:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb4', '2020-02-10 09:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb5', '2020-02-12 14:20:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa5'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb6', '2020-02-14 11:10:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb7', '2020-02-15 16:50:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa6'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb8', '2020-02-07 08:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3');