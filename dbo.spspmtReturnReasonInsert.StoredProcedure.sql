USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonInsert]
  @Description NVarChar(50),
  @Return_ReasonID Int = null OUTPUT 
  AS
  INSERT [SPMT_ReturnReason]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ReasonID = Scope_Identity()
GO
