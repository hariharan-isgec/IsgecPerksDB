USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderInsert]
  @SheetDate DateTime,
  @Description NVarChar(50),
  @ServiceID NVarChar(10),
  @ScheduleID NVarChar(20),
  @Initiated Bit,
  @Monitored Bit,
  @ProblemIdentified Bit,
  @Closed Bit,
  @Return_SheetID Int = null OUTPUT
  AS
  INSERT [ADM_ServiceSheetHeader]
  (
   [SheetDate]
  ,[Description]
  ,[ServiceID]
  ,[ScheduleID]
  ,[Initiated]
  ,[Monitored]
  ,[ProblemIdentified]
  ,[Closed]
  )
  VALUES
  (
   @SheetDate
  ,@Description
  ,@ServiceID
  ,@ScheduleID
  ,@Initiated
  ,@Monitored
  ,@ProblemIdentified
  ,@Closed
  )
  SET @Return_SheetID = Scope_Identity()
GO
