USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDepartmentsUpdate]
  @Original_DepartmentID NVarChar(6), 
  @Description NVarChar(30),
  @DepartmentHead NVarChar(8),
  @BusinessHead NVarChar(8),
  @DepartmentID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Departments] SET 
   [Description] = @Description
  ,[DepartmentHead] = @DepartmentHead
  ,[BusinessHead] = @BusinessHead
  ,[DepartmentID] = @DepartmentID
  WHERE
  [DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO
