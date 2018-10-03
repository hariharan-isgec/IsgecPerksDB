USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogChargeCodesSelectByID]
  @LoginID NVarChar(8),
  @ChargeCategoryID Int,
  @ChargeCodeID Int 
  AS
  SELECT
    [ELOG_ChargeCodes].* ,
    [ELOG_ChargeCategories1].[Description] AS ELOG_ChargeCategories1_Description 
  FROM [ELOG_ChargeCodes] 
  INNER JOIN [ELOG_ChargeCategories] AS [ELOG_ChargeCategories1]
    ON [ELOG_ChargeCodes].[ChargeCategoryID] = [ELOG_ChargeCategories1].[ChargeCategoryID]
  WHERE
  [ELOG_ChargeCodes].[ChargeCategoryID] = @ChargeCategoryID
  AND [ELOG_ChargeCodes].[ChargeCodeID] = @ChargeCodeID
GO
