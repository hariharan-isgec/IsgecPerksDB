USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Divisions].[DivisionID],
		[HRM_Divisions].[Description] 
  FROM [HRM_Divisions] 
  ORDER BY
     CASE @orderBy WHEN 'DivisionID' THEN [HRM_Divisions].[DivisionID] END,
     CASE @orderBy WHEN 'DivisionID DESC' THEN [HRM_Divisions].[DivisionID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Divisions].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Divisions].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
