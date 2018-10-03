USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosParentAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [TOSv_Parent].[Description]' 
  SET @LGSQL = @LGSQL + ',[TOSv_Parent].[TaskID]' 
  SET @LGSQL = @LGSQL + ' FROM [TOSv_Parent] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([TOSv_Parent].[TaskID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([TOSv_Parent].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  IF (@DF_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND LOWER([TOSv_Parent].[ProjectID]) = ''' + LOWER(@DF_ProjectID) + ''''
  
  EXEC (@LGSQL)
  END
GO
