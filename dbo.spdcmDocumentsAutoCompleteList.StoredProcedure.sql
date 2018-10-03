USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmDocumentsAutoCompleteList]
  @DF_ProjectID NVarChar(6),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [DCM_Documents].[DocumentID]' 
  SET @LGSQL = @LGSQL + ',[DCM_Documents].[RevisionNo]' 
  SET @LGSQL = @LGSQL + ',[DCM_Documents].[ProjectID]' 
  SET @LGSQL = @LGSQL + ' FROM [DCM_Documents] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([DCM_Documents].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_Documents].[DocumentID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_Documents].[RevisionNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  IF (@DF_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND LOWER([DCM_Documents].[ProjectID]) = ''' + LOWER(@DF_ProjectID) + ''''
  
  EXEC (@LGSQL)
  END
GO
