-- Database: Enhanced Library Management System

-- Table: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationYear INT,
    Genre VARCHAR(100),
    AuthorID INT,
    PublisherID INT,
    Edition VARCHAR(50),
    TotalCopies INT DEFAULT 1,
    AvailableCopies INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Biography TEXT
);

-- Table: Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    MembershipDate DATE NOT NULL,
    ExpiryDate DATE,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

-- Table: Loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LoanDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ReturnDate DATETIME,
    DueDate DATE NOT NULL,
    LoanStatus ENUM('Borrowed', 'Returned', 'Overdue') DEFAULT 'Borrowed',
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table: Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE,
    Address VARCHAR(255),
    ContactPerson VARCHAR(100)
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

-- Table: BookCategories
CREATE TABLE BookCategories (
    BookID INT,
    CategoryID INT,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table: Fines
CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    LoanID INT UNIQUE,
    MemberID INT,
    FineAmount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Pending', 'Paid') DEFAULT 'Pending',
    PaymentDate DATETIME,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table: Reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    ReservationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Fulfilled', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
