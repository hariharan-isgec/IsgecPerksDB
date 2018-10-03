USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmLWITComplaintsSelectByID]
  @CallID Int 
  AS
  SELECT
		[ADM_ITComplaints].[CallID],
		[ADM_ITComplaints].[EndUserID],
		[ADM_ITComplaints].[CallTypeID],
		[ADM_ITComplaints].[Description],
		[ADM_ITComplaints].[AssignedTo],
		[ADM_ITComplaints].[CallStatusID],
		[ADM_ITComplaints].[LoggedOn],
		[ADM_ITComplaints].[LoggedBy],
		[ADM_ITComplaints].[FirstAttendedOn],
		[ADM_ITComplaints].[ClosedOn],
		[ADM_ITComplaints].[FirstAttended],
		[ADM_ITComplaints].[Closed] 
  FROM [ADM_ITComplaints] 
  WHERE
  [ADM_ITComplaints].[CallID] = @CallID
GO
