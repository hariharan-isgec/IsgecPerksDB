USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spPrkEmployeesAutoCompleteList]
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[PRK_Employees].[EmployeeName] + ' [' + 
        [PRK_Employees].[CardNo]
        + ']', [PRK_Employees].[EmployeeID] 
			FROM [PRK_Employees] 
      WHERE LOWER(EmployeeName) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [PRK_Employees].[EmployeeName] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[PRK_Employees].[EmployeeName] + ' [' + 
        [PRK_Employees].[CardNo]
        + ']', [PRK_Employees].[EmployeeID] 
			FROM [PRK_Employees] 
      WHERE CardNo >= @PREFIX 
			ORDER BY [PRK_Employees].[CardNo] 
	  END
GO
