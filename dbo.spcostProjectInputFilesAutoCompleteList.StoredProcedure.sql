USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [COST_ProjectInputFiles].[Description]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectInputFiles].[ProjectGroupID]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectInputFiles].[FinYear]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectInputFiles].[Quarter]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectInputFiles].[SerialNo]' 
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectInputFiles] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([COST_ProjectInputFiles].[ProjectGroupID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectInputFiles].[FinYear],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectInputFiles].[Quarter],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectInputFiles].[SerialNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([COST_ProjectInputFiles].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
