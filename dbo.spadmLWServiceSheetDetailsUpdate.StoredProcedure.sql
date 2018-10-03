USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spadmLWServiceSheetDetailsUpdate]
  @Original_SheetID Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetDetails] SET 
   [SheetID] = @SheetID
  ,[SheetDate] = @SheetDate
  ,[ServiceID] = @ServiceID
  ,[ScheduleID] = @ScheduleID
  ,[MeasureID] = @MeasureID
  ,[CheckPointID] = @CheckPointID
  ,[Initiated] = @Initiated
  ,[InitiatedBy] = @InitiatedBy
  ,[InitiatedOn] = @InitiatedOn
  ,[InitiatorRemarks] = @InitiatorRemarks
  ,[MonitoredBy] = @MonitoredBy
  ,[Monitored] = @Monitored
  ,[MonitoredOn] = @MonitoredOn
  ,[MonitorRemarks] = @MonitorRemarks
  ,[ProblemIdentified] = @ProblemIdentified
  ,[ProblemClosed] = @ProblemClosed
  ,[ClosedBy] = @ClosedBy
  ,[ClosedOn] = @ClosedOn
  ,[ClosingRemarks] = @ClosingRemarks
  ,[CPInitiator] = @CPInitiator
  WHERE
  [SheetID] = @Original_SheetID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
