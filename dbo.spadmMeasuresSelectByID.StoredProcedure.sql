USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresSelectByID]
  @MeasureID Int 
  AS
  SELECT
		[ADM_Measures].[MeasureID],
		[ADM_Measures].[Description],
		[ADM_Measures].[MonitoringMechanism] 
  FROM [ADM_Measures] 
  WHERE
  [ADM_Measures].[MeasureID] = @MeasureID
GO
