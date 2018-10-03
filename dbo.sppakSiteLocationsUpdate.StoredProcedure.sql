USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsUpdate]
  @Original_LocationID Int, 
  @LocationTypeID Int,
  @Description NVarChar(50),
  @GPSLocation NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteLocations] SET 
   [LocationTypeID] = @LocationTypeID
  ,[Description] = @Description
  ,[GPSLocation] = @GPSLocation
  WHERE
  [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
