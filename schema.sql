create database Bigmart;

use Bigmart;

--many to many relationship
create table products(Item_Identifier varchar(10) primary key,Item_Weight decimal(6,3) null, Item_Fat_Content varchar(20) not null, Item_Type varchar(50) not null, Item_MRP decimal(8,4) not null) engine=innodb;

create table outlets(Outlet_Identifier varchar(10) primary key,Outlet_Establishment_Year year not null, Outlet_Size varchar(20) null Outlet_Location_Type varchar(20) not null, Outlet_Type varchar(30) not null) engine=innodb;

create table sales(sale_id int auto_increment primary key, Item_Identifier varchar(10) not null, Outlet_Identifier varchar(10) not null, Item_Visibility decimal(8,6) not null, Item_Outlet_Sales decimal(10,4) not null, foreign key (Item_Identifier) references products(Item_Identifier), foreign key (Outlet_Identifier) references outlets (Outlet_Identifier), unique key unique_item_outlet (Item_Identifier, Outlet_Identifier)) engine=innodb;

--temporary table to load the cleaned data then normalize it
 CREATE TABLE staging_bigmart (Item_Identifier VARCHAR(10), Item_Weight DECIMAL(6,3) NULL, Item_Fat_Content VARCHAR(20),Item_Visibility DECIMAL(8,6), Item_Type VARCHAR(50), Item_MRP DECIMAL(8,4), Outlet_Identifier VARCHAR(10), Outlet_Establishment_Year YEAR, Outlet_Size VARCHAR(20) NULL, Outlet_Location_Type VARCHAR(20), Outlet_Type VARCHAR(30), Item_Outlet_Sales DECIMAL(10,4) ) ENGINE=InnoDB;

