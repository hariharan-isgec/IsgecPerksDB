USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsDelete]
  @Original_ExpenseHeadID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_ExpenseHeads]
  WHERE
  [TA_ExpenseHeads].[ExpenseHeadID] = @Original_ExpenseHeadID
  SET @RowCount = @@RowCount
GO
