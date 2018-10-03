USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpChaneRequestSelectByID]
  @LoginID NVarChar(8),
  @ApplID Int,
  @RequestID Int 
  AS
  SELECT
		[ERP_ChaneRequest].[ApplID] ,
		[ERP_ChaneRequest].[RequestID] ,
		[ERP_ChaneRequest].[RequestedBy] ,
		[ERP_ChaneRequest].[RequestedOn] ,
		[ERP_ChaneRequest].[RequestTypeID] ,
		[ERP_ChaneRequest].[ChangeSubject] ,
		[ERP_ChaneRequest].[ChangeDetails] ,
		[ERP_ChaneRequest].[ReturnRemarks] ,
		[ERP_ChaneRequest].[ApprovedBy] ,
		[ERP_ChaneRequest].[ApprovedOn] ,
		[ERP_ChaneRequest].[EvaluationByIT] ,
		[ERP_ChaneRequest].[EvaluationByITOn] ,
		[ERP_ChaneRequest].[EvaluationByESC] ,
		[ERP_ChaneRequest].[EvaluationByESCOn] ,
		[ERP_ChaneRequest].[Justification] ,
		[ERP_ChaneRequest].[StatusID] ,
		[ERP_ChaneRequest].[PriorityID] ,
		[ERP_ChaneRequest].[MSLPortalNumber] ,
		[ERP_ChaneRequest].[MSLPortalOn] ,
		[ERP_ChaneRequest].[EffortEstimation] ,
		[ERP_ChaneRequest].[PlannedDeliveryDate] ,
		[ERP_ChaneRequest].[ActualDeliveryDate] ,
		[ERP_ChaneRequest].[ClosingRemarks] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[ERP_Applications3].[ApplName] AS ERP_Applications3_ApplName,
		[ERP_RequestPriority4].[Description] AS ERP_RequestPriority4_Description,
		[ERP_RequestStatus5].[Description] AS ERP_RequestStatus5_Description,
		[ERP_RequestTypes6].[Description] AS ERP_RequestTypes6_Description 
  FROM [ERP_ChaneRequest] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_ChaneRequest].[RequestedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_ChaneRequest].[ApprovedBy] = [aspnet_Users2].[LoginID]
  INNER JOIN [ERP_Applications] AS [ERP_Applications3]
    ON [ERP_ChaneRequest].[ApplID] = [ERP_Applications3].[ApplID]
  LEFT OUTER JOIN [ERP_RequestPriority] AS [ERP_RequestPriority4]
    ON [ERP_ChaneRequest].[PriorityID] = [ERP_RequestPriority4].[PriorityID]
  INNER JOIN [ERP_RequestStatus] AS [ERP_RequestStatus5]
    ON [ERP_ChaneRequest].[StatusID] = [ERP_RequestStatus5].[StatusID]
  INNER JOIN [ERP_RequestTypes] AS [ERP_RequestTypes6]
    ON [ERP_ChaneRequest].[RequestTypeID] = [ERP_RequestTypes6].[RequestTypeID]
  WHERE
  [ERP_ChaneRequest].[ApplID] = @ApplID
  AND [ERP_ChaneRequest].[RequestID] = @RequestID
GO
