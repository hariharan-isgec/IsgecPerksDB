USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmUsersAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [aspnet_users].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_users].[UserName]' 
  SET @LGSQL = @LGSQL + ' FROM [aspnet_users] ' 
  SET @LGSQL = @LGSQL + ' WHERE [aspnet_users].[C_DepartmentID] = ''SYS'' ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([aspnet_users].[UserName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_users].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
