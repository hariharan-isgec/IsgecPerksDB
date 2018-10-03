USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmITRegisterComplaintInsert]
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @CallSubTypeID Int,
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
  @CallStatusID NVarChar(20),
  @LoggedOn DateTime,
  @LoggedBy NVarChar(8),
	@CallReceivedOn DateTime,
  @Return_CallID Int = null OUTPUT
  AS
  INSERT [ADM_ITComplaints]
  (
   [EndUserID]
  ,[CallTypeID]
  ,[CallSubTypeID]
  ,[Description]
  ,[AssignedTo]
  ,[CallStatusID]
  ,[LoggedOn]
  ,[LoggedBy]
  ,[CallReceivedOn]
)
  VALUES
  (
   @EndUserID
  ,@CallTypeID
  ,@CallSubTypeID
  ,@Description
  ,@AssignedTo
  ,@CallStatusID
  ,@LoggedOn
  ,@LoggedBy
	,@CallReceivedOn
  )
  SET @Return_CallID = Scope_Identity()
GO
