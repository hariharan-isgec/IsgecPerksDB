USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,LocationCountryID Int NOT NULL
  )
  INSERT INTO #PageIndex (LocationCountryID)
  SELECT [ELOG_LocationCountries].[LocationCountryID] FROM [ELOG_LocationCountries]
 WHERE  
   ( 
         STR(ISNULL([ELOG_LocationCountries].[LocationCountryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_LocationCountries].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'LocationCountryID' THEN [ELOG_LocationCountries].[LocationCountryID] END,
     CASE @OrderBy WHEN 'LocationCountryID DESC' THEN [ELOG_LocationCountries].[LocationCountryID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_LocationCountries].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_LocationCountries].[Description] END DESC 

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
