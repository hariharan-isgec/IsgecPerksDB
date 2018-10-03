USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsInsert]
  @Description NVarChar(50),
  @Return_ReasonID Int = null OUTPUT 
  AS
  INSERT [VR_ODCReasons]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ReasonID = Scope_Identity()
GO
