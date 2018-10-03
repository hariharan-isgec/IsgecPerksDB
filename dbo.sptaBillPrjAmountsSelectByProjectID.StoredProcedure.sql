USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsSelectByProjectID]
  @ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_BillPrjAmounts].[TABillNo] ,
		[TA_BillPrjAmounts].[ProjectID] ,
		[TA_BillPrjAmounts].[Percentage] ,
		[TA_BillPrjAmounts].[TotalAmountinINR] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TA_Bills2].[PurposeOfJourney] AS TA_Bills2_PurposeOfJourney 
  FROM [TA_BillPrjAmounts] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TA_BillPrjAmounts].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [TA_Bills] AS [TA_Bills2]
    ON [TA_BillPrjAmounts].[TABillNo] = [TA_Bills2].[TABillNo]
  WHERE
  [TA_BillPrjAmounts].[ProjectID] = @ProjectID
  ORDER BY
     CASE @OrderBy WHEN 'TABillNo' THEN [TA_BillPrjAmounts].[TABillNo] END,
     CASE @OrderBy WHEN 'TABillNo DESC' THEN [TA_BillPrjAmounts].[TABillNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [TA_BillPrjAmounts].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TA_BillPrjAmounts].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'Percentage' THEN [TA_BillPrjAmounts].[Percentage] END,
     CASE @OrderBy WHEN 'Percentage DESC' THEN [TA_BillPrjAmounts].[Percentage] END DESC,
     CASE @OrderBy WHEN 'TotalAmountinINR' THEN [TA_BillPrjAmounts].[TotalAmountinINR] END,
     CASE @OrderBy WHEN 'TotalAmountinINR DESC' THEN [TA_BillPrjAmounts].[TotalAmountinINR] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'TA_Bills2_PurposeOfJourney' THEN [TA_Bills2].[PurposeOfJourney] END,
     CASE @OrderBy WHEN 'TA_Bills2_PurposeOfJourney DESC' THEN [TA_Bills2].[PurposeOfJourney] END DESC 
  SET @RecordCount = @@RowCount
GO
