USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnNewAttendanceUpdate]
  @AttenDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @PunchStatusID NVarChar(2),
  @Punch9Time Decimal(6,2),
  @PunchValue Decimal(6,2),
  @NeedsRegularization Bit,
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
  @MannuallyCorrected Bit,
  @Destination NVarChar(50),
  @Purpose NVarChar(250),
  @ConfigID Int,
  @ConfigDetailID Int,
  @ConfigStatus NVarChar(2),
  @TSStatus NVarChar(2),
  @TSStatusBy NVarChar(8),
  @TSStatusOn DateTime,
  @HoliDay Bit,
  @Original_AttenID Int, 
	@SiteAttendance Bit, 
	@SiteAttendanceVerified Bit, 
	@SiteAttendanceVerifiedOn DateTime, 
	@SiteAttendanceVerifiedBy NVarChar(8),   
	@FirstPunchMachine NVarChar(100),   
	@SecondPunchMachine NVarChar(100),   
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_Attendance] SET 
   [AttenDate] = @AttenDate
  ,[CardNo] = @CardNo
  ,[Punch1Time] = @Punch1Time
  ,[Punch2Time] = @Punch2Time
  ,[PunchStatusID] = @PunchStatusID
  ,[Punch9Time] = @Punch9Time
  ,[PunchValue] = @PunchValue
  ,[NeedsRegularization] = @NeedsRegularization
  ,[Applied] = @Applied
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
  ,[MannuallyCorrected] = @MannuallyCorrected
  ,[Destination] = @Destination
  ,[Purpose] = @Purpose
  ,[ConfigID] = @ConfigID
  ,[ConfigDetailID] = @ConfigDetailID
  ,[ConfigStatus] = @ConfigStatus
  ,[TSStatus] = @TSStatus
  ,[TSStatusBy] = @TSStatusBy
  ,[TSStatusOn] = @TSStatusOn
  ,[HoliDay] = @HoliDay 
	,[SiteAttendance] = @SiteAttendance 
	,[SiteAttendanceVerified] = @SiteAttendanceVerified  
	,[SiteAttendanceVerifiedOn] = @SiteAttendanceVerifiedOn
	,[SiteAttendanceVerifiedBy] = @SiteAttendanceVerifiedBy   
	,[FirstPunchMachine] = @FirstPunchMachine   
	,[SecondPunchMachine] = @SecondPunchMachine   

  WHERE
  [AttenID] = @Original_AttenID
  SET @RowCount = @@RowCount
GO
