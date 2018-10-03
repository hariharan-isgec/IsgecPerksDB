USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [IDM_DocumentStatus].[Description]' 
  SET @LGSQL = @LGSQL + ',[IDM_DocumentStatus].[DocumentStatusID]' 
  SET @LGSQL = @LGSQL + ' FROM [IDM_DocumentStatus] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([IDM_DocumentStatus].[DocumentStatusID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([IDM_DocumentStatus].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
