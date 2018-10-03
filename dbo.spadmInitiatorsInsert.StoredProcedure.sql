USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorsInsert]
  @ServiceID NVarChar(10),
  @InitiatorID NVarChar(8),
  @Return_ServiceID NVarChar(10) = null OUTPUT
  AS
  INSERT [ADM_Initiators]
  (
   [ServiceID]
  ,[InitiatorID]
  )
  VALUES
  (
   @ServiceID
  ,@InitiatorID
  )
  SET @Return_ServiceID = @ServiceID
GO
