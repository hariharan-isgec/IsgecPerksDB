USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [PAK_SiteIssueD].[SiteMarkNo]' 
  SET @LGSQL = @LGSQL + ',[PAK_SiteIssueD].[ProjectID]' 
  SET @LGSQL = @LGSQL + ',[PAK_SiteIssueD].[IssueNo]' 
  SET @LGSQL = @LGSQL + ',[PAK_SiteIssueD].[IssueSrNo]' 
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteIssueD] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PAK_SiteIssueD].[IssueSrNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PAK_SiteIssueD].[SiteMarkNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([PAK_SiteIssueD].[IssueNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PAK_SiteIssueD].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
