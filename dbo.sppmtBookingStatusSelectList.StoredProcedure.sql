USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBookingStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMT_BookingStatus].[StatusID],
		[PMT_BookingStatus].[Description] 
  FROM [PMT_BookingStatus] 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [PMT_BookingStatus].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_BookingStatus].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_BookingStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_BookingStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
