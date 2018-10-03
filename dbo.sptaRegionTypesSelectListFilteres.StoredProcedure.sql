USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesSelectListFilteres]
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
 ,RegionTypeID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RegionTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_RegionTypes].[RegionTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_RegionTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RegionTypeID' THEN '[TA_RegionTypes].[RegionTypeID]'
                        WHEN 'RegionTypeID DESC' THEN '[TA_RegionTypes].[RegionTypeID] DESC'
                        WHEN 'RegionTypeName' THEN '[TA_RegionTypes].[RegionTypeName]'
                        WHEN 'RegionTypeName DESC' THEN '[TA_RegionTypes].[RegionTypeName] DESC'
                        ELSE '[TA_RegionTypes].[RegionTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_RegionTypes].[RegionTypeID] ,
		[TA_RegionTypes].[RegionTypeName]  
  FROM [TA_RegionTypes] 
      INNER JOIN #PageIndex
          ON [TA_RegionTypes].[RegionTypeID] = #PageIndex.RegionTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
