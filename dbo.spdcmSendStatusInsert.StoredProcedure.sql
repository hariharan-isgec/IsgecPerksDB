USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusInsert]
  @SendStatusID NVarChar(2),
  @Description NVarChar(30),
  @Return_SendStatusID NVarChar(2) = null OUTPUT
  AS
  INSERT [DCM_SendStatus]
  (
   [SendStatusID]
  ,[Description]
  )
  VALUES
  (
   @SendStatusID
  ,@Description
  )
  SET @Return_SendStatusID = @SendStatusID
GO
