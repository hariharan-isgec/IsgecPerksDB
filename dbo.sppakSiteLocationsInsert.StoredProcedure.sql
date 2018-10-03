USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationsInsert]
  @LocationTypeID Int,
  @Description NVarChar(50),
  @GPSLocation NVarChar(50),
  @Return_LocationID Int = null OUTPUT 
  AS
  INSERT [PAK_SiteLocations]
  (
   [LocationTypeID]
  ,[Description]
  ,[GPSLocation]
  )
  VALUES
  (
   @LocationTypeID
  ,@Description
  ,@GPSLocation
  )
  SET @Return_LocationID = Scope_Identity()
GO
