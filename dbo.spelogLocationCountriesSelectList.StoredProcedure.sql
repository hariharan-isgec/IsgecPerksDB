USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogLocationCountriesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_LocationCountries].*  
  FROM [ELOG_LocationCountries] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LocationCountryID' THEN [ELOG_LocationCountries].[LocationCountryID] END,
     CASE @OrderBy WHEN 'LocationCountryID DESC' THEN [ELOG_LocationCountries].[LocationCountryID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_LocationCountries].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_LocationCountries].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
