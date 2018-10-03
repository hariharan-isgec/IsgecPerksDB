USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIAutoCompleteList]
  @VerifiedBy NVarChar(8),
  @FinYear NVarChar(4),
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
  SET @LGSQL = @LGSQL + ' [ATN_SABySI].[SiteName]' 
  SET @LGSQL = @LGSQL + ',[ATN_SABySI].[SerialNo]' 
  SET @LGSQL = @LGSQL + ' FROM [ATN_SABySI] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([ATN_SABySI].[SerialNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([ATN_SABySI].[SiteName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[VerifiedBy] =( ''' + @VerifiedBy + ''')'
  SET @LGSQL = @LGSQL + ' AND [ATN_SABySI].[FinYear] =( ''' + @FinYear + ''')'
  
  EXEC (@LGSQL)
  END
GO
