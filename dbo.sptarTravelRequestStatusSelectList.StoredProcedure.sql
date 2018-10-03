USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [TA_TravelRequestStatus].*  
  FROM [TA_TravelRequestStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [TA_TravelRequestStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [TA_TravelRequestStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TA_TravelRequestStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TA_TravelRequestStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
