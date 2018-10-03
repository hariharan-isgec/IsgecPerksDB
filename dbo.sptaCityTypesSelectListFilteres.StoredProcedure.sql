USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesSelectListFilteres]
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
 ,CityTypeID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CityTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_CityTypes].[CityTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_CityTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CityTypeID' THEN '[TA_CityTypes].[CityTypeID]'
                        WHEN 'CityTypeID DESC' THEN '[TA_CityTypes].[CityTypeID] DESC'
                        WHEN 'CityTypeName' THEN '[TA_CityTypes].[CityTypeName]'
                        WHEN 'CityTypeName DESC' THEN '[TA_CityTypes].[CityTypeName] DESC'
                        ELSE '[TA_CityTypes].[CityTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_CityTypes].[CityTypeID] ,
		[TA_CityTypes].[CityTypeName]  
  FROM [TA_CityTypes] 
      INNER JOIN #PageIndex
          ON [TA_CityTypes].[CityTypeID] = #PageIndex.CityTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
