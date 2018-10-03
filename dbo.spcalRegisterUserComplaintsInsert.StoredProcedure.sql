USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterUserComplaintsInsert]
  @LoggedOn DateTime,
  @UserID NVarChar(8),
  @CallTypeID Int,
  @CallDescription NVarChar(500),
  @CallStatusID Int,
  @FileAttached NVarChar(250),
	@FileExtention NVarChar(10),
  @Return_CallID Int = null OUTPUT
  AS
  INSERT [CAL_Register]
  (
   [LoggedOn]
  ,[UserID]
  ,[CallTypeID]
  ,[CallDescription]
  ,[CallStatusID]
	,[FileAttached]
	,[FileExtention]
  )
  VALUES
  (
   @LoggedOn
  ,@UserID
  ,@CallTypeID
  ,@CallDescription
  ,@CallStatusID
	,@FileAttached
	,@FileExtention
  )
  SET @Return_CallID = Scope_Identity()
GO
