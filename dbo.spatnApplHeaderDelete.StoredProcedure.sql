USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderDelete]
  @Original_LeaveApplID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_ApplHeader]
  WHERE
  [ATN_ApplHeader].[LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO
