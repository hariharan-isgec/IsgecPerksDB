USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomEmployeesAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 

  IF (@ByCode=1) 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Employees].[EmployeeName] + ' [' + [HRM_Employees].[CardNo] + ']' AS EmployeeName, 
        [HRM_Employees].[CardNo] 
			FROM [HRM_Employees] 
      WHERE LOWER(EmployeeName) LIKE LOWER(@PREFIX)+'%' 
			ORDER BY [HRM_Employees].[EmployeeName] 
	  END 
  ELSE 
		BEGIN 
			SELECT TOP (@Records) 
				[HRM_Employees].[EmployeeName] + ' [' + [HRM_Employees].[CardNo] + ']' AS EmployeeName, 
        [HRM_Employees].[CardNo] 
			FROM [HRM_Employees] 
      WHERE CardNo >= @PREFIX 
			ORDER BY [HRM_Employees].[CardNo] 
	  END 

----  BEGIN 
----  DECLARE @Prefix1 VarChar(260)
----  SET @Prefix1 = LOWER(@Prefix) + '%'
----  DECLARE @LGSQL VarChar(8000)
----  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
----  SET @LGSQL = @LGSQL + ' [HRM_Employees].[EmployeeName]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Employees].[CardNo]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Departments2].[Description]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Departments2].[DepartmentID]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Designations3].[Description]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Designations3].[DesignationID]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Offices1].[Description]' 
----  SET @LGSQL = @LGSQL + ',[HRM_Offices1].[OfficeID]' 
----  SET @LGSQL = @LGSQL + ' FROM [HRM_Employees] ' 
----  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
----  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([HRM_Employees].[CardNo],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Departments2].[DepartmentID],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Departments2].[Description],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([HRM_Designations3].[DesignationID],0))) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Designations3].[Description],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([HRM_Offices1].[OfficeID],0))) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([HRM_Offices1].[Description],'''')) LIKE ''' + @Prefix1 + ''''
----  SET @LGSQL = @LGSQL + ')' 
----  
----  EXEC (@LGSQL)
----  END
GO
