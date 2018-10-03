USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsSelectByID]
  @LoginID NVarChar(8),
  @LocationID Int 
  AS
  SELECT
    [PAK_SiteLocations].* ,
    [PAK_SiteLocationTypes1].[Description] AS PAK_SiteLocationTypes1_Description 
  FROM [PAK_SiteLocations] 
  INNER JOIN [PAK_SiteLocationTypes] AS [PAK_SiteLocationTypes1]
    ON [PAK_SiteLocations].[LocationTypeID] = [PAK_SiteLocationTypes1].[LocationTypeID]
  WHERE
  [PAK_SiteLocations].[LocationID] = @LocationID
GO
