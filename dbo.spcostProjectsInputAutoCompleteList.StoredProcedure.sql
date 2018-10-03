USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [COST_ProjectsInput].[GroupOrderValueINR]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectsInput].[ProjectGroupID]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectsInput].[FinYear]' 
  SET @LGSQL = @LGSQL + ',[COST_ProjectsInput].[Quarter]' 
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectsInput] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([COST_ProjectsInput].[ProjectGroupID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectsInput].[FinYear],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectsInput].[Quarter],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([COST_ProjectsInput].[GroupOrderValueINR],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
