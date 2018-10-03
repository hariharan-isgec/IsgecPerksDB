USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnewHrmEmployeesDelete]
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Employees]
  WHERE
  [HRM_Employees].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
