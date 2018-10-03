USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecutionStatesInsert]
  @Description NVarChar(20),
  @Return_ExecutionState Int = null OUTPUT
  AS
  INSERT [ATN_ExecutionStates]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ExecutionState = Scope_Identity()
GO
