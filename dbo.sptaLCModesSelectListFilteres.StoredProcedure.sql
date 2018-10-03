USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_LCModes].[ModeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_LCModes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ModeID' THEN '[TA_LCModes].[ModeID]'
                        WHEN 'ModeID DESC' THEN '[TA_LCModes].[ModeID] DESC'
                        WHEN 'ModeName' THEN '[TA_LCModes].[ModeName]'
                        WHEN 'ModeName DESC' THEN '[TA_LCModes].[ModeName] DESC'
                        WHEN 'OutOfSequence' THEN '[TA_LCModes].[OutOfSequence]'
                        WHEN 'OutOfSequence DESC' THEN '[TA_LCModes].[OutOfSequence] DESC'
                        WHEN 'Sequence' THEN '[TA_LCModes].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TA_LCModes].[Sequence] DESC'
                        WHEN 'UnderMilageClaim' THEN '[TA_LCModes].[UnderMilageClaim]'
                        WHEN 'UnderMilageClaim DESC' THEN '[TA_LCModes].[UnderMilageClaim] DESC'
                        ELSE '[TA_LCModes].[ModeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_LCModes].[ModeID] ,
		[TA_LCModes].[ModeName] ,
		[TA_LCModes].[OutOfSequence] ,
		[TA_LCModes].[Sequence] ,
		[TA_LCModes].[UnderMilageClaim]  
  FROM [TA_LCModes] 
      INNER JOIN #PageIndex
          ON [TA_LCModes].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
