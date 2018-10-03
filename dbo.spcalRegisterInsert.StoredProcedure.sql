USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterInsert]
  @UserID NVarChar(8),
  @CallTypeID Int,
  @CallDescription NVarChar(500),
  @LoggedOn DateTime,
  @AttenderID NVarChar(8),
  @AttendedOn DateTime,
  @AttenderDescription NVarChar(500),
  @CallStatusID Int,
  @ClosedOn DateTime,
  @SignedOffOn DateTime,
  @FileAttached NVarChar(250),
  @FileExtention NVarChar(10),  
  @Return_CallID Int = null OUTPUT
  AS
  INSERT [CAL_Register]
  (
   [UserID]
  ,[CallTypeID]
  ,[CallDescription]
  ,[LoggedOn]
  ,[AttenderID]
  ,[AttendedOn]
  ,[AttenderDescription]
  ,[CallStatusID]
  ,[ClosedOn]
  ,[SignedOffOn]
	,[FileAttached]
	,[FileExtention]
  )
  VALUES
  (
   @UserID
  ,@CallTypeID
  ,@CallDescription
  ,@LoggedOn
  ,@AttenderID
  ,@AttendedOn
  ,@AttenderDescription
  ,@CallStatusID
  ,@ClosedOn
  ,@SignedOffOn
	,@FileAttached
	,@FileExtention
  )
  SET @Return_CallID = Scope_Identity()
GO
