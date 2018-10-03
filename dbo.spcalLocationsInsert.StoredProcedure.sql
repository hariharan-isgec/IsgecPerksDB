USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalLocationsInsert]
  @Descriptions NVarChar(30),
  @Return_LocationID Int = null OUTPUT
  AS
  INSERT [AST_Locations]
  (
   [Descriptions]
  )
  VALUES
  (
   @Descriptions
  )
  SET @Return_LocationID = Scope_Identity()
GO
