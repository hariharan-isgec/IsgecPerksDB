USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderAutoCompleteList]
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [DCM_CustomerTmtlHeader].[TmtlReference]' 
  SET @LGSQL = @LGSQL + ',[DCM_CustomerTmtlHeader].[TmtlID]' 
  SET @LGSQL = @LGSQL + ',[DCM_CustomerTmtlHeader].[ProjectID]' 
  SET @LGSQL = @LGSQL + ',[DCM_CustomerTmtlHeader].[CustomerID]' 
  SET @LGSQL = @LGSQL + ' FROM [DCM_CustomerTmtlHeader] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([DCM_CustomerTmtlHeader].[TmtlID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[CustomerID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[TmtlReference],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END
GO
