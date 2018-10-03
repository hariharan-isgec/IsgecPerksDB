USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastLocationsInsert]
  @Descriptions NVarChar(30),
  @LocationID Int = null OUTPUT
  AS
  INSERT [AST_Locations]
  (
   [Descriptions]
  )
  VALUES
  (
   @Descriptions
  )
  SET @LocationID = Scope_Identity()
GO
