USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_CalcMethod].[CalculationTypeID] ,
		[TA_CalcMethod].[CalculationDescription]  
  FROM [TA_CalcMethod] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CalculationTypeID' THEN [TA_CalcMethod].[CalculationTypeID] END,
     CASE @OrderBy WHEN 'CalculationTypeID DESC' THEN [TA_CalcMethod].[CalculationTypeID] END DESC,
     CASE @OrderBy WHEN 'CalculationDescription' THEN [TA_CalcMethod].[CalculationDescription] END,
     CASE @OrderBy WHEN 'CalculationDescription DESC' THEN [TA_CalcMethod].[CalculationDescription] END DESC 
  SET @RecordCount = @@RowCount
GO
