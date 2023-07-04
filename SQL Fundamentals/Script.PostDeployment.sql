-- Создание таблицы Persons
CREATE TABLE Persons (
    Id INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL
);

-- Создание таблицы Addresses
CREATE TABLE Addresses (
    Id INT NOT NULL PRIMARY KEY,
    Street NVARCHAR(50) NOT NULL,
    City NVARCHAR(20),
    State NVARCHAR(50),
    ZipCode NVARCHAR(50)
);

-- Создание таблицы Employees
CREATE TABLE Employees (
    Id INT NOT NULL PRIMARY KEY,
    AddressId INT NOT NULL,
    PersonId INT NOT NULL,
    CompanyName NVARCHAR(20) NOT NULL,
    Position NVARCHAR(30),
    EmployeeName NVARCHAR(100),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
    FOREIGN KEY (PersonId) REFERENCES Persons (Id)
);

-- Создание таблицы Companies
CREATE TABLE Companies (
    Id INT NOT NULL PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL,
    AddressId INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id)
);

-- Заполнение таблиц значениями по умолчанию
INSERT INTO Persons (Id, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith');

INSERT INTO Addresses (Id, Street, City, State, ZipCode) VALUES
(1, '123 Main St', 'New York', 'NY', '12345'),
(2, '456 Elm St', 'Los Angeles', 'CA', '67890');

INSERT INTO Employees (Id, AddressId, PersonId, CompanyName, Position, EmployeeName) VALUES
(1, 1, 1, 'ABC Company', 'Manager', 'John Doe'),
(2, 2, 2, 'XYZ Corporation', 'Developer', 'Jane Smith');

INSERT INTO Companies (Id, Name, AddressId) VALUES
(1, 'ABC Company', 1),
(2, 'XYZ Corporation', 2);
