USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusInsert]
  @Description NVarChar(50),
  @Return_ReceiveStatusID Int = null OUTPUT 
  AS
  INSERT [PAK_ReceiveStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ReceiveStatusID = Scope_Identity()
GO
