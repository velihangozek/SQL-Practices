/*
create database ETicaret
use ETicaret
*/

/*
create table Customers (
	CustomerID int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100),
	LastName nvarchar(100),
	Email nvarchar(200),
	PhoneNumber nvarchar(15)
)

create table Products (
	ProductID int IDENTITY(1,1) PRIMARY KEY,
	ProductName nvarchar(250),
	Price Decimal(10,2), --(10,2) kullanılır genelde.
	StockQuantity int,
)

create table Orders (
	OrderID int IDENTITY(1,1) PRIMARY KEY,
	OrderDate DATETIME,
	CustomerID int,
	foreign key (CustomerID) references Customers(CustomerID)
)

create table OrderItems (
	OrderItemID int IDENTITY(1,1) PRIMARY KEY,
	OrderID int,
	ProductID int,
	Quantity int,
	Price Decimal(10,2),
	foreign key (OrderID) references Orders(OrderID),
	foreign key (ProductID) references Products(ProductID), -- Sıranın bir önemi yok önce ProductID ilişkisini de yazabilirdik.
)
*/

/*
insert into Customers (FirstName, LastName, Email, PhoneNumber)
values 
('Velihan', 'Gözek', 'velihangozek@hotmail.com', 5545226482)
*/

/*
insert into Customers (FirstName, LastName, Email, PhoneNumber)
values 
('Fatih', 'Kayacı', 'fatih@kayaci.com', '2131241242'),
('Ahmet', 'Kaya', 'ahmet@kaya.com', '1241242141')
*/

/*
insert into Products (ProductName, Price, StockQuantity)
values ('Laptop', 15000.500, 3),
*/

/*
insert into Products (ProductName, Price, StockQuantity)
values 
('Telefon', 10000.300, 6),
('Televizyon', 50000.800, 2),
('Kulaklık', 2500.500, 4)
*/

/*
insert into Orders (OrderDate, CustomerID)
values (GETDATE(), 1)
*/

/*
insert into Orders (OrderDate, CustomerID)
values (GETDATE(), 4) --> Hata verecek henüz 4 id'li customer olmadığından.
*/

/*
insert into Orders (OrderDate, CustomerID)
values
(GETDATE(), 2),
(GETDATE(), 3)
*/

/*
insert into OrderItems (OrderID, ProductID, Quantity, Price)
values (3, 1, 5, 2000.25)
*/

/*
insert into OrderItems (OrderID, ProductID, Quantity, Price)
values
(1, 2, 4, 6000.65),
(4, 1, 4, 3000.55)
*/

/*
update Customers
set Email = 'velihan.gozek@gmail.com'
where CustomerID = 1
*/

/*
update Customers
set Email = 'velo@gmail.com', FirstName = 'Velo'
where CustomerID = 1
*/

/*
update Products
set Price = Price * 0.9
where Price > 3000
*/

/*
update Products
set StockQuantity = StockQuantity * 5
where Price < 10000 AND StockQuantity > 3
*/

/*
update Products
set StockQuantity = 500
where Price > 30000 OR StockQuantity > 25
*/

/*
update Products
set StockQuantity = 1000
where (Price < 2000 AND StockQuantity > 400) OR Price > 10000
*/

/*
update Products
set Price = Price * 1.05
where StockQuantity < 25 OR Price > 40000
*/

/*
delete from Customers
where CustomerID = 2
*/

/*
insert into Customers (FirstName, LastName, Email, PhoneNumber)
values ('Sümeyye', 'Öztürk', 'sumeyye@gmail.com', '1236547896')
*/

/*
delete from Customers
where CustomerID = 4
*/

/*
select ProductID, ProductName, SUM(Price*StockQuantity) as TotalPriceByProductQuantity -- Tüm ürünlerin toplam stoklarıyla çarpılarak fiyatı
from Products
group by ProductID, ProductName
*/

/*
select SUM(Price) as TotalAllProductPrice -- Tüm ürünlerin toplam fiyatı
from Products
*/

/*
select AVG(Price) as AveragePrice -- Tüm ürünlerin ortalama fiyatı
from products

WITH MinPriceProduct AS (
  SELECT TOP 1 ProductName, Price
  FROM Products
  ORDER BY Price ASC
),
MaxPriceProduct AS (
  SELECT TOP 1 ProductName, Price
  FROM Products
  ORDER BY Price DESC
)
SELECT * FROM MinPriceProduct
UNION ALL
SELECT * FROM MaxPriceProduct
*/

/*
select MIN(Price) as LowestPrice, MAX(Price) as HighestPrice
from Products
*/

/*
select COUNT(*) as UniqueProductQuantity
from products
*/

/*
select * 
from products 
*/

/*
select productname, stockquantity, price
from products
order by stockquantity asc, price desc
*/

-- CategoryID ekleyelim


/*
alter table Products
add CategoryID int

-- Category Table'ı oluşturalım

create table Categories (
	CategoryID int IDENTITY(1,1) PRIMARY KEY,
	CategoryName nvarchar(200),
)

insert into Categories (CategoryName)
values 
('elektronik'),
('mobilya'),
('giyim')

alter table Products
add foreign key (CategoryID) references Categories(CategoryID)

update products
set categoryID = 1
where productname IN ('Laptop', 'Telefon', 'Kulaklık', 'Televizyon')
*/

/*
select CategoryID, SUM(StockQuantity) as TotalStock
from Products
GROUP BY CategoryID
*/

insert into Products (ProductName, Price, StockQuantity)
values ('Koltuk', 12000, 28)

insert into Products (ProductName, Price, StockQuantity)
values ('Pantolon', 500, 45)

update products
set CategoryID = 2
where ProductID = 5

update products
set CategoryID = 3
where ProductID = 7



select CategoryID, COUNT(*) as ToplamÜrünSayısı
from products
group by CategoryID

select CategoryID, SUM(StockQuantity) as TotalStock
from Products
GROUP BY CategoryID

select CategoryID, SUM(StockQuantity) as TotalStock
from Products
GROUP BY CategoryID
HAVING SUM(StockQuantity) > 1000

select productname, price
from products
where price between 2000 and 10000

-- Kötü kod aşağıda

select productname, price
from products
where price > 2000 and price < 10000

select productname, price
from products

select *
from orders
where OrderDate between '2024-10-01' and '2024-10-15'

select ProductName, CategoryID
from Products
where CategoryID in (2,3)

select OrderID, CustomerId
from orders
where customerid in (1,2,3)

select productname
from products
where productname LIKE '%on'

select productname
from products
where productname LIKE 'te%'

select productname
from products
where productname LIKE '%pt%'

select productname
from products
where productname LIKE '______'

select productname
from products
where productname LIKE 'k_____'

select *
from products
where 
price between 10000 and 50000 AND
categoryID in (1) AND
productname LIKE '%o_'