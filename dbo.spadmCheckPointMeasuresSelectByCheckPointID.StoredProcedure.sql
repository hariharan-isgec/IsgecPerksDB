USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCheckPointMeasuresSelectByCheckPointID]
  @CheckPointID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ADM_CheckPointMeasures].[CheckPointID],
		[ADM_CheckPointMeasures].[MeasureID],
		[ADM_CheckPoints1].[CheckPointID] AS ADM_CheckPoints1_CheckPointID,
		[ADM_CheckPoints1].[Descriptions] AS ADM_CheckPoints1_Descriptions,
		[ADM_Measures2].[MeasureID] AS ADM_Measures2_MeasureID,
		[ADM_Measures2].[Description] AS ADM_Measures2_Description,
		[ADM_Measures2].[MonitoringMechanism] AS ADM_Measures2_MonitoringMechanism 
  FROM [ADM_CheckPointMeasures] 
  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_CheckPointMeasures].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  INNER JOIN [ADM_Measures] AS [ADM_Measures2]
    ON [ADM_CheckPointMeasures].[MeasureID] = [ADM_Measures2].[MeasureID]
  WHERE
  [ADM_CheckPointMeasures].[CheckPointID] = @CheckPointID
  ORDER BY
     CASE @orderBy WHEN 'CheckPointID' THEN [ADM_CheckPointMeasures].[CheckPointID] END,
     CASE @orderBy WHEN 'CheckPointID DESC' THEN [ADM_CheckPointMeasures].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'MeasureID' THEN [ADM_CheckPointMeasures].[MeasureID] END,
     CASE @orderBy WHEN 'MeasureID DESC' THEN [ADM_CheckPointMeasures].[MeasureID] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID' THEN [ADM_CheckPoints1].[CheckPointID] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN [ADM_CheckPoints1].[CheckPointID] END DESC,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions' THEN [ADM_CheckPoints1].[Descriptions] END,
     CASE @orderBy WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN [ADM_CheckPoints1].[Descriptions] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_MeasureID' THEN [ADM_Measures2].[MeasureID] END,
     CASE @orderBy WHEN 'ADM_Measures2_MeasureID DESC' THEN [ADM_Measures2].[MeasureID] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_Description' THEN [ADM_Measures2].[Description] END,
     CASE @orderBy WHEN 'ADM_Measures2_Description DESC' THEN [ADM_Measures2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_Measures2_MonitoringMechanism' THEN [ADM_Measures2].[MonitoringMechanism] END,
     CASE @orderBy WHEN 'ADM_Measures2_MonitoringMechanism DESC' THEN [ADM_Measures2].[MonitoringMechanism] END DESC 
  SET @RecordCount = @@RowCount
GO
