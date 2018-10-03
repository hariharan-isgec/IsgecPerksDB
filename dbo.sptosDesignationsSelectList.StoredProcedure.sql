USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosDesignationsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Designations].[DesignationID] ,
		[HRM_Designations].[Description] ,
		[HRM_Designations].[ShortName] ,
		[HRM_Designations].[Sequence]  
  FROM [HRM_Designations] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'DesignationID' THEN [HRM_Designations].[DesignationID] END,
     CASE @OrderBy WHEN 'DesignationID DESC' THEN [HRM_Designations].[DesignationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Designations].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Designations].[Description] END DESC,
     CASE @OrderBy WHEN 'ShortName' THEN [HRM_Designations].[ShortName] END,
     CASE @OrderBy WHEN 'ShortName DESC' THEN [HRM_Designations].[ShortName] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [HRM_Designations].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [HRM_Designations].[Sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
