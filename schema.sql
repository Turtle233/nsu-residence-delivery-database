-- schema.sql
-- NSU Residence Delivery Database Schema

create database [NSU Residence Delivery];

use [NSU Residence Delivery];
go

-- Users Table
create table Users (
    UserID int primary key identity(1,1),
    UserPreferredName varchar(100) not null,
    Password varchar(100) not null check (len(Password) >= 6),
    PickupPlace varchar(50) not null check (PickupPlace in (
        'Cobb Hall',
        'Seminary Suite',
        'CourtSide',
        'South Leoser',
        'North Leoser',
        'Wyly Hall'
    )),
    UserPhone varchar(20) not null
);

-- Stores Table
create table Stores (
    StoreID int primary key,
    StoreName Nvarchar(100) not null,
    StorePhone varchar(20) null,
    StorePlace varchar(200) not null
);

-- Foods Table
create table Foods (
    FoodID int primary key identity(1,1),
    StoreID int not null foreign key references Stores(StoreID),
    FoodName varchar(100) not null,
    FoodPrice decimal(10, 2) not null
);

-- Runners Table
create table Runners (
    RunnerID int primary key,
    RunnerName varchar(100) not null,
    RunnerPhone varchar(20) not null,
    RegisterDate date not null,
    AvgRating decimal(5,1) null,
    CompletedCount int null
);

-- Orders Table
create table Orders (
    OrderID int primary key,
    UserID int not null foreign key references Users(UserID),
    FoodID int not null foreign key references Foods(FoodID),
    RunnerID int not null foreign key references Runners(RunnerID),
    CreatedTime datetime not null,
    OrderStatus varchar(20) not null check (OrderStatus in ('Delivered', 'Delivering', 'OrderPlaced'))
);
