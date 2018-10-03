USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistoryDelete]
  @Original_WFID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF1_PreOrder_History]
  WHERE
  [WF1_PreOrder_History].[WFID] = @Original_WFID
  SET @RowCount = @@RowCount
GO
