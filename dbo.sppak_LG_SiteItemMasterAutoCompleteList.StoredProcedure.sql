USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppak_LG_SiteItemMasterAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @ContextKey NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [PAK_SiteItemMaster].[ItemDescription]' 
  SET @LGSQL = @LGSQL + ',[PAK_SiteItemMaster].[ProjectID]' 
  SET @LGSQL = @LGSQL + ',[PAK_SiteItemMaster].[SiteMarkNo]' 
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteItemMaster] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND LOWER([PAK_SiteItemMaster].[ProjectID]) = ''' + @ContextKey + ''''
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([PAK_SiteItemMaster].[SiteMarkNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PAK_SiteItemMaster].[ItemDescription],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
