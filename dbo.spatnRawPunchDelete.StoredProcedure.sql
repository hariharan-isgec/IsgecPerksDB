USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnRawPunchDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_RawPunch]
  WHERE
  [ATN_RawPunch].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
