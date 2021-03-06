USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSTCPOLRDAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [PAK_POLineRecDoc].[SerialNo]' 
  SET @LGSQL = @LGSQL + ',[PAK_POLineRecDoc].[ItemNo]' 
  SET @LGSQL = @LGSQL + ',[PAK_POLineRecDoc].[UploadNo]' 
  SET @LGSQL = @LGSQL + ',[PAK_POLineRecDoc].[DocSerialNo]' 
  SET @LGSQL = @LGSQL + ' FROM [PAK_POLineRecDoc] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([PAK_POLineRecDoc].[SerialNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([PAK_POLineRecDoc].[ItemNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([PAK_POLineRecDoc].[UploadNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LTRIM(STR(ISNULL([PAK_POLineRecDoc].[DocSerialNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
