USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaExpenseHeadsUpdate]
  @Original_ExpenseHeadID Int, 
  @Description NVarChar(50),
  @OneTimeInTour Bit,
  @RequiresMDApproval Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_ExpenseHeads] SET 
   [Description] = @Description
  ,[OneTimeInTour] = @OneTimeInTour
  ,[RequiresMDApproval] = @RequiresMDApproval
  WHERE
  [ExpenseHeadID] = @Original_ExpenseHeadID
  SET @RowCount = @@RowCount
GO
