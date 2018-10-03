USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresDelete]
  @Original_MeasureID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Measures]
  WHERE
  [ADM_Measures].[MeasureID] = @Original_MeasureID
  SET @RowCount = @@RowCount
GO
