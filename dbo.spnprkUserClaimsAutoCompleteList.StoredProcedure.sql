USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsAutoCompleteList]
  @CardNo NVarChar(8),
  @FinYear Int,
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
  SET @LGSQL = @LGSQL + ' [PRK_UserClaims].[Description]' 
  SET @LGSQL = @LGSQL + ',[PRK_UserClaims].[ClaimID]' 
  SET @LGSQL = @LGSQL + ' FROM [PRK_UserClaims] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PRK_UserClaims].[ClaimID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PRK_UserClaims].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [PRK_UserClaims].[CardNo] =( ''' + @CardNo + ''')'
  SET @LGSQL = @LGSQL + ' AND [PRK_UserClaims].[FinYear] = ''' + STR(@FinYear) + '''' 
  
  EXEC (@LGSQL)
  END
GO
