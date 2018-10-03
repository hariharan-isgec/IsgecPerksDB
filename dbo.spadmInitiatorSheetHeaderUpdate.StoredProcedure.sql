USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmInitiatorSheetHeaderUpdate]
  @Original_SheetID Int, 
  @SheetDate DateTime,
  @ServiceID NVarChar(10),
  @ScheduleID NVarChar(20),
  @Description NVarChar(50),
  @Initiated Bit,
  @Monitored Bit,
  @ProblemIdentified Bit,
  @Closed Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetHeader] SET 
   [SheetDate] = @SheetDate
  ,[ServiceID] = @ServiceID
  ,[ScheduleID] = @ScheduleID
  ,[Description] = @Description
  ,[Initiated] = @Initiated
  ,[Monitored] = @Monitored
  ,[ProblemIdentified] = @ProblemIdentified
  ,[Closed] = @Closed
  WHERE
  [SheetID] = @Original_SheetID
  SET @RowCount = @@RowCount
GO
