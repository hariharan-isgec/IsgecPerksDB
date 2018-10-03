USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_GuestHouseDASelectListFilteres]
  @Filter_CategoryID Int,
  @Filter_CityID NVarChar(30),
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
  SET @LGSQL = @LGSQL + '[TA_D_GuestHouseDA].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_D_GuestHouseDA] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_GuestHouseDA].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]'
  SET @LGSQL = @LGSQL + '    ON [TA_D_GuestHouseDA].[CityID] = [TA_Cities2].[CityID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_D_GuestHouseDA].[CategoryID] = ' + STR(@Filter_CategoryID)
  IF (@Filter_CityID > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_D_GuestHouseDA].[CityID] = ''' + @Filter_CityID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[TA_D_GuestHouseDA].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[TA_D_GuestHouseDA].[SerialNo] DESC'
                        WHEN 'CategoryID' THEN '[TA_D_GuestHouseDA].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_D_GuestHouseDA].[CategoryID] DESC'
                        WHEN 'CityID' THEN '[TA_D_GuestHouseDA].[CityID]'
                        WHEN 'CityID DESC' THEN '[TA_D_GuestHouseDA].[CityID] DESC'
                        WHEN 'OtherCity' THEN '[TA_D_GuestHouseDA].[OtherCity]'
                        WHEN 'OtherCity DESC' THEN '[TA_D_GuestHouseDA].[OtherCity] DESC'
                        WHEN 'DA' THEN '[TA_D_GuestHouseDA].[DA]'
                        WHEN 'DA DESC' THEN '[TA_D_GuestHouseDA].[DA] DESC'
                        WHEN 'FromDate' THEN '[TA_D_GuestHouseDA].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[TA_D_GuestHouseDA].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[TA_D_GuestHouseDA].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[TA_D_GuestHouseDA].[TillDate] DESC'
                        WHEN 'Active' THEN '[TA_D_GuestHouseDA].[Active]'
                        WHEN 'Active DESC' THEN '[TA_D_GuestHouseDA].[Active] DESC'
                        WHEN 'TA_Cities2_CityName' THEN '[TA_Cities2].[CityName]'
                        WHEN 'TA_Cities2_CityName DESC' THEN '[TA_Cities2].[CityName] DESC'
                        ELSE '[TA_D_GuestHouseDA].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_D_GuestHouseDA].[SerialNo] ,
		[TA_D_GuestHouseDA].[CategoryID] ,
		[TA_D_GuestHouseDA].[CityID] ,
		[TA_D_GuestHouseDA].[OtherCity] ,
		[TA_D_GuestHouseDA].[DA] ,
		[TA_D_GuestHouseDA].[FromDate] ,
		[TA_D_GuestHouseDA].[TillDate] ,
		[TA_D_GuestHouseDA].[Active] ,
		[TA_Categories1].[cmba] AS TA_Categories1_cmba,
		[TA_Cities2].[CityName] AS TA_Cities2_CityName 
  FROM [TA_D_GuestHouseDA] 
      INNER JOIN #PageIndex
          ON [TA_D_GuestHouseDA].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_GuestHouseDA].[CategoryID] = [TA_Categories1].[CategoryID]
  LEFT OUTER JOIN [TA_Cities] AS [TA_Cities2]
    ON [TA_D_GuestHouseDA].[CityID] = [TA_Cities2].[CityID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
