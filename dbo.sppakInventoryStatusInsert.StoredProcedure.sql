USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusInsert]
  @Description NVarChar(50),
  @Return_InventoryStatusID Int = null OUTPUT 
  AS
  INSERT [PAK_InventoryStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_InventoryStatusID = Scope_Identity()
GO
