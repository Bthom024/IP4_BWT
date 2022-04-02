USE henry;

#1
SELECT * FROM author
SELECT * lastName, firstName;

#2
SELECT * FROM book
SELECT * title, TYPE;

#3
SELECT DISTINCT publisherCode, bookCode, title, TYPE, price, paperback
FROM book
GROUP BY publisherCode;

#4
SELECT title, price, (price*0.75) AS discount
FROM book;

#5
SELECT title, price
FROM book
WHERE price > 20.00;

#6
SELECT * FROM publisher
WHERE city = "New York";

#7
SELECT * FROM publisher
WHERE city != "New York";

#8
SELECT * FROM inventory
WHERE onHand BETWEEN 2 and 4;

#9
SELECT publisher.publisherCode, publisherName,COUNT(book.publisherCode) AS count
FROM publisher,book
WHERE publisher.publisherCode = book.publisherCode AND publisher.publisherName = 'Penguin USA'
GROUP BY book.publisherCode;

#10
SELECT COUNT(price) as total
FROM book
WHERE price <= 20.00;

#11
SELECT bookCode AS book_code, title AS title, book.publisherCode AS publisher_code, TYPE AS type, price AS price, paperback AS paperback, city AS city, publisherName AS publisher_name
FROM publisher, book
WHERE book.publisherCode = publisher.publisherCode;

#12
SELECT bookCode AS book_code, title AS title, book.publisherCode AS publisher_code, TYPE AS type, price AS price, paperback AS paperback, city AS city, publisherName AS publisher_name
FROM publisher
JOIN book ON
book.publisherCode = publisher.publisherCode;

#13
SELECT book.title AS title, publisher.city AS city
FROM book
JOIN publisher ON
publisher.publisherCode = book.publisherCode
GROUP BY book.title
ORDER BY book.title;

#14
SELECT book.title AS title, inventory.branchNum AS branch_num, inventory.onHand AS on_hand
FROM book,inventory
GROUP BY branch_num, book.title
ORDER BY book.title, branch_num;

#15
SELECT book.title AS title, inventory.branchNum AS branch_num, inventory.onHand AS on_hand, SUM(onHand) AS Inventory
FROM book,inventory
WHERE book.bookCode = inventory.bookCode
GROUP BY book.title
ORDER BY Inventory DESC;

#16
SELECT lastName, firstName, book.title, book.paperback
FROM author
JOIN wrote ON
wrote.authorNum = author.authorNum
JOIN book ON
book.bookCode = wrote.bookCode
WHERE paperback='Y'
ORDER BY lastName, title;

#BONUS
SELECT book.title AS title, author.lastName AS last_name
FROM book, author, wrote
WHERE book.bookCode = wrote.bookCode AND wrote.authorNum = author.authorNum
ORDER BY author.lastName;
