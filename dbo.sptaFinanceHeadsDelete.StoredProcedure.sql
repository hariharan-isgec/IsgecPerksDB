USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsDelete]
  @Original_FinanceHeadID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_FinanceHeads]
  WHERE
  [TA_FinanceHeads].[FinanceHeadID] = @Original_FinanceHeadID
  SET @RowCount = @@RowCount
GO
