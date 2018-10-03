USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Status].[StatusID],
		[HRM_Status].[Description],
		[HRM_Status].[Sequence] 
  FROM [HRM_Status] 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [HRM_Status].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [HRM_Status].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Status].[Description] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [HRM_Status].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [HRM_Status].[Sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
