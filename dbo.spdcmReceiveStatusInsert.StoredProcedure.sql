USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusInsert]
  @ReceiveStatusID NVarChar(2),
  @Description NVarChar(30),
  @Return_ReceiveStatusID NVarChar(2) = null OUTPUT
  AS
  INSERT [DCM_ReceiveStatus]
  (
   [ReceiveStatusID]
  ,[Description]
  )
  VALUES
  (
   @ReceiveStatusID
  ,@Description
  )
  SET @Return_ReceiveStatusID = @ReceiveStatusID
GO
