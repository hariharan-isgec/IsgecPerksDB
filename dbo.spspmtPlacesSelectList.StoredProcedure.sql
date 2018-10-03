USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SPMT_Places].[PlaceID] ,
		[SPMT_Places].[Description]  
  FROM [SPMT_Places] 
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'PlaceID' THEN [SPMT_Places].[PlaceID] END,
     CASE @orderBy WHEN 'PlaceID DESC' THEN [SPMT_Places].[PlaceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_Places].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_Places].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
