USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatnNewAttendanceInsert]
  @AttenDate DateTime,
  @CardNo NVarChar(8),
  @Punch1Time Decimal(6,2),
  @Punch2Time Decimal(6,2),
  @PunchStatusID NVarChar(2),
  @Punch9Time Decimal(6,2),
  @PunchValue Decimal(6,2),
  @NeedsRegularization Bit,
  @FinYear NVarChar(4),
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
	@SiteAttendance Bit, 
	@SiteAttendanceVerified Bit, 
	@SiteAttendanceVerifiedOn DateTime, 
	@SiteAttendanceVerifiedBy NVarChar(8),   
	@FirstPunchMachine NVarChar(100),   
	@SecondPunchMachine NVarChar(100),  
  @Return_AttenID Int = null OUTPUT
  AS
  BEGIN
  DECLARE @OfficeID int
  select @OfficeID = C_OfficeID from HRM_Employees where CardNo = @CardNo
  INSERT [ATN_Attendance]
  (
   [AttenDate]
  ,[CardNo]
  ,[Punch1Time]
  ,[Punch2Time]
  ,[PunchStatusID]
  ,[Punch9Time]
  ,[PunchValue]
  ,[NeedsRegularization]
  ,[FinYear]
  ,[Applied]
  ,[AppliedValue]
  ,[Applied1LeaveTypeID]
  ,[Applied2LeaveTypeID]
  ,[Posted]
  ,[Posted1LeaveTypeID]
  ,[Posted2LeaveTypeID]
  ,[ApplHeaderID]
  ,[ApplStatusID]
  ,[FinalValue]
  ,[AdvanceApplication]
  ,[MannuallyCorrected]
  ,[Destination]
  ,[Purpose]
  ,[ConfigID]
  ,[ConfigDetailID]
  ,[ConfigStatus]
  ,[TSStatus]
  ,[TSStatusBy]
  ,[TSStatusOn]
  ,[HoliDay] 
	,[SiteAttendance] 
	,[SiteAttendanceVerified] 
	,[SiteAttendanceVerifiedOn] 
	,[SiteAttendanceVerifiedBy]
	,[FirstPunchMachine]
	,[SecondPunchMachine]
  ,[OfficeID]     
  )
  VALUES
  (
   @AttenDate
  ,@CardNo
  ,@Punch1Time
  ,@Punch2Time
  ,@PunchStatusID
  ,@Punch9Time
  ,@PunchValue
  ,@NeedsRegularization
  ,@FinYear
  ,@Applied
  ,@AppliedValue
  ,@Applied1LeaveTypeID
  ,@Applied2LeaveTypeID
  ,@Posted
  ,@Posted1LeaveTypeID
  ,@Posted2LeaveTypeID
  ,@ApplHeaderID
  ,@ApplStatusID
  ,@FinalValue
  ,@AdvanceApplication
  ,@MannuallyCorrected
  ,@Destination
  ,@Purpose
  ,@ConfigID
  ,@ConfigDetailID
  ,@ConfigStatus
  ,@TSStatus
  ,@TSStatusBy
  ,@TSStatusOn
  ,@HoliDay
	,@SiteAttendance 
	,@SiteAttendanceVerified
	,@SiteAttendanceVerifiedOn
	,@SiteAttendanceVerifiedBy   
	,@FirstPunchMachine
	,@SecondPunchMachine
  ,@OfficeID     
  )
  SET @Return_AttenID = Scope_Identity()
 END
GO
