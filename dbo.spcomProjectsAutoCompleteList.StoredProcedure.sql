USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomProjectsAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @FinanceCompany NVarChar(10) ='',
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
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  if(@FinanceCompany<>'')
	SET @LGSQL = @LGSQL + ' AND ISNULL([IDM_Projects].[FinanceCompany],''200'') = ''' + @FinanceCompany + ''''
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([IDM_Projects].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([IDM_Projects].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
