USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomEmployeesUpdate]
  @Original_CardNo NVarChar(8), 
  @CardNo NVarChar(8),
  @EmployeeName NVarChar(50),
  @C_DateOfJoining DateTime,
  @C_OfficeID Int,
  @C_DepartmentID NVarChar(6),
  @C_DesignationID Int,
  @ActiveState Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Employees] SET 
   [CardNo] = @CardNo
  ,[EmployeeName] = @EmployeeName
  ,[C_DateOfJoining] = @C_DateOfJoining
  ,[C_OfficeID] = @C_OfficeID
  ,[C_DepartmentID] = @C_DepartmentID
  ,[C_DesignationID] = @C_DesignationID
  ,[ActiveState] = @ActiveState
  WHERE
  [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
