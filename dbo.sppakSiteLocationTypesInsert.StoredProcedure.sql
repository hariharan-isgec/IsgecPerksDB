USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesInsert]
  @Description NVarChar(50),
  @Return_LocationTypeID Int = null OUTPUT 
  AS
  INSERT [PAK_SiteLocationTypes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_LocationTypeID = Scope_Identity()
GO
