-- Создание представления EmployeeInfo
CREATE VIEW EmployeeInfo AS
SELECT
    Employees.Id AS EmployeeId,
    COALESCE(Employees.EmployeeName, CONCAT(Persons.FirstName, ' ', Persons.LastName)) AS EmployeeFullName,
    CONCAT(Addresses.ZipCode, '_', Addresses.State, ', ', Addresses.City, '-', Addresses.Street) AS EmployeeFullAddress,
    CONCAT(Companies.Name, '(', Employees.Position, ')') AS EmployeeCompanyInfo
FROM
    Employees
    INNER JOIN Persons ON Employees.PersonId = Persons.Id
    INNER JOIN Addresses ON Employees.AddressId = Addresses.Id
    INNER JOIN Companies ON Employees.CompanyName = Companies.Name
ORDER BY
    Companies.Name ASC,
    Addresses.City ASC;
