USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDepartmentsAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Departments].[Description] + ' [' + 
        [HRM_Departments].[DepartmentID]
        + ']', [HRM_Departments].[DepartmentID] 
			FROM [HRM_Departments] 
      WHERE LOWER(Description) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Departments].[Description] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Departments].[Description] + ' [' + 
        [HRM_Departments].[DepartmentID]
        + ']', [HRM_Departments].[DepartmentID] 
			FROM [HRM_Departments] 
      WHERE DepartmentID >= @PREFIX 
			ORDER BY [HRM_Departments].[DepartmentID] 
	  END
GO
