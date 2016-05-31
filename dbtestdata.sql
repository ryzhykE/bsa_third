#1
SELECT u.*
	FROM users As u
	JOIN users_books 
	ON ub.user_id=u.id
	WHERE u.age>20
	GROUP BY u.id
	HAVING count (ub.book_id)>5;

#2
SELECT * 
	FROM users 
	WHERE first_name
	LIKE '%3%';
	
#3
SELECT u.*
	FROM users
	WHERE id NOT IN
	(SELECT u.id
		FROM users u
		JOIN users_books ub ON ub.user_id=u.id 
		JOIN books b ON b.id=ub.book_id 
		WHERE b.title='Book #21'
	);
	
#4
ALTER TABLE users
	ADD is_active int(1);
	
#5
UPDATE users
	SET is_active = 1
	WHERE ( SELECT count (users.books.book_id)
	FROM users_books
	WHERE user.id = users_books.ser_id)>0	
	);
	
#6
ALTER TABLE books
	ADD isbestseller bool;
	
#7
UPDATE books
	SET isbestseller = 1
	WHERE id IN (
		SELECT book_id
		FROM users_books
		GROUP BY book_id
		HAVING count(book_id)>10
	);
	


	