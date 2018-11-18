/*+1. Find amount of money, that every customer spend.*/
SELECT customers.customerName, SUM(payments.amount)
FROM customers
	INNER JOIN payments ON customers.customerNumber = payments.customerNumber 
GROUP BY customers.customerName;

/*+2.Find most productive office (in orders count).*/
SELECT offices.officeCode, offices.city, COUNT(orders.orderNumber)
FROM offices
	INNER JOIN employees ON offices.officeCode = employees.officeCode
		INNER JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
			INNER JOIN orders ON orders.customerNumber = customers.customerNumber
GROUP BY offices.officeCode ORDER BY COUNT(orders.orderNumber) DESC LIMIT 1;

/*+3. Find most popular product.*/
SELECT products.productName, orderdetails.quantityOrdered
FROM products
	INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
		INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
ORDER BY orderdetails.quantityOrdered DESC LIMIT 1;

/*+4*.  Sort all offices using pure income for any period of time
(for example use @start = '2004-03-02' @end = '2005-06-07')*/
SELECT offices.officeCode, offices.city, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS "Pure Income"
FROM offices 
INNER JOIN employees ON employees.officeCode = offices.officeCode
INNER JOIN customers ON customers.salesRepEmployeeNumber = employees.employeeNumber
INNER JOIN orders ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
WHERE orders.status = 'Shipped' AND (orders.shippedDate BETWEEN '2004-03-02' AND '2005-06-07')
GROUP BY offices.officeCode ORDER BY SUM(orderdetails.quantityOrdered * orderdetails.priceEach) DESC;
