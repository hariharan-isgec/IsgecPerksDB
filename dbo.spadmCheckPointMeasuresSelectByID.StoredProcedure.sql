USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCheckPointMeasuresSelectByID]
  @CheckPointID Int,
  @MeasureID Int 
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
  AND [ADM_CheckPointMeasures].[MeasureID] = @MeasureID
GO
