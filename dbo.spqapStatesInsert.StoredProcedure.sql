USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesInsert]
  @QAPStatus NVarChar(50),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [QAP_States]
  (
   [QAPStatus]
  )
  VALUES
  (
   @QAPStatus
  )
  SET @Return_StatusID = Scope_Identity()
GO
