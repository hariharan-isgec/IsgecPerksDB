USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallTypesInsert]
  @CallTypeID NVarChar(20),
  @Description NVarChar(50),
  @Return_CallTypeID NVarChar(20) = null OUTPUT
  AS
  INSERT [ADM_CallTypes]
  (
   [CallTypeID]
  ,[Description]
  )
  VALUES
  (
   @CallTypeID
  ,@Description
  )
  SET @Return_CallTypeID = @CallTypeID
GO
