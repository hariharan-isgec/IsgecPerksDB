USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesUpdate]
  @Original_EmployeeID Int, 
  @EmployeeID Int,
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(40),
  @CategoryID Int,
  @Basic Decimal(10,2),
  @DOJ DateTime,
  @DOR DateTime,
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @MaintenanceAllowed Bit,
  @TWInSalary Bit,
  @ESI Bit,
  @Department NVarChar(30),
  @Company NVarChar(50),
  @MobileLimit Decimal(8),
  @MobileWithInternet Bit,
  @MobileBillPlanID Int,
  @LandlineLimit Decimal(8),
  @VehicleOwnedByEmployee Bit, 
  @WithDriver Bit,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Employees] SET 
   [EmployeeID] = @EmployeeID
  ,[CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[CategoryID] = @CategoryID
  ,[Basic] = @Basic
  ,[DOJ] = @DOJ
  ,[DOR] = @DOR
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
  ,[MaintenanceAllowed] = @MaintenanceAllowed
  ,[TWInSalary] = @TWInSalary
  ,[ESI] = @ESI
  ,[Department] = @Department
  ,[Company] = @Company
  ,[MobileLimit] = @MobileLimit
  ,[MobileWithInternet] = @MobileWithInternet
  ,[MobileBillPlanID] = @MobileBillPlanID
  ,[LandlineLimit] = @LandlineLimit
  ,[VehicleOwnedByEmployee] = @VehicleOwnedByEmployee 
  ,[WithDriver] = @WithDriver  
  ,[Active] = @Active 
  WHERE
  [EmployeeID] = @Original_EmployeeID
  SET @RowCount = @@RowCount
GO
