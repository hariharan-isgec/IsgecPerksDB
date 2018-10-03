USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCheckPointMeasuresDelete]
  @Original_CheckPointID Int,
  @Original_MeasureID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_CheckPointMeasures]
  WHERE
  [ADM_CheckPointMeasures].[CheckPointID] = @Original_CheckPointID
  AND [ADM_CheckPointMeasures].[MeasureID] = @Original_MeasureID
  SET @RowCount = @@RowCount
GO
