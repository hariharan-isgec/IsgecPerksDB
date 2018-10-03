USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDepartmentsDelete]
  @Original_DepartmentID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Departments]
  WHERE
  [HRM_Departments].[DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO
