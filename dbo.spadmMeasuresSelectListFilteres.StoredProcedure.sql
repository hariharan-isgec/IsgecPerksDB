USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,MeasureID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MeasureID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_Measures].[MeasureID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_Measures] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MeasureID' THEN '[ADM_Measures].[MeasureID]'
                        WHEN 'MeasureID DESC' THEN '[ADM_Measures].[MeasureID] DESC'
                        WHEN 'Description' THEN '[ADM_Measures].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_Measures].[Description] DESC'
                        WHEN 'MonitoringMechanism' THEN '[ADM_Measures].[MonitoringMechanism]'
                        WHEN 'MonitoringMechanism DESC' THEN '[ADM_Measures].[MonitoringMechanism] DESC'
                        ELSE '[ADM_Measures].[MeasureID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_Measures].[MeasureID],
		[ADM_Measures].[Description],
		[ADM_Measures].[MonitoringMechanism] 
  FROM [ADM_Measures] 
    	INNER JOIN #PageIndex
          ON [ADM_Measures].[MeasureID] = #PageIndex.MeasureID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
