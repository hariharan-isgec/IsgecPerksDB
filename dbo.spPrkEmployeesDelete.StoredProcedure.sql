USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesDelete]
  @Original_EmployeeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Employees]
  WHERE
  [PRK_Employees].[EmployeeID] = @Original_EmployeeID
  SET @RowCount = @@RowCount
GO
