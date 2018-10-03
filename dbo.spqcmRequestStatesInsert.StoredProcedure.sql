USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesInsert]
  @StateID NVarChar(10),
  @Description NVarChar(50),
  @Return_StateID NVarChar(10) = null OUTPUT 
  AS
  INSERT [QCM_RequestStates]
  (
   [StateID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@StateID)
  ,@Description
  )
  SET @Return_StateID = @StateID
GO
