USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsDelete]
  @Original_LocationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_SiteLocations]
  WHERE
  [PAK_SiteLocations].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
