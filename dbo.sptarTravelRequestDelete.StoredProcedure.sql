USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_TravelRequest]
  WHERE
  [TA_TravelRequest].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
