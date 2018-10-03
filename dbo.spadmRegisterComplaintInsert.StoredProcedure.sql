USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmRegisterComplaintInsert]
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
  @CallStatusID NVarChar(20),
  @LoggedOn DateTime,
  @LoggedBy NVarChar(8),
  @Return_CallID Int = null OUTPUT
  AS
  INSERT [ADM_Complaints]
  (
   [EndUserID]
  ,[CallTypeID]
  ,[Description]
  ,[AssignedTo]
  ,[CallStatusID]
  ,[LoggedOn]
  ,[LoggedBy]
  )
  VALUES
  (
   @EndUserID
  ,@CallTypeID
  ,@Description
  ,@AssignedTo
  ,@CallStatusID
  ,@LoggedOn
  ,@LoggedBy
  )
  SET @Return_CallID = Scope_Identity()
GO
