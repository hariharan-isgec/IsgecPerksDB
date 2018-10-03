USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_CityTypes].[CityTypeID] ,
		[TA_CityTypes].[CityTypeName]  
  FROM [TA_CityTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CityTypeID' THEN [TA_CityTypes].[CityTypeID] END,
     CASE @OrderBy WHEN 'CityTypeID DESC' THEN [TA_CityTypes].[CityTypeID] END DESC,
     CASE @OrderBy WHEN 'CityTypeName' THEN [TA_CityTypes].[CityTypeName] END,
     CASE @OrderBy WHEN 'CityTypeName DESC' THEN [TA_CityTypes].[CityTypeName] END DESC 
  SET @RecordCount = @@RowCount
GO
