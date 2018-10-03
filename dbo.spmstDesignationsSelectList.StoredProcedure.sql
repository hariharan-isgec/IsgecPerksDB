USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDesignationsSelectList]
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
     CASE @orderBy WHEN 'DesignationID' THEN [HRM_Designations].[DesignationID] END,
     CASE @orderBy WHEN 'DesignationID DESC' THEN [HRM_Designations].[DesignationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Designations].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Designations].[Description] END DESC,
     CASE @orderBy WHEN 'ShortName' THEN [HRM_Designations].[ShortName] END,
     CASE @orderBy WHEN 'ShortName DESC' THEN [HRM_Designations].[ShortName] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [HRM_Designations].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [HRM_Designations].[Sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
