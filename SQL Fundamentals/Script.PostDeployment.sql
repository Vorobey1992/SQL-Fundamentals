-- Создание таблицы Person
CREATE TABLE Person (
    Id INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
);

-- Создание таблицы Address
CREATE TABLE Address (
    Id INT NOT NULL PRIMARY KEY,
    Street NVARCHAR(50) NOT NULL,
    City NVARCHAR(20),
    State NVARCHAR(50),
    ZipCode NVARCHAR(50)
);

-- Создание таблицы Employee
CREATE TABLE Employee (
    Id INT NOT NULL PRIMARY KEY,
    AddressId INT NOT NULL,
    PersonId INT NOT NULL,
    CompanyName NVARCHAR(20) NOT NULL,
    Position NVARCHAR(30),
    EmployeeName NVARCHAR(100),
    FOREIGN KEY (AddressId) REFERENCES Address (Id),
    FOREIGN KEY (PersonId) REFERENCES Person (Id)
);

-- Создание таблицы Company
CREATE TABLE Company (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL,
    AddressId INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Address (Id)
);

-- Заполнение таблиц значениями по умолчанию
INSERT INTO Person (Id, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

INSERT INTO Address (Id, Street, City, State, ZipCode) VALUES
(1, '123 Main St', 'New York', 'NY', '12345'),
(2, '456 Elm St', 'Los Angeles', 'CA', '67890');

INSERT INTO Employee (Id, AddressId, PersonId, CompanyName, Position, EmployeeName) VALUES
(1, 1, 1, 'ABC Company', 'Manager', 'John Doe'),
(2, 2, 2, 'XYZ Corporation', 'Developer', 'Jane Smith');

INSERT INTO Company (Id, Name, AddressId) VALUES
(1, 'ABC Company', 1),
(2, 'XYZ Corporation', 2);

