USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_Measures].[MeasureID],
		[ADM_Measures].[Description],
		[ADM_Measures].[MonitoringMechanism] 
  FROM [ADM_Measures] 
  ORDER BY
     CASE @orderBy WHEN 'MeasureID' THEN [ADM_Measures].[MeasureID] END,
     CASE @orderBy WHEN 'MeasureID DESC' THEN [ADM_Measures].[MeasureID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Measures].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Measures].[Description] END DESC,
     CASE @orderBy WHEN 'MonitoringMechanism' THEN [ADM_Measures].[MonitoringMechanism] END,
     CASE @orderBy WHEN 'MonitoringMechanism DESC' THEN [ADM_Measures].[MonitoringMechanism] END DESC 
  SET @RecordCount = @@RowCount
GO
