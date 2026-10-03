

TRUNCATE TABLE maintenance_logs, restocking_events, transactions, machine_slots,
               vending_machines, products, payment_methods, employees, suppliers, locations
RESTART IDENTITY CASCADE;
INSERT INTO locations (location_id, name, address, city, location_type) VALUES
(1, 'Экономический факультет БГУ', 'ул. Карла Маркса, 31',      'Минск',  'университет'),
(2, 'ТЦ «Галерея»',                'пр-т. Победителей, 9',      'Минск',  'ТЦ'),
(3, 'Dana Center',                 'ул. Петра Мстиславца, 9',   'Минск',  'офис'),
(4, 'Вокзал Смолевичи',            'ул. Вокзальная, 8',         'Смолевичи', 'станция'),
(5, 'Жодинская ЦГБ',               'пр. Венисье, 1',            'Жодино',    'больница');

INSERT INTO suppliers (supplier_id, name, contact_phone, contact_email) VALUES
(1, 'УП «Кока-Кола Бевриджиз Беларусь»',  '+375 177563255', 'cola@napitki.by'),
(2, 'ОАО «Лидское пиво»',     '+375 154535300', 'lidskoe@napitki.by'),
(3, 'ИП Трепашко А.А.',      '+375293825544', 'trepashko@gmail.com');

INSERT INTO payment_methods (payment_method_id, method_name) VALUES
(1, 'Наличные'),
(2, 'Банковская карта'),
(3, 'NFC / Apple Pay / Google Pay'),
(4, 'ОПЛАТИ (QR-код)');

INSERT INTO employees (employee_id, full_name, role, phone, hired_date) VALUES
(1, 'Иванов Пётр Сергеевич',    'рабочий',  '+375 293764544', '2022-03-15'),
(2, 'Смирнова Анна Павловна',   'рабочий',  '+375 294536277', '2023-01-10'),
(3, 'Щедракова Владислава Дмитриевна','директор', '+375 295463411', '2020-05-20'),
(4, 'Трепашко Анна Алексеевна',    'маркетолог',    '+374 293824544', '2020-05-20'),
(5, 'Батура Катерина Александровна','директор', '+375 445647366', '2020-05-20');

INSERT INTO products (product_id, name, volume_ml, price, supplier_id) VALUES
(1, 'Кола классическая 0.33 л', 330, 1.00,  1),
(2, 'Кола без сахара 0.33 л',               330, 1.00, 1),
(3, 'Кола вишнёвая 0.33 л',        330, 2.50,  1),
(4, 'Кола ванильная 0.33 л',          330, 1.50, 1),
(5, 'Pepsi Классическая 0.5',         500, 1.20, 2),
(6, 'Pepsi без сахара 0.5',       500, 2.00,  2),
(7, 'Жвачка со вкусом колы',          NULL, 1.00, 3),
(8, 'Зефир со вкусом колы',           NULL, 3.00,  3);

INSERT INTO vending_machines (machine_id, location_id, serial_number, model, installed_date, status) VALUES
(1, 1, 'VM-2022-0001', 'VendoMax 500', '2022-04-01', 'active'),
(2, 2, 'VM-2022-0002', 'VendoMax 500', '2022-06-15', 'active'),
(3, 3, 'VM-2023-0003', 'SnackPro 300', '2023-02-20', 'active'),
(4, 4, 'VM-2023-0004', 'SnackPro 300', '2023-08-05', 'maintenance'),
(5, 5, 'VM-2024-0005', 'VendoMax 700', '2024-03-18', 'active'),
(6, 1, 'VM-2024-0006', 'VendoMax 700', '2024-09-01', 'inactive');

INSERT INTO machine_slots (slot_id, machine_id, product_id, slot_number, current_quantity, max_capacity) VALUES
(1,  1, 1, 'A1', 15, 20),
(2,  1, 2, 'A2', 8,  20),
(3,  1, 3, 'B1', 12, 15),
(4,  2, 1, 'A1', 18, 20),
(5,  2, 4, 'A2', 5,  15),
(6,  3, 5, 'A1', 10, 12),
(7,  3, 6, 'A2', 14, 20),
(8,  4, 7, 'A1', 0,  10),
(9,  4, 2, 'A2', 6,  20),
(10, 5, 8, 'A1', 9,  12),
(11, 5, 3, 'A2', 11, 15),
(12, 6, 1, 'A1', 0,  20);

-- slot_id всегда принадлежит указанному machine_id
INSERT INTO transactions (transaction_id, machine_id, slot_id, payment_method_id, amount, transaction_date, status) VALUES
(1,  1, 1,  2, 2.00,  '2026-09-01 09:15:00', 'успех'),
(2,  1, 2,  3, 3.00, '2026-09-01 12:40:00', 'успех'),
(3,  1, 3,  1, 2.50,  '2026-09-02 08:55:00', 'успех'),
(4,  1, 2,  4, 3.20, '2026-09-02 13:20:00', 'успех'),
(5,  2, 4,  2, 5.00,  '2026-09-03 10:05:00', 'успех'),
(6,  2, 5,  3, 1.50, '2026-09-03 18:30:00', 'успех'),
(7,  2, 5,  2, 2.10, '2026-09-04 11:11:00', 'ошибка'),
(8,  3, 6,  1, 2.00, '2026-09-04 14:45:00', 'успех'),
(9,  3, 7,  4, 3.00,  '2026-09-05 09:00:00', 'успех'),
(10, 3, 7,  2, 5.00,  '2026-09-05 16:25:00', 'успех'),
(11, 4, 8,  3, 5.50, '2026-09-06 07:50:00', 'отказ'),
(12, 4, 9,  1, 4.00, '2026-09-06 19:10:00', 'успех'),
(13, 5, 10, 2, 4.50,  '2026-09-07 12:00:00', 'успех'),
(14, 5, 11, 4, 5.00,  '2026-09-07 15:35:00', 'успех'),
(15, 5, 10, 3, 2.50,  '2026-09-08 10:20:00', 'успех'),
(16, 1, 1,  1, 2.00,  '2026-09-08 17:45:00', 'успех'),
(17, 2, 4,  4, 1.50,  '2026-09-09 08:30:00', 'успех'),
(18, 3, 6,  2, 4.00, '2026-09-09 13:05:00', 'успех'),
(19, 4, 9,  2, 2.50, '2026-09-10 09:40:00', 'успех'),
(20, 5, 11, 1, 4.50,  '2026-09-10 14:15:00', 'успех');

INSERT INTO restocking_events (restock_id, slot_id, employee_id, quantity_added, restock_date) VALUES
(1, 1,  1, 10, '2026-08-30 10:00:00'),
(2, 2,  1, 12, '2026-08-30 10:20:00'),
(3, 4,  2, 15, '2026-08-31 11:00:00'),
(4, 5,  2, 10, '2026-08-31 11:25:00'),
(5, 6,  1, 8,  '2026-09-01 09:30:00'),
(6, 10, 2, 6,  '2026-09-05 10:15:00'),
(7, 11, 2, 7,  '2026-09-05 10:40:00'),
(8, 3,  1, 9,  '2026-09-08 09:50:00');

INSERT INTO maintenance_logs (maintenance_id, machine_id, employee_id, issue_description, status, reported_date, resolved_date) VALUES
(1, 4, 3, 'Не работает купюроприёмник',          'в процессе', '2026-09-05 08:00:00', NULL),
(2, 1, 3, 'Заедает механизм выдачи в слоте A2',   'решено',    '2026-08-20 14:30:00', '2026-08-21 11:00:00'),
(3, 2, 5, 'Ошибка терминала оплаты картой',       'решено',    '2026-08-25 09:10:00', '2026-08-25 15:45:00'),
(4, 6, 5, 'Автомат не включается',                'не решено',        '2026-09-09 07:20:00', NULL),
(5, 3, 3, 'Плановое техническое обслуживание',    'решено',    '2026-07-15 10:00:00', '2026-07-15 12:30:00'),
(6, 5, 5, 'Не работает подсветка',        'не решено',        '2026-09-10 16:00:00', NULL);

-- Синхронизация счётчиков identity (чтобы новые INSERT без id не конфликтовали)
SELECT setval(pg_get_serial_sequence('locations',         'location_id'),       (SELECT MAX(location_id)       FROM locations));
SELECT setval(pg_get_serial_sequence('suppliers',         'supplier_id'),       (SELECT MAX(supplier_id)       FROM suppliers));
SELECT setval(pg_get_serial_sequence('payment_methods',   'payment_method_id'), (SELECT MAX(payment_method_id) FROM payment_methods));
SELECT setval(pg_get_serial_sequence('employees',         'employee_id'),       (SELECT MAX(employee_id)       FROM employees));
SELECT setval(pg_get_serial_sequence('products',          'product_id'),        (SELECT MAX(product_id)        FROM products));
SELECT setval(pg_get_serial_sequence('vending_machines',  'machine_id'),        (SELECT MAX(machine_id)        FROM vending_machines));
SELECT setval(pg_get_serial_sequence('machine_slots',     'slot_id'),           (SELECT MAX(slot_id)           FROM machine_slots));
SELECT setval(pg_get_serial_sequence('transactions',      'transaction_id'),    (SELECT MAX(transaction_id)    FROM transactions));
SELECT setval(pg_get_serial_sequence('restocking_events', 'restock_id'),        (SELECT MAX(restock_id)        FROM restocking_events));
SELECT setval(pg_get_serial_sequence('maintenance_logs',  'maintenance_id'),    (SELECT MAX(maintenance_id)    FROM maintenance_logs));
