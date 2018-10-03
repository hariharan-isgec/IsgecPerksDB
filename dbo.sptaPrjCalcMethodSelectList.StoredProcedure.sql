USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_PrjCalcMethod].[ProjectCalcID] ,
		[TA_PrjCalcMethod].[Description]  
  FROM [TA_PrjCalcMethod] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectCalcID' THEN [TA_PrjCalcMethod].[ProjectCalcID] END,
     CASE @OrderBy WHEN 'ProjectCalcID DESC' THEN [TA_PrjCalcMethod].[ProjectCalcID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_PrjCalcMethod].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_PrjCalcMethod].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
