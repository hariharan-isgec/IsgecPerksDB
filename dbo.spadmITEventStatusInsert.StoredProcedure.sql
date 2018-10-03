USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventStatusInsert]
  @EventID Int,
  @ITServiceID NVarChar(15),
  @Return_EventID Int = null OUTPUT
  AS
  INSERT [ADM_ITEventStatus]
  (
   [EventID]
  ,[ITServiceID]
  )
  VALUES
  (
   @EventID
  ,@ITServiceID
  )
  SET @Return_EventID = @EventID
GO
