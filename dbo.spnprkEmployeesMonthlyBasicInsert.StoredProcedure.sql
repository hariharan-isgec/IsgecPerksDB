USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesMonthlyBasicInsert]
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
  @Return_RecordID Int = null OUTPUT 
  AS
  INSERT [PRK_EmployeesMonthlyBasic]
  (
   [EmployeeID]
  ,[SalMonth]
  ,[SalYear]
  ,[NetBasic]
  ,[FinYear]
  ,[CategoryID]
  ,[PostedAt]
  ,[VehicleType]
  ,[ESI]
  ,[ESIAmount]
  ,[MaintenanceAllowed]
  ,[TWInSalary]
  ,[MobileLimit]
  ,[MobileWithInternet]
  ,[MobileBillPlanID]
  ,[LandlineLimit]
  ,[WithDriver]
  ) 
  VALUES
  (
   @EmployeeID
  ,@SalMonth
  ,@SalYear
  ,@NetBasic
  ,@FinYear
  ,@CategoryID
  ,@PostedAt
  ,@VehicleType
  ,@ESI
  ,@ESIAmount
  ,@MaintenanceAllowed
  ,@TWInSalary
  ,@MobileLimit
  ,@MobileWithInternet
  ,@MobileBillPlanID
  ,@LandlineLimit
  ,@WithDriver 
  )
  SET @Return_RecordID = Scope_Identity()
GO
