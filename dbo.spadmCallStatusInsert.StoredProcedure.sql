USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallStatusInsert]
  @CallStatusID NVarChar(20),
  @Description NVarChar(30),
  @Return_CallStatusID NVarChar(20) = null OUTPUT
  AS
  INSERT [ADM_CallStatus]
  (
   [CallStatusID]
  ,[Description]
  )
  VALUES
  (
   @CallStatusID
  ,@Description
  )
  SET @Return_CallStatusID = @CallStatusID
GO
