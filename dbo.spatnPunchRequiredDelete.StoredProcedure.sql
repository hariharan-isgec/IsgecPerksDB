USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredDelete]
  @Original_RecordID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_PunchRequired]
  WHERE
  [ATN_PunchRequired].[RecordID] = @Original_RecordID
  SET @RowCount = @@RowCount
GO
