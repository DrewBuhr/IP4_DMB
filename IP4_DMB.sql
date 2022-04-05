USE henry;

SELECT * from author;

SELECT lastName, firstName from author; #1

SELECT * from book;

SELECT title, TYPE from book; #2

SELECT publisherCode from book
GROUP BY publisherCode; #3

SELECT title, price, .75*price AS discount from book LIMIT 5; #4

SELECT title, price from book WHERE price>20; #5

Select publisherName from publisher WHERE city = 'New York'; #6

SELECT publisherName from publisher WHERE city != 'New York'; #7

SELECT * from inventory;

SELECT bookCode, onHand from inventory WHERE onHand BETWEEN 2 and 4; #8

SELECT * from publisher;

SELECT publisherCode, COUNT(publisherCode) as 'Penguin Books' from book WHERE publisherCode = 'PE'; #9

SELECT COUNT(title) from book WHERE price<=20; #10

SELECT bookCode, title, book.publisherCode, TYPE, price, paperback, publisherName, city 
FROM book, publisher
WHERE book.publisherCode = publisher.publisherCode; #11

SELECT bookCode, title, book.publisherCode, TYPE, price, paperback, publisherName, city
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode; #12

SELECT title, city 
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode
ORDER BY title; #13

SELECT title, branchNum, onHand 
FROM book
JOIN inventory ON
book.bookCode = inventory.bookCode
ORDER BY title; #14

SELECT title, onHand as Inventory
FROM book
JOIN inventory ON 
book.bookCode = inventory.bookCode
GROUP BY title
ORDER BY Inventory
LIMIT 2; # 15

SELECT firstName, lastName, title, paperback FROM book, author
WHERE paperback = 'Y'
ORDER BY lastName, title; #16

SELECT title, lastName from book
JOIN wrote ON
book.bookCode = wrote.bookCode
JOIN author ON
wrote.authorNum = author.authorNum
ORDER BY lastName #BONUS