USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsUsersAutoCompleteList]
  @ActiveState Bit,
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [aspnet_Users].[UserFullName]' 
  SET @LGSQL = @LGSQL + ',[aspnet_Users].[LoginID]' 
  SET @LGSQL = @LGSQL + ' FROM [aspnet_Users] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([aspnet_Users].[LoginID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([aspnet_Users].[UserFullName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [aspnet_Users].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  
  EXEC (@LGSQL)
  END
GO
