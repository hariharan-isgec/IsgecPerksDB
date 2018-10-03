USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_DocumentsAutoCompleteList]
  @LoginID NvarChar(8),
  @PRFilter Bit,
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [IDM_Documents].[DocumentID]' 
  SET @LGSQL = @LGSQL + ',[IDM_Documents].[ProjectID]' 
  SET @LGSQL = @LGSQL + ',[IDM_Documents].[RevisionNo]' 
  SET @LGSQL = @LGSQL + ' FROM [IDM_Documents] ' 
	SET @LGSQL = @LGSQL + ' WHERE ([IDM_Documents].[RevisionNo] = (SELECT MAX(RevisionNo) AS TEMP1 FROM IDM_Documents AS B WHERE ([B].[ProjectID] = [IDM_Documents].[ProjectID]) AND ([B].[DocumentID] = [IDM_Documents].[DocumentID])))  ' 
  IF (@PRFilter = 1)
		SET @LGSQL = @LGSQL + ' AND [IDM_Documents].[ProjectID] IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = ''' + @LoginID + ''') ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([IDM_Documents].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([IDM_Documents].[DocumentID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([IDM_Documents].[RevisionNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
