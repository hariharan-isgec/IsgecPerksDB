USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakItemsAutoCompleteList]
  @Root Bit,
  @DivisionID Int,
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
  SET @LGSQL = @LGSQL + ' [PAK_Items].[ItemDescription]' 
  SET @LGSQL = @LGSQL + ',[PAK_Items].[ItemNo]' 
  SET @LGSQL = @LGSQL + ' FROM [PAK_Items] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PAK_Items].[ItemNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([PAK_Items].[ItemDescription],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [PAK_Items].[Root] = ''' + CONVERT(NVarChar(10), @Root) + ''''
  SET @LGSQL = @LGSQL + ' AND [PAK_Items].[DivisionID] = ''' + STR(@DivisionID) + '''' 
  
  EXEC (@LGSQL)
  END
GO
