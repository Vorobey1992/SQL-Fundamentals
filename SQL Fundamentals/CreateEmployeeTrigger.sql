-- Создание триггера для таблицы Employees при вставке новой строки
CREATE TRIGGER CreateCompanyOnEmployeeInsert
ON Employees
AFTER INSERT
AS
BEGIN
    -- Проверка наличия корректного AddressId вставленной строки
    IF EXISTS (SELECT 1 FROM inserted WHERE AddressId IS NOT NULL)
    BEGIN
        -- Получение данных вставленного сотрудника
        DECLARE @EmployeeId INT, @AddressId INT, @CompanyName NVARCHAR(20), @Street NVARCHAR(50), @City NVARCHAR(20), @State NVARCHAR(50), @ZipCode NVARCHAR(50)

        SELECT @EmployeeId = Id, @AddressId = AddressId, @CompanyName = CompanyName, @Street = Street, @City = City, @State = State, @ZipCode = ZipCode
        FROM inserted

        -- Создание новой компании с тем же адресом
        DECLARE @NewCompanyId INT

        INSERT INTO Companies (Name, AddressId)
        SELECT @CompanyName, @AddressId
        WHERE NOT EXISTS (SELECT 1 FROM Companies WHERE AddressId = @AddressId)

        SET @NewCompanyId = SCOPE_IDENTITY()

        -- Обновление CompanyId вставленного сотрудника новым CompanyId
        UPDATE Employees
        SET CompanyId = @NewCompanyId
        WHERE Id = @EmployeeId
    END
END;
