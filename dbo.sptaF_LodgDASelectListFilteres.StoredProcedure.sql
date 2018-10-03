USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_LodgDASelectListFilteres]
  @Filter_CategoryID Int,
  @Filter_RegionID NVarChar(10),
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
  SET @LGSQL = @LGSQL + '[TA_F_LodgDA].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_F_LodgDA] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_F_LodgDA].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions1]'
  SET @LGSQL = @LGSQL + '    ON [TA_F_LodgDA].[RegionID] = [TA_Regions1].[RegionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_F_LodgDA].[CategoryID] = ' + STR(@Filter_CategoryID)
  IF (@Filter_RegionID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_F_LodgDA].[RegionID] = ''' + @Filter_RegionID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_F_LodgDA].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_F_LodgDA].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_F_LodgDA].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_F_LodgDA].[CategoryID] DESC'
                        WHEN 'RegionID' THEN '[TA_F_LodgDA].[RegionID]'
                        WHEN 'RegionID DESC' THEN '[TA_F_LodgDA].[RegionID] DESC'
                        WHEN 'Lodging' THEN '[TA_F_LodgDA].[Lodging]'
                        WHEN 'Lodging DESC' THEN '[TA_F_LodgDA].[Lodging] DESC'
                        WHEN 'DA' THEN '[TA_F_LodgDA].[DA]'
                        WHEN 'DA DESC' THEN '[TA_F_LodgDA].[DA] DESC'
                        WHEN 'FromDate' THEN '[TA_F_LodgDA].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_F_LodgDA].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_F_LodgDA].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_F_LodgDA].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_F_LodgDA].[Active]'
                        WHEN 'Active DESC' THEN '[TA_F_LodgDA].[Active] DESC'
                        WHEN 'TA_Regions1_RegionName' THEN '[TA_Regions1].[RegionName]'
                        WHEN 'TA_Regions1_RegionName DESC' THEN '[TA_Regions1].[RegionName] DESC'
                        ELSE '[TA_F_LodgDA].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_F_LodgDA].[SerialNo] ,
		[TA_F_LodgDA].[CategoryID] ,
		[TA_F_LodgDA].[RegionID] ,
		[TA_F_LodgDA].[Lodging] ,
		[TA_F_LodgDA].[DA] ,
		[TA_F_LodgDA].[FromDate] ,
		[TA_F_LodgDA].[TillDate] ,
		[TA_F_LodgDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Regions1].[RegionName] AS TA_Regions1_RegionName 
  FROM [TA_F_LodgDA] 
      INNER JOIN #PageIndex
          ON [TA_F_LodgDA].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_F_LodgDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Regions] AS [TA_Regions1]
    ON [TA_F_LodgDA].[RegionID] = [TA_Regions1].[RegionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
