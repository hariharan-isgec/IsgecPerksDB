USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesSelectList]
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ChargeCategoryID' THEN [ELOG_ChargeCodes].[ChargeCategoryID] END,
     CASE @OrderBy WHEN 'ChargeCategoryID DESC' THEN [ELOG_ChargeCodes].[ChargeCategoryID] END DESC,
     CASE @OrderBy WHEN 'ChargeCodeID' THEN [ELOG_ChargeCodes].[ChargeCodeID] END,
     CASE @OrderBy WHEN 'ChargeCodeID DESC' THEN [ELOG_ChargeCodes].[ChargeCodeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_ChargeCodes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_ChargeCodes].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories1_Description' THEN [ELOG_ChargeCategories1].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ChargeCategories1_Description DESC' THEN [ELOG_ChargeCategories1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
