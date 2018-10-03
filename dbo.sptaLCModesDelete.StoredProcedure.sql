USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesDelete]
  @Original_ModeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_LCModes]
  WHERE
  [TA_LCModes].[ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
