USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesInsert]
  @LeaveTypeID NVarChar(2),
  @Description NVarChar(30),
  @OBALApplicable Bit,
  @OBALMonthly Bit,
  @OpeningBalance Int,
  @CarryForward Bit,
  @ForwardToLeaveTypeID NVarChar(2),
  @AdvanceApplicable Bit,
  @SpecialSanctionRequired Bit,
  @SpecialSanctionBy NVarChar(8),
  @Applyiable Bit,
  @Postable Bit,
  @PostedLeaveTypeID NVarChar(2),
  @Sequence Int,
  @MainType Bit,
  @Return_LeaveTypeID NVarChar(2) = null OUTPUT
  AS
  INSERT [ATN_LeaveTypes]
  (
   [LeaveTypeID]
  ,[Description]
  ,[OBALApplicable]
  ,[OBALMonthly]
  ,[OpeningBalance]
  ,[CarryForward]
  ,[ForwardToLeaveTypeID]
  ,[AdvanceApplicable]
  ,[SpecialSanctionRequired]
  ,[SpecialSanctionBy]
  ,[Applyiable]
  ,[Postable]
  ,[PostedLeaveTypeID]
  ,[Sequence]
  ,[MainType]
  )
  VALUES
  (
   @LeaveTypeID
  ,@Description
  ,@OBALApplicable
  ,@OBALMonthly
  ,@OpeningBalance
  ,@CarryForward
  ,@ForwardToLeaveTypeID
  ,@AdvanceApplicable
  ,@SpecialSanctionRequired
  ,@SpecialSanctionBy
  ,@Applyiable
  ,@Postable
  ,@PostedLeaveTypeID
  ,@Sequence
  ,@MainType
  )
  SET @Return_LeaveTypeID = @LeaveTypeID
GO
