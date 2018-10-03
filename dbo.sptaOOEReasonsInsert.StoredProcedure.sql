USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsInsert]
  @Description NVarChar(50),
  @Return_ReasonID Int = null OUTPUT 
  AS
  INSERT [TA_OOEReasons]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ReasonID = Scope_Identity()
GO
