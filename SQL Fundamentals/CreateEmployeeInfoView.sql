-- Создание представления EmployeeInfo
CREATE VIEW EmployeeInfo AS
SELECT
    Employee.Id AS EmployeeId,
    COALESCE(Employee.EmployeeName, CONCAT(Person.FirstName, ' ', Person.LastName)) AS EmployeeFullName,
    CONCAT(Address.ZipCode, '_', Address.State, ', ', Address.City, '-', Address.Street) AS EmployeeFullAddress,
    CONCAT(Company.Name, '(', Employee.Position, ')') AS EmployeeCompanyInfo
FROM
    Employee
    INNER JOIN Person ON Employee.PersonId = Person.Id
    INNER JOIN Address ON Employee.AddressId = Address.Id
    INNER JOIN Company ON Employee.CompanyName = Company.Name
ORDER BY
    Company.Name ASC,
    Address.City ASC;
