USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesMonthlyBasicUpdate]
  @EmployeeID Int,
  @SalMonth Int,
  @SalYear Int,
  @NetBasic Decimal(10,2),
  @CategoryID Int,
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @ESI Bit,
  @ESIAmount Decimal(10,2),
  @MaintenanceAllowed Bit,
  @TWInSalary Bit,
  @Original_RecordID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_EmployeesMonthlyBasic] SET 
   [EmployeeID] = @EmployeeID
  ,[SalMonth] = @SalMonth
  ,[SalYear] = @SalYear
  ,[NetBasic] = @NetBasic
  ,[CategoryID] = @CategoryID
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
  ,[ESI] = @ESI
  ,[ESIAmount] = @ESIAmount
  ,[MaintenanceAllowed] = @MaintenanceAllowed
  ,[TWInSalary] = @TWInSalary  
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
