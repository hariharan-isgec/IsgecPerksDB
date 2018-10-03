USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_RegionTypes].[RegionTypeID] ,
		[TA_RegionTypes].[RegionTypeName]  
  FROM [TA_RegionTypes] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RegionTypeID' THEN [TA_RegionTypes].[RegionTypeID] END,
     CASE @OrderBy WHEN 'RegionTypeID DESC' THEN [TA_RegionTypes].[RegionTypeID] END DESC,
     CASE @OrderBy WHEN 'RegionTypeName' THEN [TA_RegionTypes].[RegionTypeName] END,
     CASE @OrderBy WHEN 'RegionTypeName DESC' THEN [TA_RegionTypes].[RegionTypeName] END DESC 
  SET @RecordCount = @@RowCount
GO
