USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusDelete]
  @Original_PunchStatusID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_PunchStatus]
  WHERE
  [ATN_PunchStatus].[PunchStatusID] = @Original_PunchStatusID
  SET @RowCount = @@RowCount
GO
