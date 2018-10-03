USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCarriersInsert]
  @ShipmentModeID Int,
  @Description NVarChar(100),
  @Return_CarrierID Int = null OUTPUT 
  AS
  INSERT [ELOG_Carriers]
  (
   [ShipmentModeID]
  ,[Description]
  )
  VALUES
  (
   @ShipmentModeID
  ,@Description
  )
  SET @Return_CarrierID = Scope_Identity()
GO
