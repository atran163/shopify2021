# 1. How many orders were shipped by Speedy Express in total?

SELECT COUNT(OrderId) as 'Total Orders' 
	FROM Orders as o 
	JOIN Shippers as s on o.ShipperId = s.ShipperID
	where ShipperName = "Speedy Express"
# Answer: 54 orders were shipped by Speedy Express in total




# 2. What is the last name of the employee with the most orders?

WITH Table1 AS (
SELECT COUNT(OrderID) AS "Orders", e.EmployeeID, e.LastName 
	FROM Orders AS o 
	JOIN Employees AS e on o.EmployeeID = e.EmployeeID
	GROUP BY e.EmployeeID, e.LastName
)
SELECT LastName FROM Table1 WHERE Orders = (SELECT max(orders) FROM Table1)
# Answer: Last name "Peacock" had the most orders



# 3. What product was ordered the most by customers in Germany?

SELECT p.ProductID, COUNT(p.ProductID) as "Counts"
	FROM Customers AS c 
    	JOIN Orders as o on c.CustomerID = o.CustomerID
    	JOIN OrderDetails as od on o.OrderID = od.OrderID 
    	JOIN Products as p on p.ProductID = od.ProductID
	WHERE Country = "Germany"
	GROUP BY p.ProductID
    	ORDER BY Counts DESC
# Answer: Product ID #5 was ordered the most by customers in Germany
