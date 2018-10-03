USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmNewEmployeesAutoCompleteList]
  @ActiveState Bit,
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Employees].[EmployeeName] + ' [' + 
        [HRM_Employees].[CardNo]
        + ']', [HRM_Employees].[CardNo] 
			FROM [HRM_Employees] 
      WHERE LOWER(EmployeeName) LIKE '%' + LOWER(@PREFIX)+'%' 
      AND [HRM_Employees].[ActiveState] = @ActiveState
			ORDER BY [HRM_Employees].[EmployeeName] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Employees].[EmployeeName] + ' [' + 
        [HRM_Employees].[CardNo]
        + ']', [HRM_Employees].[CardNo] 
			FROM [HRM_Employees] 
      WHERE CardNo >= @PREFIX 
      AND [HRM_Employees].[ActiveState] = @ActiveState
			ORDER BY [HRM_Employees].[CardNo] 
	  END
GO
