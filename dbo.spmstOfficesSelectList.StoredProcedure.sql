USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstOfficesSelectList]
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
     CASE @orderBy WHEN 'OfficeID' THEN [HRM_Offices].[OfficeID] END,
     CASE @orderBy WHEN 'OfficeID DESC' THEN [HRM_Offices].[OfficeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Offices].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Offices].[Description] END DESC,
     CASE @orderBy WHEN 'Address' THEN [HRM_Offices].[Address] END,
     CASE @orderBy WHEN 'Address DESC' THEN [HRM_Offices].[Address] END DESC,
     CASE @orderBy WHEN 'City' THEN [HRM_Offices].[City] END,
     CASE @orderBy WHEN 'City DESC' THEN [HRM_Offices].[City] END DESC 
  SET @RecordCount = @@RowCount
GO
