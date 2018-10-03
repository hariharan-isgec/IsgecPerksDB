USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnLeaveTypesUpdate]
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
  @Original_LeaveTypeID NVarChar(2), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_LeaveTypes] SET 
   [Description] = @Description
  ,[OBALApplicable] = @OBALApplicable
  ,[OBALMonthly] = @OBALMonthly
  ,[OpeningBalance] = @OpeningBalance
  ,[CarryForward] = @CarryForward
  ,[ForwardToLeaveTypeID] = @ForwardToLeaveTypeID
  ,[AdvanceApplicable] = @AdvanceApplicable
  ,[SpecialSanctionRequired] = @SpecialSanctionRequired
  ,[SpecialSanctionBy] = @SpecialSanctionBy
  ,[Applyiable] = @Applyiable
  ,[Postable] = @Postable
  ,[PostedLeaveTypeID] = @PostedLeaveTypeID
  ,[Sequence] = @Sequence
  ,[MainType] = @MainType
  WHERE
  [LeaveTypeID] = @Original_LeaveTypeID
  SET @RowCount = @@RowCount
GO
