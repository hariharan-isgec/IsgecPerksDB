USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusInsert]
  @Description NVarChar(30),
  @NextStatusID Int,
  @Return_AdviceStatusID Int = null OUTPUT 
  AS
  INSERT [SPMT_PAStatus]
  (
   [Description]
  ,[NextStatusID]
  )
  VALUES
  (
   @Description
  ,@NextStatusID
  )
  SET @Return_AdviceStatusID = Scope_Identity()
GO
