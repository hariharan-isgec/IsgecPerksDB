USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportInsert]
  @Description NVarChar(50),
  @Return_ModeID Int = null OUTPUT 
  AS
  INSERT [SPMT_ModeOfTransport]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ModeID = Scope_Identity()
GO
