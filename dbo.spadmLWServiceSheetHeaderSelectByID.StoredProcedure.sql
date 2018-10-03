USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWServiceSheetHeaderSelectByID]
  @SheetID Int 
  AS
  SELECT
		[ADM_ServiceSheetHeader].[SheetID],
		[ADM_ServiceSheetHeader].[SheetDate],
		[ADM_ServiceSheetHeader].[Description],
		[ADM_ServiceSheetHeader].[ServiceID],
		[ADM_ServiceSheetHeader].[ScheduleID],
		[ADM_ServiceSheetHeader].[Initiated],
		[ADM_ServiceSheetHeader].[Monitored],
		[ADM_ServiceSheetHeader].[ProblemIdentified],
		[ADM_ServiceSheetHeader].[Closed] 
  FROM [ADM_ServiceSheetHeader] 
  WHERE
  [ADM_ServiceSheetHeader].[SheetID] = @SheetID
GO
