USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesMonthlyBasicDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_EmployeesMonthlyBasic]
  WHERE
  [PRK_EmployeesMonthlyBasic].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
