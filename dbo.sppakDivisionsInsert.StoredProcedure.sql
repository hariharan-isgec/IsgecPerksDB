USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsInsert]
  @Description NVarChar(50),
  @Return_DivisionID Int = null OUTPUT 
  AS
  INSERT [PAK_Divisions]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_DivisionID = Scope_Identity()
GO
