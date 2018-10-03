USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkLedgerDelete]
  @Original_DocumentID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Ledger]
  WHERE
  [PRK_Ledger].[DocumentID] = @Original_DocumentID
  SET @RowCount = @@RowCount
GO
