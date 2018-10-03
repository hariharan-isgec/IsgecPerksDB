USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ModeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ModeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_TravelModes].[ModeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_TravelModes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ModeID' THEN '[TA_TravelModes].[ModeID]'
                        WHEN 'ModeID DESC' THEN '[TA_TravelModes].[ModeID] DESC'
                        WHEN 'ModeName' THEN '[TA_TravelModes].[ModeName]'
                        WHEN 'ModeName DESC' THEN '[TA_TravelModes].[ModeName] DESC'
                        WHEN 'Sequence' THEN '[TA_TravelModes].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TA_TravelModes].[Sequence] DESC'
                        WHEN 'OutOfSequence' THEN '[TA_TravelModes].[OutOfSequence]'
                        WHEN 'OutOfSequence DESC' THEN '[TA_TravelModes].[OutOfSequence] DESC'
                        WHEN 'UnderMilageClaim' THEN '[TA_TravelModes].[UnderMilageClaim]'
                        WHEN 'UnderMilageClaim DESC' THEN '[TA_TravelModes].[UnderMilageClaim] DESC'
                        ELSE '[TA_TravelModes].[ModeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_TravelModes].[ModeID] ,
		[TA_TravelModes].[ModeName] ,
		[TA_TravelModes].[Sequence] ,
		[TA_TravelModes].[OutOfSequence] ,
		[TA_TravelModes].[UnderMilageClaim]  
  FROM [TA_TravelModes] 
      INNER JOIN #PageIndex
          ON [TA_TravelModes].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
