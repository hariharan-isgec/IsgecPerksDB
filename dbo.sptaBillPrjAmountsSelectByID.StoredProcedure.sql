USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsSelectByID]
  @LoginID NVarChar(8),
  @TABillNo Int,
  @ProjectID NVarChar(6) 
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
  [TA_BillPrjAmounts].[TABillNo] = @TABillNo
  AND [TA_BillPrjAmounts].[ProjectID] = @ProjectID
GO
