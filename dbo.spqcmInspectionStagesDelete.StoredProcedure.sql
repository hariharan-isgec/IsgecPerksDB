USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesDelete]
  @Original_InspectionStageID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_InspectionStages]
  WHERE
  [QCM_InspectionStages].[InspectionStageID] = @Original_InspectionStageID
  SET @RowCount = @@RowCount
GO
