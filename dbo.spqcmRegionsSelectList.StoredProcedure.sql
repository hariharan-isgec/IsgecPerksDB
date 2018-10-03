USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_Regions].[RegionID] ,
		[QCM_Regions].[RegionName]  
  FROM [QCM_Regions] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RegionID' THEN [QCM_Regions].[RegionID] END,
     CASE @OrderBy WHEN 'RegionID DESC' THEN [QCM_Regions].[RegionID] END DESC,
     CASE @OrderBy WHEN 'RegionName' THEN [QCM_Regions].[RegionName] END,
     CASE @OrderBy WHEN 'RegionName DESC' THEN [QCM_Regions].[RegionName] END DESC 
  SET @RecordCount = @@RowCount
GO
