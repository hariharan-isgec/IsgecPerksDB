USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventTransactionsDelete]
  @Original_EventID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITEventTransactions]
  WHERE
  [ADM_ITEventTransactions].[EventID] = @Original_EventID
  SET @RowCount = @@RowCount
GO
