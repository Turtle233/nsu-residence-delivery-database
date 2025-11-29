-- queries.sql
-- Query examples for NSU Residence Delivery Database

use [NSU Residence Delivery];
go

-- 1. Count users by residence hall
select PickupPlace, count(*) as UserCount
from Users
group by PickupPlace;

-- 2. Average food price per store
select s.StoreName, cast(avg(f.FoodPrice) as decimal (10,2)) as AvgFoodPrice
from Stores s
join Foods f on s.StoreID = f.StoreID
group by s.StoreName;

-- 3. List users and their food orders
select u.UserPreferredName, f.FoodName
from Users u
join Orders o on u.UserID = o.UserID
join Foods f on o.FoodID = f.FoodID;

-- 4. List stores and their foods
select s.StoreName, f.FoodName
from Stores s
join Foods f on s.StoreID = f.StoreID;

-- 5. Runners with no completed orders or rating
select*
from Runners r
where r.AvgRating is null or r.CompletedCount is null;

-- 6. Foods containing "Chicken"
select FoodName, FoodPrice
from Foods
where FoodName like '%chicken%';

-- 7. Users with '5' in their name
select UserPreferredName, UserPhone
from Users
where UserPreferredName like '%5%';

-- 8. List orders with user, food, and runner names
select o.OrderID, u.UserPreferredName, f.FoodName, r.RunnerName
from Orders o
join Users u on o.UserID = u.UserID
join Foods f on o.FoodID = f.FoodID
join Runners r on o.RunnerID = r.RunnerID;

-- 9. Most frequently ordered food
select top 1 o.FoodID, f.FoodName, f.FoodPrice
from Orders o
join Foods f on o.FoodID = f.FoodID
group by o.FoodID, f.FoodName, f.FoodPrice
order by count(*) desc;

-- 10. Stores that have zero orders
select StoreName
from Stores
where StoreID not in (
select distinct StoreID 
from Foods 
where FoodID in (
select distinct FoodID from Orders)
);