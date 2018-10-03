USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAttendanceUpdate]
  @Applied Bit,
  @AppliedValue Decimal(6,2),
  @Applied1LeaveTypeID NVarChar(2),
  @Applied2LeaveTypeID NVarChar(2),
  @Posted Bit,
  @Posted1LeaveTypeID NVarChar(2),
  @Posted2LeaveTypeID NVarChar(2),
  @ApplHeaderID Int,
  @ApplStatusID Int,
  @FinalValue Decimal(6,2),
  @AdvanceApplication Bit,
  @Destination NVarChar(50),
  @Purpose NVarChar(250),
  @Original_AttenID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_Attendance] SET 
   [Applied] = @Applied
  ,[AppliedValue] = @AppliedValue
  ,[Applied1LeaveTypeID] = @Applied1LeaveTypeID
  ,[Applied2LeaveTypeID] = @Applied2LeaveTypeID
  ,[Posted] = @Posted
  ,[Posted1LeaveTypeID] = @Posted1LeaveTypeID
  ,[Posted2LeaveTypeID] = @Posted2LeaveTypeID
  ,[ApplHeaderID] = @ApplHeaderID
  ,[ApplStatusID] = @ApplStatusID
  ,[FinalValue] = @FinalValue
  ,[AdvanceApplication] = @AdvanceApplication
  ,[Destination] = @Destination
  ,[Purpose] = @Purpose 
  WHERE
  [AttenID] = @Original_AttenID
  SET @RowCount = @@RowCount
GO
