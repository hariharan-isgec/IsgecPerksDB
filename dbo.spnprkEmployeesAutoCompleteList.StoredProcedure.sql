USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkEmployeesAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 

  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)   

  SELECT TOP 10 [PRK_Employees].[EmployeeName], [PRK_Employees].[CardNo] FROM [PRK_Employees] 
  WHERE (LTRIM(ISNULL([PRK_Employees].[CardNo],0)) LIKE  @Prefix1 
          OR LOWER(ISNULL([PRK_Employees].[EmployeeName],'')) LIKE @Prefix1 )

  --DECLARE @Prefix1 VarChar(260)
  --SET @Prefix1 = LOWER(@Prefix) + '%'
  --DECLARE @LGSQL VarChar(8000)
  --SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  --SET @LGSQL = @LGSQL + ' [PRK_Employees].[EmployeeName]' 
  --SET @LGSQL = @LGSQL + ',[PRK_Employees].[EmployeeID]' 
  --SET @LGSQL = @LGSQL + ' FROM [PRK_Employees] ' 
  --SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  --SET @LGSQL = @LGSQL + ' AND (LTRIM(ISNULL([PRK_Employees].[CardNo],0)) LIKE ''' + @Prefix1 + ''''
  --SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PRK_Employees].[EmployeeName],'''')) LIKE ''' + @Prefix1 + ''''
  --SET @LGSQL = @LGSQL + ')' 
  
  --EXEC (@LGSQL)
  END
GO
