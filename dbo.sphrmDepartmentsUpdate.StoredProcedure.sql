USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDepartmentsUpdate]
  @Description NVarChar(30),
  @Original_DepartmentID NVarChar(6), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Departments] SET 
   [Description] = @Description
  WHERE
  [DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO
