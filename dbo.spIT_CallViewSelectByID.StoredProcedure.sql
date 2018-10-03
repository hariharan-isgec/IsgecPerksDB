USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIT_CallViewSelectByID]
  @LoginID NVarChar(8),
  @CallID Int 
  AS
  SELECT
		[IT_CallView].[CallID] ,
		[IT_CallView].[EndUserID] ,
		[IT_CallView].[EmployeeName] ,
		[IT_CallView].[DepartmentDescription] ,
		[IT_CallView].[Location] ,
		[IT_CallView].[CallTypeID] ,
		[IT_CallView].[CallDesc] ,
		[IT_CallView].[AssignedTo] ,
		[IT_CallView].[CallStatusID] ,
		[IT_CallView].[LoggedOn] ,
		[IT_CallView].[LoggedBy] ,
		[IT_CallView].[FirstAttendedOn] ,
		[IT_CallView].[ClosedOn] ,
		[IT_CallView].[FirstAttended] ,
		[IT_CallView].[Closed] ,
		[IT_CallView].[CallReceivedOn]  
  FROM [IT_CallView] 
  WHERE
  [IT_CallView].[CallID] = @CallID
GO
