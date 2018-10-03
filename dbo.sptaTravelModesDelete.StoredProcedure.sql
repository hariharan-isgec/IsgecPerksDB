USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesDelete]
  @Original_ModeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_TravelModes]
  WHERE
  [TA_TravelModes].[ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
