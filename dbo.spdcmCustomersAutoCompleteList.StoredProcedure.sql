USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomersAutoCompleteList]
  @DF_ProjectID NVarChar(6),
  @Prefix NVarChar(50),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [DCM_Customers].[Description]' 
  SET @LGSQL = @LGSQL + ',[DCM_Customers].[CustomerID]' 
  SET @LGSQL = @LGSQL + ',[DCM_Customers].[ProjectID]' 
  SET @LGSQL = @LGSQL + ' FROM [DCM_Customers] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LOWER(ISNULL([DCM_Customers].[CustomerID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_Customers].[ProjectID],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([DCM_Customers].[Description],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR [DCM_Customers].[ProjectID] = ''' + @DF_ProjectID + ''''
  SET @LGSQL = @LGSQL + ')' 
  IF (@DF_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [DCM_Customers].[ProjectID] = ''' + @DF_ProjectID + ''''
  
  EXEC (@LGSQL)
  END
GO
