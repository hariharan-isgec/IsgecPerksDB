USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesInsert]
  @Description NVarChar(50),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [ELOG_IRBLStates]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_StatusID = Scope_Identity()
GO
