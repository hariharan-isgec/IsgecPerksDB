USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spadm_LG_LWServiceSheetHeaderSelectByServiceDate]
  @SheetDate DateTime,
  @ServiceID NvarChar(10)   
  AS
  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID] 
  FROM [ADM_ServiceSheetHeader] 
  WHERE
  [ADM_ServiceSheetHeader].[ServiceID] = @ServiceID 
  AND [ADM_ServiceSheetHeader].[SheetDate] = @SheetDate
GO
