USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveLedgerDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_LeaveLedger]
  WHERE
  [ATN_LeaveLedger].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
