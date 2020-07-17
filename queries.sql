-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT product.ProductName, category.CategoryName
FROM product
join category on product.CategoryId = category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.Id, s.CompanyName
from [order] as o
join shipper as s on o.ShipVia = s.Id
where o.OrderDate < "2012-08-09"
order by o.OrderDate desc

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, o.Quantity
from product as p
join OrderDetail as o on p.Id = o.ProductId
where o.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id, c.CompanyName, e.Lastname
from [Order] as o
join Customer as c on o.CustomerId = c.id
join Employee as e on o.EmployeeId = e.id


-- In SQL Try Editor at W3Schools.com:
-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT CategoryName, count(*)
FROM Products
join Categories on Categories.CategoryId = Products.CategoryId
group by CategoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID, count(*) as ItemCount
FROM OrderDetails
join Products on Products.ProductID = OrderDetails.ProductID
group by OrderID