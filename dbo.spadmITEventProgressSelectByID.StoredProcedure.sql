USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventProgressSelectByID]
  @EventID Int,
  @ITServiceID NVarChar(15) 
  AS
  SELECT
		[ADM_ITEventStatus].[EventID],
		[ADM_ITEventStatus].[ITServiceID],
		[ADM_ITEventStatus].[ActionNotRequired],
		[ADM_ITEventStatus].[ActionTaken],
		[ADM_ITEventStatus].[Responded],
		[ADM_ITEventStatus].[RespondedBy],
		[ADM_ITEventStatus].[RespondedOn],
		[ADM_ITEventStatus].[AlertedOn],
		[ADM_ITEventTransactions1].[EventID] AS ADM_ITEventTransactions1_EventID,
		[ADM_ITEventTransactions1].[EventDate] AS ADM_ITEventTransactions1_EventDate,
		[ADM_ITEventTransactions1].[CardNo] AS ADM_ITEventTransactions1_CardNo,
		[ADM_ITEventTransactions1].[Description] AS ADM_ITEventTransactions1_Description,
		[ADM_ITEventTransactions1].[Completed] AS ADM_ITEventTransactions1_Completed,
		[ADM_ITEventTransactions1].[CompletedOn] AS ADM_ITEventTransactions1_CompletedOn,
		[ADM_ITServices2].[ITServiceID] AS ADM_ITServices2_ITServiceID,
		[ADM_ITServices2].[Description] AS ADM_ITServices2_Description,
		[ADM_ITServices2].[AlertAfterDays] AS ADM_ITServices2_AlertAfterDays,
		[ADM_ITServices2].[EMailGroup] AS ADM_ITServices2_EMailGroup,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID 
  FROM [ADM_ITEventStatus] 
  INNER JOIN [ADM_ITEventTransactions] AS [ADM_ITEventTransactions1]
    ON [ADM_ITEventStatus].[EventID] = [ADM_ITEventTransactions1].[EventID]
  INNER JOIN [ADM_ITServices] AS [ADM_ITServices2]
    ON [ADM_ITEventStatus].[ITServiceID] = [ADM_ITServices2].[ITServiceID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ADM_ITEventStatus].[RespondedBy] = [HRM_Employees3].[CardNo]
  WHERE
  [ADM_ITEventStatus].[EventID] = @EventID
  AND [ADM_ITEventStatus].[ITServiceID] = @ITServiceID
GO
