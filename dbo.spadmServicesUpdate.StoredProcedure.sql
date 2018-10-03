USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmServicesUpdate]
  @Original_ServiceID NVarChar(10), 
  @Description NVarChar(30),
  @OfficeID Int,
  @ScheduleID NVarChar(20),
  @LastSheetDate DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_Services] SET 
   [Description] = @Description
  ,[OfficeID] = @OfficeID
  ,[ScheduleID] = @ScheduleID
  ,[LastSheetDate] = @LastSheetDate
  WHERE
  [ServiceID] = @Original_ServiceID
  SET @RowCount = @@RowCount
GO
