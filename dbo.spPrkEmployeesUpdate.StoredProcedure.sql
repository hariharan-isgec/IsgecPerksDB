USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesUpdate]
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(40),
  @CategoryID Int,
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @Basic Decimal(10,2),
  @ESI Bit,
  @DOJ DateTime,
  @DOR DateTime,
  @Department NVarChar(30),
  @Company NVarChar(50),
  @MaintenanceAllowed Bit,
  @TWInSalary Bit,   
  @Original_EmployeeID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Employees] SET 
   [CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[CategoryID] = @CategoryID
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
  ,[Basic] = @Basic
  ,[ESI] = @ESI
  ,[DOJ] = @DOJ
  ,[DOR] = @DOR
  ,[Department] = @Department
  ,[Company] = @Company
  ,[MaintenanceAllowed] = @MaintenanceAllowed
	,[TWInSalary] = @TWInSalary      
  WHERE
  [EmployeeID] = @Original_EmployeeID
  SET @RowCount = @@RowCount
GO
