USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_LodgingSelectListFilteres]
  @Filter_CategoryID Int,
  @Filter_CityTypeID NVarChar(6),
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
  SET @LGSQL = @LGSQL + '[TA_D_Lodging].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_Lodging] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_Lodging].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_Lodging].[CityTypeID] = [TA_CityTypes2].[CityTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_Lodging].[CategoryID] = ' + STR(@Filter_CategoryID)
  IF (@Filter_CityTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_D_Lodging].[CityTypeID] = ''' + @Filter_CityTypeID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_Lodging].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_Lodging].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_D_Lodging].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_D_Lodging].[CategoryID] DESC'
                        WHEN 'CityTypeID' THEN '[TA_D_Lodging].[CityTypeID]'
                        WHEN 'CityTypeID DESC' THEN '[TA_D_Lodging].[CityTypeID] DESC'
                        WHEN 'LodgingAmount' THEN '[TA_D_Lodging].[LodgingAmount]'
                        WHEN 'LodgingAmount DESC' THEN '[TA_D_Lodging].[LodgingAmount] DESC'
                        WHEN 'FromDate' THEN '[TA_D_Lodging].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_Lodging].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_Lodging].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_Lodging].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_Lodging].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_Lodging].[Active] DESC'
                        WHEN 'TA_CityTypes2_CityTypeName' THEN '[TA_CityTypes2].[CityTypeName]'
                        WHEN 'TA_CityTypes2_CityTypeName DESC' THEN '[TA_CityTypes2].[CityTypeName] DESC'
                        ELSE '[TA_D_Lodging].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_Lodging].[SerialNo] ,
		[TA_D_Lodging].[CategoryID] ,
		[TA_D_Lodging].[CityTypeID] ,
		[TA_D_Lodging].[LodgingAmount] ,
		[TA_D_Lodging].[FromDate] ,
		[TA_D_Lodging].[TillDate] ,
		[TA_D_Lodging].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_CityTypes2].[CityTypeName] AS TA_CityTypes2_CityTypeName 
  FROM [TA_D_Lodging] 
      INNER JOIN #PageIndex
          ON [TA_D_Lodging].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_Lodging].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_CityTypes] AS [TA_CityTypes2]
    ON [TA_D_Lodging].[CityTypeID] = [TA_CityTypes2].[CityTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
