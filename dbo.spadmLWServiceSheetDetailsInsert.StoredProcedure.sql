USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmLWServiceSheetDetailsInsert]
  @SheetID Int,
  @SheetDate DateTime,
  @ServiceID NVarChar(10),
  @ScheduleID NVarChar(20),
  @MeasureID Int,
  @CheckPointID Int,
  @Initiated Bit,
  @InitiatedBy NVarChar(8),
  @InitiatedOn DateTime,
  @InitiatorRemarks NVarChar(100),
  @MonitoredBy NVarChar(8),
  @Monitored Bit,
  @MonitoredOn DateTime,
  @MonitorRemarks NVarChar(100),
  @ProblemIdentified Bit,
  @ProblemClosed Bit,
  @ClosedBy NVarChar(8),
  @ClosedOn DateTime,
  @ClosingRemarks NVarChar(100),
  @CPInitiator NVarChar(8),
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [ADM_ServiceSheetDetails]
  (
   [SheetID]
  ,[SheetDate]
  ,[ServiceID]
  ,[ScheduleID]
  ,[MeasureID]
  ,[CheckPointID]
  ,[Initiated]
  ,[InitiatedBy]
  ,[InitiatedOn]
  ,[InitiatorRemarks]
  ,[MonitoredBy]
  ,[Monitored]
  ,[MonitoredOn]
  ,[MonitorRemarks]
  ,[ProblemIdentified]
  ,[ProblemClosed]
  ,[ClosedBy]
  ,[ClosedOn]
  ,[ClosingRemarks]
  ,[CPInitiator]
  )
  VALUES
  (
   @SheetID
  ,@SheetDate
  ,@ServiceID
  ,@ScheduleID
  ,@MeasureID
  ,@CheckPointID
  ,@Initiated
  ,@InitiatedBy
  ,@InitiatedOn
  ,@InitiatorRemarks
  ,@MonitoredBy
  ,@Monitored
  ,@MonitoredOn
  ,@MonitorRemarks
  ,@ProblemIdentified
  ,@ProblemClosed
  ,@ClosedBy
  ,@ClosedOn
  ,@ClosingRemarks
  ,@CPInitiator
  )
  SET @Return_SerialNo = Scope_Identity()
GO
