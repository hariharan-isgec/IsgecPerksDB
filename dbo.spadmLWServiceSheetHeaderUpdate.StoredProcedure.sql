USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderUpdate]
  @Original_SheetID Int, 
  @SheetDate DateTime,
  @Description NVarChar(50),
  @ServiceID NVarChar(10),
  @ScheduleID NVarChar(20),
  @Initiated Bit,
  @Monitored Bit,
  @ProblemIdentified Bit,
  @Closed Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetHeader] SET 
   [SheetDate] = @SheetDate
  ,[Description] = @Description
  ,[ServiceID] = @ServiceID
  ,[ScheduleID] = @ScheduleID
  ,[Initiated] = @Initiated
  ,[Monitored] = @Monitored
  ,[ProblemIdentified] = @ProblemIdentified
  ,[Closed] = @Closed
  WHERE
  [SheetID] = @Original_SheetID
  SET @RowCount = @@RowCount
GO
