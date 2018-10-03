USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmReceiveStatusInsert]
  @ReceiveStatusID NVarChar(3),
  @Description NVarChar(50),
  @Return_ReceiveStatusID NVarChar(3) = null OUTPUT
  AS
  INSERT [IDM_ReceiveStatus]
  (
   [ReceiveStatusID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@ReceiveStatusID)
  ,@Description
  )
  SET @Return_ReceiveStatusID = @ReceiveStatusID
GO
