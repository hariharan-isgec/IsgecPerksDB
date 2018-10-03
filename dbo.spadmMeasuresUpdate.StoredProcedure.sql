USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresUpdate]
  @Original_MeasureID Int, 
  @Description NVarChar(100),
  @MonitoringMechanism NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_Measures] SET 
   [Description] = @Description
  ,[MonitoringMechanism] = @MonitoringMechanism
  WHERE
  [MeasureID] = @Original_MeasureID
  SET @RowCount = @@RowCount
GO
