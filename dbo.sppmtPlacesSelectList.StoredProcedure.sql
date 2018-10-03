USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMT_Places].[PlaceID],
		[PMT_Places].[Description] 
  FROM [PMT_Places] 
  ORDER BY
     CASE @orderBy WHEN 'PlaceID' THEN [PMT_Places].[PlaceID] END,
     CASE @orderBy WHEN 'PlaceID DESC' THEN [PMT_Places].[PlaceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Places].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Places].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
