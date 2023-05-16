-- CREATE DATABASE library;

-- Create the 'users' table to store user data
CREATE TABLE users (
  u_id INT(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  role ENUM('admin', 'user') DEFAULT 'user' NOT NULL	
);

-- Create the 'books' table to store book data
CREATE TABLE books (
  b_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  publication_date DATE NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (b_id)
);

-- Create the 'borrowings' table to store borrowing data
CREATE TABLE borrowings (
  bo_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  borrow_date DATE NOT NULL,
  return_date DATE,
  PRIMARY KEY (bo_id),
  FOREIGN KEY (user_id) REFERENCES users(u_id),
  FOREIGN KEY (book_id) REFERENCES books(b_id)
);

-- Create the 'reservations' table to store reservation data
CREATE TABLE reservations (
  r_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  reserve_date DATE NOT NULL,
  status ENUM('pending', 'approved', 'cancelled') DEFAULT 'pending',
  PRIMARY KEY (r_id),
  FOREIGN KEY (user_id) REFERENCES users(u_id),
  FOREIGN KEY (book_id) REFERENCES books(b_id)
);


-- Insert 9 more users into the 'users' table
INSERT INTO users (username, password, email, name)
VALUES
('jane_doe', 'password123', 'jane.doe@example.com', 'Jane Doe'),
('bob_smith', 'password456', 'bob.smith@example.com', 'Bob Smith'),
('alice_brown', 'password789', 'alice.brown@example.com', 'Alice Brown'),
('tom_wilson', 'passwordabc', 'tom.wilson@example.com', 'Tom Wilson'),
('emma_jones', 'passworddef', 'emma.jones@example.com', 'Emma Jones'),
('william_davis', 'passwordghi', 'william.davis@example.com', 'William Davis'),
('olivia_parker', 'passwordjkl', 'olivia.parker@example.com', 'Olivia Parker'),
('jackson_moore', 'passwordmno', 'jackson.moore@example.com', 'Jackson Moore'),
('sophia_hall', 'passwordpqr', 'sophia.hall@example.com', 'Sophia Hall');

-- Insert 19 more books into the 'books' table
INSERT INTO books (title, author, publisher, publication_date, isbn, quantity)
VALUES
('To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960-07-11', '978-0446310789', 10),
('1984', 'George Orwell', 'Secker and Warburg', '1949-06-08', '978-0451524935', 15),
('The Catcher in the Rye', 'J. D. Salinger', 'Little, Brown and Company', '1951-07-16', '978-0316769488', 8),
('The Hobbit', 'J. R. R. Tolkien', 'George Allen & Unwin', '1937-09-21', '978-0261102217', 12),
('Animal Farm', 'George Orwell', 'Secker and Warburg', '1945-08-17', '978-0451526342', 20),
('Lord of the Flies', 'William Golding', 'Faber and Faber', '1954-09-17', '978-0399501487', 10),
('Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813-01-28', '978-0141439518', 15),
('The Picture of Dorian Gray', 'Oscar Wilde', 'Ward, Lock and Company', '1890-07-01', '978-0141439570', 18),
('The Adventures of Huckleberry Finn', 'Mark Twain', 'Chatto & Windus', '1884-12-10', '978-0143107323', 7),
('The Lord of the Rings', 'J. R. R. Tolkien', 'George Allen & Unwin', '1954-07-29', '978-0618517657', 13),
('Wuthering Heights', 'Emily Brontë', 'Thomas Cautley Newby', '1847-12-15', '978-0141439556', 11),
('The Great Expectations', 'Charles Dickens', 'Chapman & Hall', '1861-08-01', '978-0141439563', 20),
('Anna Karenina', 'Leo Tolstoy', 'The Russian Messenger', '1877-01-01', '978-0143035008', 9),
('The Brothers Karamazov', 'Fyodor Dostoevsky', 'The Russian Messenger', '1880-01-01', '978-0374528379', 8);

-- Insert 6 more books into the 'books' table
INSERT INTO books (title, author, publisher, publication_date, isbn, quantity)
VALUES
('The Divine Comedy', 'Dante Alighieri', 'Folengo', '1472-01-01', '978-0141197494', 8),
('War and Peace', 'Leo Tolstoy', 'The Russian Messenger', '1869-01-01', '978-0198701245', 14),
('The Adventures of Sherlock Holmes', 'Arthur Conan Doyle', 'George Newnes Ltd', '1892-06-14', '978-0141034354', 20),
('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 'Pan Books', '1979-10-12', '978-0345391803', 15),
('Harry Potter and the Philosopher''s Stone', 'J. K. Rowling', 'Bloomsbury', '1997-06-26', '978-0747532699', 10);



-- Insert a borrowing record into the 'borrowings' table
INSERT INTO borrowings (user_id, book_id, borrow_date, return_date)
VALUES (1, 1, '2022-04-01', '2022-04-30');

-- Insert a reservation into the 'reservations' table
INSERT INTO reservations (user_id, book_id, reserve_date, status)
VALUES (1, 1, '2022-03-15', 'approved');



SELECT *
	FROM users

