USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesSelectListFilteres]
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
 ,LocationCountryID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LocationCountryID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_LocationCountries].[LocationCountryID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_LocationCountries] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationCountryID' THEN '[ELOG_LocationCountries].[LocationCountryID]'
                        WHEN 'LocationCountryID DESC' THEN '[ELOG_LocationCountries].[LocationCountryID] DESC'
                        WHEN 'Description' THEN '[ELOG_LocationCountries].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_LocationCountries].[Description] DESC'
                        ELSE '[ELOG_LocationCountries].[LocationCountryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_LocationCountries].*  
  FROM [ELOG_LocationCountries] 
      INNER JOIN #PageIndex
          ON [ELOG_LocationCountries].[LocationCountryID] = #PageIndex.LocationCountryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
