USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtDepartmentsSelectByID]
  @DepartmentID NVarChar(6) 
  AS
  SELECT
		[HRM_Departments].[DepartmentID],
		[HRM_Departments].[Description] 
  FROM [HRM_Departments] 
  WHERE
  [HRM_Departments].[DepartmentID] = @DepartmentID
GO
