select c.FirstName, c.LastName, c.PhoneNumber, p.ProductName, o.OrderDate, oi.Price, oi.Quantity, o.OrderID, oi.ProductID
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
left join OrderItems oi on o.OrderID = oi.OrderID
left join Products p on oi.ProductID = p.ProductID

select c.FirstName, c.Lastname, o.OrderID, o.OrderDate
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID

select c.FirstName, c.LastName, o.OrderID, o.OrderDate
from Customers c
right join Orders o on C.CustomerID = O.CustomerID

select c.FirstName, c.LastName, o.OrderID, o.OrderDate
from Customers c
join Orders o on C.CustomerID = O.CustomerID -- Join --> Inner Join as default.

/*
delete from Customers
where CustomerID = 2
*/

select p.productname, p.price, c.categoryname
from products p
join categories c on p.CategoryID = c.CategoryID

select o.orderid, o.orderdate, p.productname, oi.quantity, oi.price
from orderitems oi -- Çünkü ortak noktası bu tablo. Hem productid'yi hem de orderid'yi içeren tablo bu, buradan her ikisinin de verilerine erişebiliriz.
inner join orders o on oi.OrderID = o.OrderID
inner join products p on oi.ProductID = p.ProductID

-- ortak tabloya from verip verisini çekmek istediklerini de join'liyorsun.

select c.firstname, c.lastname, c.phonenumber, o.orderid, o.orderdate, oi.productid, oi.price, oi.quantity
from customers c
full join orders o on c.CustomerID = o.CustomerID
full join orderitems oi on o.OrderID = oi.OrderID

select c.firstname, c.lastname, c.phonenumber, o.orderid, o.orderdate, oi.productid, oi.price, oi.quantity
from customers c
full outer join orders o on c.CustomerID = o.CustomerID
full outer join orderitems oi on o.OrderID = oi.OrderID

select productname, price
from products
where CategoryID = 1 -- CategoryID = 1 diyebilirsin mesela, ama --> 

-- Non-correlated Subquery ->

select productname, price
from products
where CategoryID = (select categoryid from categories where CategoryName LIKE 'e%')

-- Correlated Subquery ->

select c.customerid, c.firstname
from customers c
where EXISTS ( -- It means True
	select 1
	from orders O
	where o.CustomerID = c.CustomerID
)

select productname
from products
where productname in ('Laptop', 'Koltuk')

select productname
from products
where CategoryID in (select categoryid from categories where CategoryName LIKE 'e%')

select productname, price
from products
where price > ANY (select price from products where CategoryID = 1)

select LEN('VELİHAN')
select lower('VELİHAN')
select upper('velİhan')

select substring('VELİHAN', 2, 5)
select replace('Velihan', 'vELi', 'velo')

select getdate()
select getdate()+7
select dateadd(hour, 2, getdate())

select DATEDIFF(year, '1998-03-08', GETDATE())
select DATEDIFF(day, '1998-03-08', GETDATE())

select format(getdate(), 'dd/MM/yyyy')
select format(getdate(), 'dd/mm/yyyy')

select abs(-20)
select CEILING(5.3)
select FLOOR(7.9432532)

select ROUND(3.48738759805280,3)
select ROUND(3.48768759805280,3)

select POWER(4,3)

SELECT ProductName, Price,
	CASE 
		WHEN Price < 1500 THEN 'Ucuz'
		WHEN Price BETWEEN 2000 AND 5000 THEN 'Eh işte'
		ELSE 'Pahalı'
	END AS PriceCategory,
	CASE
		WHEN StockQuantity < 500 THEN 'Stok azalıyor!'
		ELSE 'Stoklar OK!'
	END AS StockStatus
FROM Products

DECLARE @StockQuantity INT
SET @StockQuantity = (SELECT StockQuantity FROM Products P WHERE ProductID = 8)

IF @StockQuantity > 0
	BEGIN
		PRINT 'Stok var!'
	END
ELSE
	BEGIN
		PRINT 'Stok yok!'
	END

DECLARE @CustomerEmail NVARCHAR (200) = 'velooo@gmail.com'

IF EXISTS (SELECT 1 FROM CUSTOMERS WHERE Email = @CustomerEmail)
	BEGIN
		PRINT 'Customer already registered'
	END
ELSE
	BEGIN
		PRINT 'Customer is not registered yet! And now inserting...'
		INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
		VALUES ('Velihan2', 'Gözek2', @CustomerEmail, '4836285712')
		PRINT 'Customer registered Now!'
	END

DECLARE @Counter INT = 1

WHILE @Counter <= 100
	BEGIN
		PRINT 'Counter : ' + CAST(@Counter AS NVARCHAR)
		SET @Counter = @Counter + 1
	END

DECLARE @Counter2 INT = 1

WHILE @Counter2 <= 100
	BEGIN
		IF @Counter2 = 5
			BREAK
		PRINT 'Counter : ' + CAST(@Counter2 AS NVARCHAR)
		SET @Counter2 = @Counter2 + 1
	END

DECLARE @Counter3 INT = 0

WHILE @Counter3 <= 10
	BEGIN
		SET @Counter3 = @Counter3 + 1 -- SET'i burada önce yazmamız gerekiyor CONTINUE durumunda es geçilmemesi adına.
		IF @Counter3 = 5
			CONTINUE
		PRINT 'Counter : ' + CAST(@Counter3 AS NVARCHAR)	
	END

DECLARE @ProductID INT
DECLARE @CurrentStock INT

SET @ProductID = (SELECT MIN(ProductID) FROM Products)

WHILE @ProductID IS NOT NULL -- Tablodaki tüm ürünler işlenene dek devam et manası taşıyor.
	BEGIN
		SET @CurrentStock = (SELECT StockQuantity FROM PRODUCTS WHERE ProductID = @ProductID)
		IF @CurrentStock < 95
			BEGIN
				UPDATE Products
				SET Price = Price*1.1
				WHERE ProductId = @ProductID
				PRINT 'Low stock product prices are increased, product id : ' + CAST(@ProductID as nvarchar)
			END
		ELSE -- Checking @CurrentStock >= 95 Condition
			BEGIN
				UPDATE Products
				SET Price = Price*0.9
				WHERE ProductId = @ProductID
				PRINT 'High stock product prices are decreased, product id : ' + CAST(@ProductID as nvarchar)
			END
		SET @ProductID = (SELECT MIN(ProductId) FROM PRODUCTS WHERE ProductId > @ProductID)	
	END