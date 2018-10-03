USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesInsert]
  @JoiningStateID NVarChar(2),
  @Description NVarChar(30),
  @Return_JoiningStateID NVarChar(2) = null OUTPUT
  AS
  INSERT [HRM_JoiningStates]
  (
   [JoiningStateID]
  ,[Description]
  )
  VALUES
  (
   @JoiningStateID
  ,@Description
  )
  SET @Return_JoiningStateID = @JoiningStateID
GO
