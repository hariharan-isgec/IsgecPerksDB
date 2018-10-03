USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsSelectByID]
  @LoginID NVarChar(8),
  @ExpenseHeadID Int 
  AS
  SELECT
		[TA_ExpenseHeads].[ExpenseHeadID] ,
		[TA_ExpenseHeads].[Description] ,
		[TA_ExpenseHeads].[OneTimeInTour] ,
		[TA_ExpenseHeads].[RequiresMDApproval]  
  FROM [TA_ExpenseHeads] 
  WHERE
  [TA_ExpenseHeads].[ExpenseHeadID] = @ExpenseHeadID
GO
