USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_FinanceHeads].[FinanceHeadID] ,
		[TA_FinanceHeads].[Description]  
  FROM [TA_FinanceHeads] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FinanceHeadID' THEN [TA_FinanceHeads].[FinanceHeadID] END,
     CASE @OrderBy WHEN 'FinanceHeadID DESC' THEN [TA_FinanceHeads].[FinanceHeadID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_FinanceHeads].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_FinanceHeads].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
