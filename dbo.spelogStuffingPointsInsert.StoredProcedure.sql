USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsInsert]
  @Description NVarChar(50),
  @Return_StuffingPointID Int = null OUTPUT 
  AS
  INSERT [ELOG_StuffingPoints]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StuffingPointID = Scope_Identity()
GO
