USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApprovalByHODSelectListFilteres]
  @Filter_ApplID Int,
  @Filter_RequestedBy NVarChar(8),
  @Filter_RequestTypeID Int,
  @Filter_StatusID Int,
  @Filter_PriorityID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @StatusID Int,
  @ApprovedBy NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ApplID Int NOT NULL
 ,RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ApplID'
  SET @LGSQL = @LGSQL + ', RequestID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_ChaneRequest].[ApplID]'
  SET @LGSQL = @LGSQL + ', [ERP_ChaneRequest].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_ChaneRequest] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[RequestedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[ApprovedBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_Applications] AS [ERP_Applications3]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[ApplID] = [ERP_Applications3].[ApplID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ERP_RequestPriority] AS [ERP_RequestPriority4]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[PriorityID] = [ERP_RequestPriority4].[PriorityID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_RequestStatus] AS [ERP_RequestStatus5]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[StatusID] = [ERP_RequestStatus5].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_RequestTypes] AS [ERP_RequestTypes6]'
  SET @LGSQL = @LGSQL + '    ON [ERP_ChaneRequest].[RequestTypeID] = [ERP_RequestTypes6].[RequestTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[StatusID] >= ''' + STR(@StatusID) + '''' 
  SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[ApprovedBy] = (''' + @ApprovedBy + ''')'
  IF (@Filter_ApplID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[ApplID] = ' + STR(@Filter_ApplID)
  IF (@Filter_RequestedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[RequestedBy] = ''' + @Filter_RequestedBy + ''''
  IF (@Filter_RequestTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[RequestTypeID] = ' + STR(@Filter_RequestTypeID)
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[StatusID] = ' + STR(@Filter_StatusID)
  IF (@Filter_PriorityID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_ChaneRequest].[PriorityID] = ' + STR(@Filter_PriorityID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplID' THEN '[ERP_ChaneRequest].[ApplID]'
                        WHEN 'ApplID DESC' THEN '[ERP_ChaneRequest].[ApplID] DESC'
                        WHEN 'RequestID' THEN '[ERP_ChaneRequest].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[ERP_ChaneRequest].[RequestID] DESC'
                        WHEN 'RequestedBy' THEN '[ERP_ChaneRequest].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[ERP_ChaneRequest].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[ERP_ChaneRequest].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[ERP_ChaneRequest].[RequestedOn] DESC'
                        WHEN 'RequestTypeID' THEN '[ERP_ChaneRequest].[RequestTypeID]'
                        WHEN 'RequestTypeID DESC' THEN '[ERP_ChaneRequest].[RequestTypeID] DESC'
                        WHEN 'ChangeSubject' THEN '[ERP_ChaneRequest].[ChangeSubject]'
                        WHEN 'ChangeSubject DESC' THEN '[ERP_ChaneRequest].[ChangeSubject] DESC'
                        WHEN 'ChangeDetails' THEN '[ERP_ChaneRequest].[ChangeDetails]'
                        WHEN 'ChangeDetails DESC' THEN '[ERP_ChaneRequest].[ChangeDetails] DESC'
                        WHEN 'StatusID' THEN '[ERP_ChaneRequest].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[ERP_ChaneRequest].[StatusID] DESC'
                        WHEN 'ApprovedBy' THEN '[ERP_ChaneRequest].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[ERP_ChaneRequest].[ApprovedBy] DESC'
                        WHEN 'ApprovedOn' THEN '[ERP_ChaneRequest].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[ERP_ChaneRequest].[ApprovedOn] DESC'
                        WHEN 'EvaluationByIT' THEN '[ERP_ChaneRequest].[EvaluationByIT]'
                        WHEN 'EvaluationByIT DESC' THEN '[ERP_ChaneRequest].[EvaluationByIT] DESC'
                        WHEN 'EvaluationByITOn' THEN '[ERP_ChaneRequest].[EvaluationByITOn]'
                        WHEN 'EvaluationByITOn DESC' THEN '[ERP_ChaneRequest].[EvaluationByITOn] DESC'
                        WHEN 'EvaluationByESC' THEN '[ERP_ChaneRequest].[EvaluationByESC]'
                        WHEN 'EvaluationByESC DESC' THEN '[ERP_ChaneRequest].[EvaluationByESC] DESC'
                        WHEN 'EvaluationByESCOn' THEN '[ERP_ChaneRequest].[EvaluationByESCOn]'
                        WHEN 'EvaluationByESCOn DESC' THEN '[ERP_ChaneRequest].[EvaluationByESCOn] DESC'
                        WHEN 'Justification' THEN '[ERP_ChaneRequest].[Justification]'
                        WHEN 'Justification DESC' THEN '[ERP_ChaneRequest].[Justification] DESC'
                        WHEN 'ReturnRemarks' THEN '[ERP_ChaneRequest].[ReturnRemarks]'
                        WHEN 'ReturnRemarks DESC' THEN '[ERP_ChaneRequest].[ReturnRemarks] DESC'
                        WHEN 'PriorityID' THEN '[ERP_ChaneRequest].[PriorityID]'
                        WHEN 'PriorityID DESC' THEN '[ERP_ChaneRequest].[PriorityID] DESC'
                        WHEN 'MSLPortalNumber' THEN '[ERP_ChaneRequest].[MSLPortalNumber]'
                        WHEN 'MSLPortalNumber DESC' THEN '[ERP_ChaneRequest].[MSLPortalNumber] DESC'
                        WHEN 'MSLPortalOn' THEN '[ERP_ChaneRequest].[MSLPortalOn]'
                        WHEN 'MSLPortalOn DESC' THEN '[ERP_ChaneRequest].[MSLPortalOn] DESC'
                        WHEN 'EffortEstimation' THEN '[ERP_ChaneRequest].[EffortEstimation]'
                        WHEN 'EffortEstimation DESC' THEN '[ERP_ChaneRequest].[EffortEstimation] DESC'
                        WHEN 'PlannedDeliveryDate' THEN '[ERP_ChaneRequest].[PlannedDeliveryDate]'
                        WHEN 'PlannedDeliveryDate DESC' THEN '[ERP_ChaneRequest].[PlannedDeliveryDate] DESC'
                        WHEN 'ActualDeliveryDate' THEN '[ERP_ChaneRequest].[ActualDeliveryDate]'
                        WHEN 'ActualDeliveryDate DESC' THEN '[ERP_ChaneRequest].[ActualDeliveryDate] DESC'
                        WHEN 'ClosingRemarks' THEN '[ERP_ChaneRequest].[ClosingRemarks]'
                        WHEN 'ClosingRemarks DESC' THEN '[ERP_ChaneRequest].[ClosingRemarks] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'ERP_Applications3_ApplName' THEN '[ERP_Applications3].[ApplName]'
                        WHEN 'ERP_Applications3_ApplName DESC' THEN '[ERP_Applications3].[ApplName] DESC'
                        WHEN 'ERP_RequestPriority4_Description' THEN '[ERP_RequestPriority4].[Description]'
                        WHEN 'ERP_RequestPriority4_Description DESC' THEN '[ERP_RequestPriority4].[Description] DESC'
                        WHEN 'ERP_RequestStatus5_Description' THEN '[ERP_RequestStatus5].[Description]'
                        WHEN 'ERP_RequestStatus5_Description DESC' THEN '[ERP_RequestStatus5].[Description] DESC'
                        WHEN 'ERP_RequestTypes6_Description' THEN '[ERP_RequestTypes6].[Description]'
                        WHEN 'ERP_RequestTypes6_Description DESC' THEN '[ERP_RequestTypes6].[Description] DESC'
                        ELSE '[ERP_ChaneRequest].[ApplID],[ERP_ChaneRequest].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_ChaneRequest].[ApplID] ,
		[ERP_ChaneRequest].[RequestID] ,
		[ERP_ChaneRequest].[RequestedBy] ,
		[ERP_ChaneRequest].[RequestedOn] ,
		[ERP_ChaneRequest].[RequestTypeID] ,
		[ERP_ChaneRequest].[ChangeSubject] ,
		[ERP_ChaneRequest].[ChangeDetails] ,
		[ERP_ChaneRequest].[StatusID] ,
		[ERP_ChaneRequest].[ApprovedBy] ,
		[ERP_ChaneRequest].[ApprovedOn] ,
		[ERP_ChaneRequest].[EvaluationByIT] ,
		[ERP_ChaneRequest].[EvaluationByITOn] ,
		[ERP_ChaneRequest].[EvaluationByESC] ,
		[ERP_ChaneRequest].[EvaluationByESCOn] ,
		[ERP_ChaneRequest].[Justification] ,
		[ERP_ChaneRequest].[ReturnRemarks] ,
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
    	INNER JOIN #PageIndex
          ON [ERP_ChaneRequest].[ApplID] = #PageIndex.ApplID
          AND [ERP_ChaneRequest].[RequestID] = #PageIndex.RequestID
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
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
