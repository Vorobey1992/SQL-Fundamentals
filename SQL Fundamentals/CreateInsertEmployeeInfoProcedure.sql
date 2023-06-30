-- Создание хранимой процедуры InsertEmployeeInfo
CREATE PROCEDURE InsertEmployeeInfo
    @EmployeeName NVARCHAR(100) = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @CompanyName NVARCHAR(20) NOT NULL,
    @Position NVARCHAR(30) = NULL,
    @Street NVARCHAR(50) NOT NULL,
    @City NVARCHAR(20) = NULL,
    @State NVARCHAR(50) = NULL,
    @ZipCode NVARCHAR(50) = NULL
AS
BEGIN
    -- Проверка условия наличия хотя бы одного непустого поля имени сотрудника
    IF (@EmployeeName IS NULL OR LTRIM(RTRIM(@EmployeeName)) = '')
        IF (@FirstName IS NULL OR LTRIM(RTRIM(@FirstName)) = '')
            IF (@LastName IS NULL OR LTRIM(RTRIM(@LastName)) = '')
                THROW 51000, 'At least one field (EmployeeName, FirstName, LastName) should not be NULL or empty.', 1;

    -- Обрезание значения поля CompanyName, если длина превышает 20 символов
    SET @CompanyName = LEFT(@CompanyName, 20);

    -- Вставка данных в таблицу Employee
    INSERT INTO Employee (AddressId, PersonId, CompanyName, Position, EmployeeName)
    VALUES ((SELECT Id FROM Address WHERE Street = @Street),
            (SELECT Id FROM Person WHERE (FirstName = @FirstName OR FirstName IS NULL) AND (LastName = @LastName OR LastName IS NULL)),
            @CompanyName, @Position, @EmployeeName);
END;
