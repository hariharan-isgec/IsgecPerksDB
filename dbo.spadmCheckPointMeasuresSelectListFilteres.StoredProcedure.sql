USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCheckPointMeasuresSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CheckPointID Int NOT NULL
 ,MeasureID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CheckPointID'  SET @LGSQL = @LGSQL + ', MeasureID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_CheckPointMeasures].[CheckPointID]'  SET @LGSQL = @LGSQL + ', [ADM_CheckPointMeasures].[MeasureID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_CheckPointMeasures] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_CheckPointMeasures].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_Measures] AS [ADM_Measures2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_CheckPointMeasures].[MeasureID] = [ADM_Measures2].[MeasureID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CheckPointID' THEN '[ADM_CheckPointMeasures].[CheckPointID]'
                        WHEN 'CheckPointID DESC' THEN '[ADM_CheckPointMeasures].[CheckPointID] DESC'
                        WHEN 'MeasureID' THEN '[ADM_CheckPointMeasures].[MeasureID]'
                        WHEN 'MeasureID DESC' THEN '[ADM_CheckPointMeasures].[MeasureID] DESC'
                        WHEN 'ADM_CheckPoints1_CheckPointID' THEN '[ADM_CheckPoints1].[CheckPointID]'
                        WHEN 'ADM_CheckPoints1_CheckPointID DESC' THEN '[ADM_CheckPoints1].[CheckPointID] DESC'
                        WHEN 'ADM_CheckPoints1_Descriptions' THEN '[ADM_CheckPoints1].[Descriptions]'
                        WHEN 'ADM_CheckPoints1_Descriptions DESC' THEN '[ADM_CheckPoints1].[Descriptions] DESC'
                        WHEN 'ADM_Measures2_MeasureID' THEN '[ADM_Measures2].[MeasureID]'
                        WHEN 'ADM_Measures2_MeasureID DESC' THEN '[ADM_Measures2].[MeasureID] DESC'
                        WHEN 'ADM_Measures2_Description' THEN '[ADM_Measures2].[Description]'
                        WHEN 'ADM_Measures2_Description DESC' THEN '[ADM_Measures2].[Description] DESC'
                        WHEN 'ADM_Measures2_MonitoringMechanism' THEN '[ADM_Measures2].[MonitoringMechanism]'
                        WHEN 'ADM_Measures2_MonitoringMechanism DESC' THEN '[ADM_Measures2].[MonitoringMechanism] DESC'
                        ELSE '[ADM_CheckPointMeasures].[CheckPointID],[ADM_CheckPointMeasures].[MeasureID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_CheckPointMeasures].[CheckPointID],
		[ADM_CheckPointMeasures].[MeasureID],
		[ADM_CheckPoints1].[CheckPointID] AS ADM_CheckPoints1_CheckPointID,
		[ADM_CheckPoints1].[Descriptions] AS ADM_CheckPoints1_Descriptions,
		[ADM_Measures2].[MeasureID] AS ADM_Measures2_MeasureID,
		[ADM_Measures2].[Description] AS ADM_Measures2_Description,
		[ADM_Measures2].[MonitoringMechanism] AS ADM_Measures2_MonitoringMechanism 
  FROM [ADM_CheckPointMeasures] 
    	INNER JOIN #PageIndex
          ON [ADM_CheckPointMeasures].[CheckPointID] = #PageIndex.CheckPointID
          AND [ADM_CheckPointMeasures].[MeasureID] = #PageIndex.MeasureID
  INNER JOIN [ADM_CheckPoints] AS [ADM_CheckPoints1]
    ON [ADM_CheckPointMeasures].[CheckPointID] = [ADM_CheckPoints1].[CheckPointID]
  INNER JOIN [ADM_Measures] AS [ADM_Measures2]
    ON [ADM_CheckPointMeasures].[MeasureID] = [ADM_Measures2].[MeasureID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
