USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsInsert]
  @Description NVarChar(50),
  @Return_LocationID Int = null OUTPUT 
  AS
  INSERT [HRM_Locations]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_LocationID = Scope_Identity()
GO
