-- data.sql
-- Insert sample data for NSU Residence Delivery

use [NSU Residence Delivery];
go

--------------------
-- Users
--------------------
insert into Users (UserPreferredName, Password, PickupPlace, UserPhone)
values
('Apple', 'password123', 'Cobb Hall', '918-456-7890'),
('Bob', 'securePass1', 'Seminary Suite', '918-567-8901'),
('Cheeeers', 'passw0rd!', 'CourtSide', '918-678-9012'),
('David', 'david2023', 'South Leoser', '918-789-0123'),
('Eveee5555', 'eva12345', 'North Leoser', '862-890-1234'),
('Frank', 'frankH@123', 'Wyly Hall', '774-901-2345'),
('Grace', 'gr@ce567', 'Cobb Hall', '918-012-3456'),
('Helen', 'helen2024', 'Seminary Suite', '918-123-4567'),
('Ian', 'ian@1234', 'CourtSide', '814-234-5678'),
('Jack', 'jack9876', 'South Leoser', '636-345-6789'),
('Katie', 'katie@2025', 'North Leoser', '918-456-7891'),
('Luke', 'luke2023', 'Wyly Hall', '918-567-8902'),
('Mua', 'mia2023!', 'Cobb Hall', '448-678-9013'),
('Nina', 'nina@2022', 'Seminary Suite', '918-789-0124'),
('Oracle', 'oscar1234', 'CourtSide', '918-890-1235'),
('Ruixuan', 'nrskqfzl1234', 'Cobb Hall', '918-506-2859');

select *from Users;

--------------------
-- Stores
--------------------
delete from Stores;
alter table Stores
alter column StoreName nvarchar(100) not null;

insert into Stores (StoreID, StoreName, StorePhone, StorePlace)
values
(1, 'Chickfila', '918-444-2555', 'University Center Basement'),
(2, 'Pizza Hut', '918-222-3456', 'Leoser Complex'),
(3, 'Señor Sabroso', '918-333-4567', 'University Center Basement'),
(4, 'Rivers Edge Coffee', '918-444-2550', '1st floor of University Center'),
(5, 'Sushic Bar', '918-555-6789', 'University Center Basement'),
(6, 'Smoothie', '918-666-7890', 'University Center Basement'),
(7, 'Market Cafe', '918-777-8901', '1st floor of University Center'),
(8, 'Essentials', '918-888-9012', 'Leoser Complex');

select *from Stores;

--------------------
-- Foods
--------------------
insert into Foods (StoreID, FoodName, FoodPrice)
values
-- Store 1: Chickfila
(1, 'Spicy Chicken Sandwich', 5.99),
(1, 'Chick-fil-A Chicken Sandwich', 5.49),
(1, '8 Count Chicken Nuggets', 4.99),
(1, 'Grilled Chicken Sandwich', 6.29),

-- Store 2: Pizza Hut
(2, 'Pepperoni Pizza', 7.99),
(2, 'Cheese Pizza', 6.99),
(2, 'Italian Meat Pasta', 8.49),
(2, 'Super Pasta', 8.99),

-- Store 3: Señor Sabroso
(3, 'Mexican Burrito', 6.99),
(3, 'Clasicas', 5.49),
(3, 'Fajitas', 7.49),

-- Store 4: Rivers Edge Coffee
(4, 'Latte', 3.99),             
(4, 'Mocha', 4.49),             
(4, 'Classic Americano', 2.99), 

-- Store 5: Sushic Bar
(5, 'Chicken Fried Rice', 7.49),
(5, 'Beef Fried Rice', 7.99),
(5, 'Teriyaki Steamed Rice', 6.99),
(5, 'Tonkotsu Ramen', 8.99),

-- Store 6: Smoothie
(6, 'Banana Smoothie', 4.59),

-- Store 7: Market Cafe
(7, 'Brownie', 2.49),

-- Store 8: Essentials
(8, 'Seafood Cup Noodle', 3.29),
(8, 'KitKat Ice Cream', 3.99);

select *from Foods;

--------------------
-- Runners
--------------------
insert into Runners (RunnerID, RunnerName, RunnerPhone, RegisterDate, AvgRating, CompletedCount)
values
(1, 'Alice', '918-301-1020', '2021-07-15', 4.5, 98),
(2, 'Carter', '918-312-2240', '2023-01-11', 4.0, 52),
(3, 'Gwen', '918-323-3350', '2024-09-27', 4.6, 120),
(4, 'Kellan', '918-334-4460', '2025-04-18', null, null),
(5, 'Lena', '269-345-5570', '2025-02-18', 3.2, 25),
(6, 'Mason', '918-356-6680', '2023-05-30', 4.3, 74),
(7, 'Rachel', '918-506-8293', '2023-10-12', 4.8, 14),
(8, 'Sophie', '409-378-8800', '2025-04-02', null, 6),
(9, 'Trent', '918-389-9910', '2024-08-09', 4.1, 60),
(10, 'Willa', '619-390-1122', '2021-12-03', 4.7, 130),
(11, 'Zhang', '918-506-2850', '2023-06-30', 2.8, 7);

select *from Runners;

--------------------
-- Orders
--------------------
insert into Orders (OrderID, UserID, FoodID, RunnerID, CreatedTime, OrderStatus)
values
(1, 3, 2, 1, '2025-04-15 08:22:10', 'Delivered'),
(2, 7, 6, 5, '2025-04-15 11:13:45', 'Delivered'),
(3, 12, 9, 3, '2025-04-15 18:47:03', 'Delivered'),
(4, 1, 1, 2, '2025-04-16 08:01:33', 'Delivered'),
(5, 4, 17, 9, '2025-04-16 16:10:22', 'Delivered'),
(6, 11, 14, 2, '2025-04-16 13:39:57', 'Delivered'),
(7, 2, 7, 6, '2025-04-16 09:05:12', 'Delivered'),
(8, 6, 22, 7, '2025-04-16 20:41:29', 'Delivered'),
(9, 10, 5, 3, '2025-04-17 12:00:00', 'Delivered'),
(10, 8, 3, 8, '2025-04-17 17:22:42', 'Delivered'),
(11, 5, 20, 2, '2025-04-17 10:14:11', 'Delivered'),
(12, 13, 13, 5, '2025-04-17 15:09:08', 'Delivered'),
(13, 14, 8, 1, '2025-04-17 19:55:23', 'Delivered'),
(14, 9, 12, 10, '2025-04-17 07:44:00', 'Delivered'),
(15, 15, 11, 5, '2025-04-17 21:33:45', 'Delivered'),
(16, 2, 4, 6, '2025-04-18 19:10:10', 'OrderPlaced'),
(17, 6, 21, 9, '2025-04-18 14:26:17', 'Delivering'),
(18, 7, 18, 1, '2025-04-18 12:12:00', 'Delivering'),
(19, 1, 10, 3, '2025-04-18 08:08:08', 'Delivered'),
(20, 10, 19, 7, '2025-04-18 16:45:45', 'OrderPlaced');

select *from Orders; 
