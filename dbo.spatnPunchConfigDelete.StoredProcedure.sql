USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchConfigDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_PunchConfig]
  WHERE
  [ATN_PunchConfig].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
