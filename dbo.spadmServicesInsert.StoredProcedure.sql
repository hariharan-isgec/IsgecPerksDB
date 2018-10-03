USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesInsert]
  @ServiceID NVarChar(10),
  @Description NVarChar(30),
  @OfficeID Int,
  @ScheduleID NVarChar(20),
  @Return_ServiceID NVarChar(10) = null OUTPUT
  AS
  INSERT [ADM_Services]
  (
   [ServiceID]
  ,[Description]
  ,[OfficeID]
  ,[ScheduleID]
  )
  VALUES
  (
   @ServiceID
  ,@Description
  ,@OfficeID
  ,@ScheduleID
  )
  SET @Return_ServiceID = @ServiceID
GO
