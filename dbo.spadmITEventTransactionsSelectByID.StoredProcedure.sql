USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventTransactionsSelectByID]
  @EventID Int 
  AS
  SELECT
		[ADM_ITEventTransactions].[EventID],
		[ADM_ITEventTransactions].[EventDate],
		[ADM_ITEventTransactions].[CardNo],
		[ADM_ITEventTransactions].[Description],
		[ADM_ITEventTransactions].[Completed],
		[ADM_ITEventTransactions].[CompletedOn],
		[ADM_ITEventTransactions].[Circular],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID 
  FROM [ADM_ITEventTransactions] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ADM_ITEventTransactions].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
  [ADM_ITEventTransactions].[EventID] = @EventID
GO
