USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LCModesSelectListFilteres]
  @Filter_CategoryID Int,
  @Filter_LCModeID Int,
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
  SET @LGSQL = @LGSQL + '[TA_D_LCModes].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_LCModes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_LCModes].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_LCModes] AS [TA_LCModes1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_LCModes].[LCModeID] = [TA_LCModes1].[ModeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_LCModes].[CategoryID] = ' + STR(@Filter_CategoryID)
  IF (@Filter_LCModeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_LCModes].[LCModeID] = ' + STR(@Filter_LCModeID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_LCModes].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_LCModes].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_D_LCModes].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_D_LCModes].[CategoryID] DESC'
                        WHEN 'LCModeID' THEN '[TA_D_LCModes].[LCModeID]'
                        WHEN 'LCModeID DESC' THEN '[TA_D_LCModes].[LCModeID] DESC'
                        WHEN 'EntitlementText' THEN '[TA_D_LCModes].[EntitlementText]'
                        WHEN 'EntitlementText DESC' THEN '[TA_D_LCModes].[EntitlementText] DESC'
                        WHEN 'FromDate' THEN '[TA_D_LCModes].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_LCModes].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_LCModes].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_LCModes].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_LCModes].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_LCModes].[Active] DESC'
                        WHEN 'TA_LCModes1_ModeName' THEN '[TA_LCModes1].[ModeName]'
                        WHEN 'TA_LCModes1_ModeName DESC' THEN '[TA_LCModes1].[ModeName] DESC'
                        ELSE '[TA_D_LCModes].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_LCModes].[SerialNo] ,
		[TA_D_LCModes].[CategoryID] ,
		[TA_D_LCModes].[LCModeID] ,
		[TA_D_LCModes].[EntitlementText] ,
		[TA_D_LCModes].[FromDate] ,
		[TA_D_LCModes].[TillDate] ,
		[TA_D_LCModes].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_LCModes1].[ModeName] AS TA_LCModes1_ModeName 
  FROM [TA_D_LCModes] 
      INNER JOIN #PageIndex
          ON [TA_D_LCModes].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LCModes].[CategoryID] = [TA_Categories1].[CategoryID]
  INNER JOIN [TA_LCModes] AS [TA_LCModes1]
    ON [TA_D_LCModes].[LCModeID] = [TA_LCModes1].[ModeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
