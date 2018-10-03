USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMT_Vehicle].[VehicleID],
		[PMT_Vehicle].[Description] 
  FROM [PMT_Vehicle] 
  ORDER BY
     CASE @orderBy WHEN 'VehicleID' THEN [PMT_Vehicle].[VehicleID] END,
     CASE @orderBy WHEN 'VehicleID DESC' THEN [PMT_Vehicle].[VehicleID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Vehicle].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Vehicle].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
