USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesInsert]
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
  @Return_EmployeeID Int = null OUTPUT 
  AS
  INSERT [PRK_Employees]
  (
   [EmployeeID]
  ,[CardNo]
  ,[EmployeeName]
  ,[CategoryID]
  ,[Basic]
  ,[DOJ]
  ,[DOR]
  ,[PostedAt]
  ,[VehicleType]
  ,[MaintenanceAllowed]
  ,[TWInSalary]
  ,[ESI]
  ,[Department]
  ,[Company]
  ,[MobileLimit]
  ,[MobileWithInternet]
  ,[MobileBillPlanID]
  ,[LandlineLimit]
  ,[VehicleOwnedByEmployee]
  ,[WithDriver]
  ,[Active]
  )
  VALUES
  (
   @EmployeeID
  ,@CardNo
  ,@EmployeeName
  ,@CategoryID
  ,@Basic
  ,@DOJ
  ,@DOR
  ,@PostedAt
  ,@VehicleType
  ,@MaintenanceAllowed
  ,@TWInSalary
  ,@ESI
  ,@Department
  ,@Company
  ,@MobileLimit
  ,@MobileWithInternet
  ,@MobileBillPlanID
  ,@LandlineLimit
  ,@VehicleOwnedByEmployee
  ,@WithDriver
  ,@Active
  )
  SET @Return_EmployeeID = @EmployeeID
GO
