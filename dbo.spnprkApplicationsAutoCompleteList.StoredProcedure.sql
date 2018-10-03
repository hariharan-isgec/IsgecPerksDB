USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkApplicationsAutoCompleteList]
  @EmployeeID Int,
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [PRK_Applications].[UserRemark]' 
  SET @LGSQL = @LGSQL + ',[PRK_Applications].[ApplicationID]' 
  SET @LGSQL = @LGSQL + ',[PRK_Applications].[ClaimID]' 
  SET @LGSQL = @LGSQL + ' FROM [PRK_Applications] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PRK_Applications].[ApplicationID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PRK_Applications].[UserRemark],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([PRK_Applications].[ClaimID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[EmployeeID] = ''' + STR(@EmployeeID) + '''' 
  
  EXEC (@LGSQL)
  END
GO
