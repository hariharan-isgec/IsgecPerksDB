USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesUpdate]
  @Original_InspectionStageID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_InspectionStages] SET 
   [Description] = @Description
  WHERE
  [InspectionStageID] = @Original_InspectionStageID
  SET @RowCount = @@RowCount
GO
