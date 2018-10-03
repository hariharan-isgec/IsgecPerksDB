USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusInsert]
  @SendStatusID NVarChar(3),
  @Description NVarChar(50),
  @ReceivedBack Bit,
  @IsItForApproval Bit,
  @Return_SendStatusID NVarChar(3) = null OUTPUT
  AS
  INSERT [IDM_SendStatus]
  (
   [SendStatusID]
  ,[Description]
  ,[ReceivedBack]
  ,[IsItForApproval]
  )
  VALUES
  (
   UPPER(@SendStatusID)
  ,@Description
  ,@ReceivedBack
  ,@IsItForApproval
  )
  SET @Return_SendStatusID = @SendStatusID
GO
