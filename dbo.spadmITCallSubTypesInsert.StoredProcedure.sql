USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesInsert]
  @CallTypeID NVarChar(20),
  @Description NVarChar(50),
  @Return_CallTypeID NVarChar(20) = null OUTPUT, 
  @Return_CallSubTypeID Int = null OUTPUT 
  AS
  INSERT [ADM_ITCallSubTypes]
  (
   [CallTypeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@CallTypeID)
  ,@Description
  )
  SET @Return_CallTypeID = @CallTypeID
  SET @Return_CallSubTypeID = Scope_Identity()
GO
