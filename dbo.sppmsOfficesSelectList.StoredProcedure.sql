USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsOfficesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Offices].[OfficeID] ,
		[HRM_Offices].[Description] ,
		[HRM_Offices].[Address] ,
		[HRM_Offices].[City]  
  FROM [HRM_Offices] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'OfficeID' THEN [HRM_Offices].[OfficeID] END,
     CASE @OrderBy WHEN 'OfficeID DESC' THEN [HRM_Offices].[OfficeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Offices].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Offices].[Description] END DESC,
     CASE @OrderBy WHEN 'Address' THEN [HRM_Offices].[Address] END,
     CASE @OrderBy WHEN 'Address DESC' THEN [HRM_Offices].[Address] END DESC,
     CASE @OrderBy WHEN 'City' THEN [HRM_Offices].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [HRM_Offices].[City] END DESC 
  SET @RecordCount = @@RowCount
GO
