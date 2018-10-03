USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusDelete]
  @Original_ApplStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_ApplicationStatus]
  WHERE
  [ATN_ApplicationStatus].[ApplStatusID] = @Original_ApplStatusID
  SET @RowCount = @@RowCount
GO
