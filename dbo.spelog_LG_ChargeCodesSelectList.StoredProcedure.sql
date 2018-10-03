USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spelog_LG_ChargeCodesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_ChargeCodes].* ,
    [ELOG_ChargeCategories1].[Description] AS ELOG_ChargeCategories1_Description 
  FROM [ELOG_ChargeCodes] 
  INNER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories1]
    ON [ELOG_ChargeCodes].[ChargeCategoryID] = [ELOG_ChargeCategories1].[ChargeCategoryID]
  WHERE [ELOG_ChargeCodes].[ChargeCategoryID] = @OrderBy  
  ORDER BY [ELOG_ChargeCodes].[Description]

  SET @RecordCount = @@RowCount
GO
