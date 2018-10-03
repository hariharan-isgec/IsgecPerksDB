USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptos_LG_OTPProjectsAutoCompleteListForUser]
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
  SET @LGSQL = @LGSQL + ' [TOS_Projects].[Description]' 
  SET @LGSQL = @LGSQL + ',[TOS_Projects].[ProjectID]' 
  SET @LGSQL = @LGSQL + ' FROM [TOS_Projects] ' 
  SET @LGSQL = @LGSQL + ' WHERE [TOS_Projects].[ProjectID] IN  (SELECT PROJECTID FROM TOS_USERVIEWS WHERE (CLPVIEW = 1 OR OTPVIEW = 1) AND USERID=''' + @LoginID + ''') ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([TOS_Projects].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([TOS_Projects].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
