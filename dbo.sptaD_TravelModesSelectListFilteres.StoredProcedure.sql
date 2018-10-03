USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TravelModesSelectListFilteres]
  @Filter_CategoryID Int,
  @Filter_TravelModeID Int,
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_D_TravelModes].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_TravelModes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_TravelModes].[CategoryID] = ' + STR(@Filter_CategoryID)
  IF (@Filter_TravelModeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_TravelModes].[TravelModeID] = ' + STR(@Filter_TravelModeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_TravelModes].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_TravelModes].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_D_TravelModes].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_D_TravelModes].[CategoryID] DESC'
                        WHEN 'TravelModeID' THEN '[TA_D_TravelModes].[TravelModeID]'
                        WHEN 'TravelModeID DESC' THEN '[TA_D_TravelModes].[TravelModeID] DESC'
                        WHEN 'EntitlementText' THEN '[TA_D_TravelModes].[EntitlementText]'
                        WHEN 'EntitlementText DESC' THEN '[TA_D_TravelModes].[EntitlementText] DESC'
                        WHEN 'FromDate' THEN '[TA_D_TravelModes].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_TravelModes].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_TravelModes].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_TravelModes].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_TravelModes].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_TravelModes].[Active] DESC'
                        WHEN 'TA_TravelModes1_ModeName' THEN '[TA_TravelModes1].[ModeName]'
                        WHEN 'TA_TravelModes1_ModeName DESC' THEN '[TA_TravelModes1].[ModeName] DESC'
                        ELSE '[TA_D_TravelModes].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_TravelModes].[SerialNo] ,
		[TA_D_TravelModes].[CategoryID] ,
		[TA_D_TravelModes].[TravelModeID] ,
		[TA_D_TravelModes].[EntitlementText] ,
		[TA_D_TravelModes].[FromDate] ,
		[TA_D_TravelModes].[TillDate] ,
		[TA_D_TravelModes].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_TravelModes1].[ModeName] AS TA_TravelModes1_ModeName 
  FROM [TA_D_TravelModes] 
      INNER JOIN #PageIndex
          ON [TA_D_TravelModes].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_TravelModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_TravelModes] AS [TA_TravelModes1]
    ON [TA_D_TravelModes].[TravelModeID] = [TA_TravelModes1].[ModeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
