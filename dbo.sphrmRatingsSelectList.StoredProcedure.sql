USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Ratings].[RatingID],
		[HRM_Ratings].[Description],
		[HRM_Ratings].[sequence] 
  FROM [HRM_Ratings] 
  ORDER BY
     CASE @orderBy WHEN 'RatingID' THEN [HRM_Ratings].[RatingID] END,
     CASE @orderBy WHEN 'RatingID DESC' THEN [HRM_Ratings].[RatingID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Ratings].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Ratings].[Description] END DESC,
     CASE @orderBy WHEN 'sequence' THEN [HRM_Ratings].[sequence] END,
     CASE @orderBy WHEN 'sequence DESC' THEN [HRM_Ratings].[sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
