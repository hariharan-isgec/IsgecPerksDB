USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesMonthlyBasicUpdate]
  @Original_RecordID Int, 
  @EmployeeID Int,
  @SalMonth Int,
  @SalYear Int,
  @NetBasic Decimal(10,2),
  @FinYear Int,
  @CategoryID Int,
  @PostedAt NVarChar(20),
  @VehicleType NVarChar(20),
  @ESI Bit,
  @ESIAmount Decimal(10,2),
  @MaintenanceAllowed Bit,
  @TWInSalary Bit,
  @MobileLimit Decimal(8),
  @MobileWithInternet Bit,
  @MobileBillPlanID Int,
  @LandlineLimit Decimal(8),
  @WithDriver Bit, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_EmployeesMonthlyBasic] SET 
   [EmployeeID] = @EmployeeID
  ,[SalMonth] = @SalMonth
  ,[SalYear] = @SalYear
  ,[NetBasic] = @NetBasic
  ,[FinYear] = @FinYear
  ,[CategoryID] = @CategoryID
  ,[PostedAt] = @PostedAt
  ,[VehicleType] = @VehicleType
  ,[ESI] = @ESI
  ,[ESIAmount] = @ESIAmount
  ,[MaintenanceAllowed] = @MaintenanceAllowed
  ,[TWInSalary] = @TWInSalary
  ,[MobileLimit] = @MobileLimit
  ,[MobileWithInternet] = @MobileWithInternet
  ,[MobileBillPlanID] = @MobileBillPlanID
  ,[LandlineLimit] = @LandlineLimit
  ,[WithDriver] = @WithDriver  
  WHERE
  [RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
