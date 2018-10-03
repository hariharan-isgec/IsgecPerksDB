USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDepartmentsUpdate]
  @Original_DepartmentID NVarChar(6), 
  @DepartmentID NVarChar(6),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Departments] SET 
   [DepartmentID] = @DepartmentID
  ,[Description] = @Description
  WHERE
  [DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO
