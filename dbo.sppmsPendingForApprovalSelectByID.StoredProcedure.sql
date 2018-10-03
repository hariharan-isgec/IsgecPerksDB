USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsPendingForApprovalSelectByID]
  @LoginID NVarChar(8),
  @FinYear NVarChar(4),
  @Apparaiser NVarChar(8) 
  AS
  SELECT
		[PMSv_PendingForApproval].[FinYear] ,
		[PMSv_PendingForApproval].[Apparaiser] ,
		[PMSv_PendingForApproval].[EmployeeName] ,
		[PMSv_PendingForApproval].[FormCount]  
  FROM [PMSv_PendingForApproval] 
  WHERE
  [PMSv_PendingForApproval].[FinYear] = @FinYear
  AND [PMSv_PendingForApproval].[Apparaiser] = @Apparaiser
GO
