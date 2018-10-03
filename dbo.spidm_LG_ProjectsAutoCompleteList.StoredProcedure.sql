USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidm_LG_ProjectsAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [IDM_Projects].[Description]' 
  SET @LGSQL = @LGSQL + ',[IDM_Projects].[ProjectID]' 
  SET @LGSQL = @LGSQL + ' FROM [IDM_Projects] ' 
  IF(@PRFilter=0)
		SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  ELSE
		SET @LGSQL = @LGSQL + ' WHERE [IDM_Projects].[ProjectID]  IN (SELECT PROJECTID FROM IDM_ProjectsByEmployee WHERE CardNo = ''' + @LoginID + ''') ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([IDM_Projects].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([IDM_Projects].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
