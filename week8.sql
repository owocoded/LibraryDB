CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 📚 Table: Books
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    published_year YEAR,
    copies_available INT DEFAULT 0
);

-- 👤 Table: Members
CREATE TABLE member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    membership_date DATE DEFAULT CURRENT_DATE
);

-- 📖 Table: Authors
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);

-- 🔗 Table: Book-Author (Many-to-Many Relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

-- 🔄 Table: Loans (Tracks Borrowings)
CREATE TABLE loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE DEFAULT CURRENT_DATE,
    due_date DATE,
    return_date DATE DEFAULT NULL,
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES member(member_id) ON DELETE CASCADE
);