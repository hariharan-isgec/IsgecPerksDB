USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_ExpenseHeads].[ExpenseHeadID] ,
		[TA_ExpenseHeads].[Description] ,
		[TA_ExpenseHeads].[OneTimeInTour] ,
		[TA_ExpenseHeads].[RequiresMDApproval]  
  FROM [TA_ExpenseHeads] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ExpenseHeadID' THEN [TA_ExpenseHeads].[ExpenseHeadID] END,
     CASE @OrderBy WHEN 'ExpenseHeadID DESC' THEN [TA_ExpenseHeads].[ExpenseHeadID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_ExpenseHeads].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_ExpenseHeads].[Description] END DESC,
     CASE @OrderBy WHEN 'OneTimeInTour' THEN [TA_ExpenseHeads].[OneTimeInTour] END,
     CASE @OrderBy WHEN 'OneTimeInTour DESC' THEN [TA_ExpenseHeads].[OneTimeInTour] END DESC,
     CASE @OrderBy WHEN 'RequiresMDApproval' THEN [TA_ExpenseHeads].[RequiresMDApproval] END,
     CASE @OrderBy WHEN 'RequiresMDApproval DESC' THEN [TA_ExpenseHeads].[RequiresMDApproval] END DESC 
  SET @RecordCount = @@RowCount
GO
