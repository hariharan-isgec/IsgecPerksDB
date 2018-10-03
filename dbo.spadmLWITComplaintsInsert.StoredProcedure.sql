USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWITComplaintsInsert]
  @EndUserID NVarChar(8),
  @CallTypeID NVarChar(20),
  @Description NVarChar(250),
  @AssignedTo NVarChar(8),
  @CallStatusID NVarChar(20),
  @LoggedOn DateTime,
  @LoggedBy NVarChar(8),
  @FirstAttendedOn DateTime,
  @ClosedOn DateTime,
  @FirstAttended Bit,
  @Closed Bit,
  @Return_CallID Int = null OUTPUT
  AS
  INSERT [ADM_ITComplaints]
  (
   [EndUserID]
  ,[CallTypeID]
  ,[Description]
  ,[AssignedTo]
  ,[CallStatusID]
  ,[LoggedOn]
  ,[LoggedBy]
  ,[FirstAttendedOn]
  ,[ClosedOn]
  ,[FirstAttended]
  ,[Closed]
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
  ,@FirstAttendedOn
  ,@ClosedOn
  ,@FirstAttended
  ,@Closed
  )
  SET @Return_CallID = Scope_Identity()
GO
