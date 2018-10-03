USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWComplaintsSelectByID]
  @CallID Int 
  AS
  SELECT
		[ADM_Complaints].[CallID],
		[ADM_Complaints].[EndUserID],
		[ADM_Complaints].[CallTypeID],
		[ADM_Complaints].[Description],
		[ADM_Complaints].[AssignedTo],
		[ADM_Complaints].[CallStatusID],
		[ADM_Complaints].[LoggedOn],
		[ADM_Complaints].[LoggedBy],
		[ADM_Complaints].[FirstAttendedOn],
		[ADM_Complaints].[ClosedOn],
		[ADM_Complaints].[FirstAttended],
		[ADM_Complaints].[Closed] 
  FROM [ADM_Complaints] 
  WHERE
  [ADM_Complaints].[CallID] = @CallID
GO
