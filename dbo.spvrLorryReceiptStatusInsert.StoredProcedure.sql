USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusInsert]
  @Description NVarChar(50),
  @Return_LRStatusID Int = null OUTPUT 
  AS
  INSERT [VR_LorryReceiptStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_LRStatusID = Scope_Identity()
GO
