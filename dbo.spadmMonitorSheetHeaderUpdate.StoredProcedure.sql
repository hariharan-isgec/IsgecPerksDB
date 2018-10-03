USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorSheetHeaderUpdate]
  @Original_SheetID Int, 
  @SheetDate DateTime,
  @ServiceID NVarChar(10),
  @ScheduleID NVarChar(20),
  @Description NVarChar(50),
  @Monitored Bit,
  @ProblemIdentified Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetHeader] SET 
   [SheetDate] = @SheetDate
  ,[ServiceID] = @ServiceID
  ,[ScheduleID] = @ScheduleID
  ,[Description] = @Description
  ,[Monitored] = @Monitored
  ,[ProblemIdentified] = @ProblemIdentified
  WHERE
  [SheetID] = @Original_SheetID
  SET @RowCount = @@RowCount
GO
