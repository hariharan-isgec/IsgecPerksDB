USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [HRM_OfficeLocation].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [HRM_Offices2].[Description] AS HRM_Offices2_Description 
  FROM [HRM_OfficeLocation] 
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices2]
    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'LocationID' THEN [HRM_OfficeLocation].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [HRM_OfficeLocation].[LocationID] END DESC,
     CASE @OrderBy WHEN 'OfficeID' THEN [HRM_OfficeLocation].[OfficeID] END,
     CASE @OrderBy WHEN 'OfficeID DESC' THEN [HRM_OfficeLocation].[OfficeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_OfficeLocation].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_OfficeLocation].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Locations1_Description' THEN [HRM_Locations1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Locations1_Description DESC' THEN [HRM_Locations1].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Offices2_Description' THEN [HRM_Offices2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Offices2_Description DESC' THEN [HRM_Offices2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
