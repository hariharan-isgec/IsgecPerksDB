USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_ProcessPunch]
  WHERE
  [ATN_ProcessPunch].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
