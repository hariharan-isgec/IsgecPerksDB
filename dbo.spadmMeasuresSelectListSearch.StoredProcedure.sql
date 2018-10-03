USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMeasuresSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,MeasureID Int NOT NULL
  )
  INSERT INTO #PageIndex (MeasureID)
  SELECT [ADM_Measures].[MeasureID] FROM [ADM_Measures]
 WHERE  
   ( 
         STR(ISNULL([ADM_Measures].[MeasureID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Measures].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_Measures].[MonitoringMechanism],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'MeasureID' THEN [ADM_Measures].[MeasureID] END,
     CASE @orderBy WHEN 'MeasureID DESC' THEN [ADM_Measures].[MeasureID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_Measures].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_Measures].[Description] END DESC,
     CASE @orderBy WHEN 'MonitoringMechanism' THEN [ADM_Measures].[MonitoringMechanism] END,
     CASE @orderBy WHEN 'MonitoringMechanism DESC' THEN [ADM_Measures].[MonitoringMechanism] END DESC 

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
