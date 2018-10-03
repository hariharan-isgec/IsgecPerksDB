USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [PAK_IssueStatus].[Description]' 
  SET @LGSQL = @LGSQL + ',[PAK_IssueStatus].[IssueStatusID]' 
  SET @LGSQL = @LGSQL + ' FROM [PAK_IssueStatus] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PAK_IssueStatus].[IssueStatusID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PAK_IssueStatus].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
