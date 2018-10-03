USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_WorkingAreas].[WorkingAreaID],
		[HRM_WorkingAreas].[Description] 
  FROM [HRM_WorkingAreas] 
  ORDER BY
     CASE @orderBy WHEN 'WorkingAreaID' THEN [HRM_WorkingAreas].[WorkingAreaID] END,
     CASE @orderBy WHEN 'WorkingAreaID DESC' THEN [HRM_WorkingAreas].[WorkingAreaID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_WorkingAreas].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_WorkingAreas].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
