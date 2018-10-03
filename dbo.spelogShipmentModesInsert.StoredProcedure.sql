USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogShipmentModesInsert]
  @Description NVarChar(100),
  @Return_ShipmentModeID Int = null OUTPUT 
  AS
  INSERT [ELOG_ShipmentModes]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ShipmentModeID = Scope_Identity()
GO
