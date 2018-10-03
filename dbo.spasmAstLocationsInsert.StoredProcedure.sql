USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsInsert]
  @LocationID NVarChar(20),
  @Description NVarChar(50),
  @Return_LocationID NVarChar(20) = null OUTPUT
  AS
  INSERT [ASM_AstLocations]
  (
   [LocationID]
  ,[Description]
  )
  VALUES
  (
   @LocationID
  ,@Description
  )
  SET @Return_LocationID = @LocationID
GO
