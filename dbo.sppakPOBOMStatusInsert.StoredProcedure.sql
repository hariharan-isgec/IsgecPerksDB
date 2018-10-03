USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMStatusInsert]
  @Description NVarChar(50),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [PAK_POBOMStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StatusID = Scope_Identity()
GO
