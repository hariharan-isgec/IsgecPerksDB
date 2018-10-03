USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTasksAutoCompleteList]
  @DF_ProjectID NVarChar(6),
  --@DF_TOSv_Parent6_ProjectID NVarChar(6),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [TOS_Tasks].[Description]' 
  SET @LGSQL = @LGSQL + ',[TOS_Tasks].[TaskID]' 
  SET @LGSQL = @LGSQL + ' FROM [TOS_Tasks] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([TOS_Tasks].[TaskID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([TOS_Tasks].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  IF (@DF_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND LOWER([TOS_Tasks].[ProjectID]) = ''' + LOWER(@DF_ProjectID) + ''''
  
  EXEC (@LGSQL)
  END
GO
