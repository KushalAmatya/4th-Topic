create database test1;

use test1;
create table products(
ProductID int primary key,
ProductName varchar(40) not null,
SupplierID int,
CategoryID int,
QuantityPerUnit varchar(20),
UnitPrice int,
UnitsItsStock smallint,
UnitsOnOrder Smallint,
ReorderLevel smallint,
Discontinued bit not null
);

create table Suppliers(
SupplierId int primary key,
CompanyName varchar(40) not null,
ContactName varchar(40),
Address varchar(30)
);
create table Orders(
OrderId int primary key,
CustomerId int,
EmployeeId int,
ShipperId int,
Orderdata datetime
);
drop table orders;
create table employee(
EmployeeId int primary key,
FirstName varchar(20),
LastName varchar(20),
address varchar(20)
);
create table Customers(
CustomerId int primary key,
CompanyName varchar(40),
ContactName varchar(40)
);
create table Order_Details(
OrderId int,
ProductId int,
Unitprice int
);
create table Categories(
CategoryId int primary key,
CategoryName varchar(15),
Descriptions text
);
create table EmployeeTerritories(
TerritoryId int,
EmployeeId int
);
create table Territories(
TerritoryId int primary key,
RegionId int,
TerritoryDescription char(50)
);
drop table territories;
create table Region(
RegionId int primary key,
RegionDescription varchar(50)
);
desc Products;
create table CustomerDemo(
CustomerId int,
CustomerTypeId char(10)
);
drop table CustomerDemo;
create table CustomerDemographics(
CustomerTypeId char(10) primary key,
CustomerDesc text
);
create table Shippers(
ShipperId int primary key,
CompanyName varchar(40),
Phone varchar(10)
);

alter table Products
Add constraint fk_suppid foreign key(SupplierId) references Suppliers(SupplierId);
alter table Products
add constraint fk_catid foreign key(CategoryId) references Categories(CategoryId);
alter table orders
add constraint fk_empid foreign key(EmployeeId) references Employee(EmployeeId);
alter table orders
add constraint fk_custid foreign key(CustomerId) references Customers(CustomerId);
alter table orders
add constraint fk_shid foreign key(ShipperId) references Shippers(ShipperId);
alter table CustomerDemo
add constraint fk_cid foreign key(CustomerId) references Customers(CustomerId);
alter table CustomerDemo
add constraint fk_ctid foreign key(CustomerTypeId) references CustomerDemographics(CustomerTypeId);
alter table EmployeeTerritories
add constraint fk_eid foreign key(EmployeeId) references Employee(EmployeeId);
alter table EmployeeTerritories
add constraint fk_terid foreign key(TerritoryId) references Territories(TerritoryId);
desc territories;
alter table territories
add constraint fk_rid foreign key(RegionId) references Region(regionid);
alter table Order_details
add constraint fk_oid foreign key(OrderId) references Orders(OrderId);
alter table Order_details
add constraint fk_prodid foreign key(ProductId) references Products(ProductId);

