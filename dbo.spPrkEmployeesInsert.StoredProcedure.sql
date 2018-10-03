USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesInsert]
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
  @Return_EmployeeID Int = null OUTPUT
  AS
  INSERT [PRK_Employees]
  (
   [EmployeeID]
  ,[CardNo]
  ,[EmployeeName]
  ,[CategoryID]
  ,[PostedAt]
  ,[VehicleType]
  ,[Basic]
  ,[ESI]
  ,[DOJ]
  ,[DOR]
  ,[Department]
  ,[Company]
  ,[MaintenanceAllowed]
  )
  VALUES
  (
   Convert(Int,@CardNo)
  ,@CardNo
  ,@EmployeeName
  ,@CategoryID
  ,@PostedAt
  ,@VehicleType
  ,@Basic
  ,@ESI
  ,@DOJ
  ,@DOR
  ,@Department
  ,@Company
  ,@MaintenanceAllowed
  )
  SET @Return_EmployeeID = Convert(Int,@CardNo)
GO
