USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsAutoCompleteList]
  @DF_ProjectID NVarChar(6),
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
  SET @LGSQL = @LGSQL + ' [TOS_CLPs].[CLPID]' 
  SET @LGSQL = @LGSQL + ',[TOS_CLPs].[ProjectID]' 
  SET @LGSQL = @LGSQL + ' FROM [TOS_CLPs] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([TOS_CLPs].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([TOS_CLPs].[CLPID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  IF (@DF_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND LOWER([TOS_CLPs].[ProjectID]) = ''' + LOWER(@DF_ProjectID) + ''''
  
  EXEC (@LGSQL)
  END
GO
