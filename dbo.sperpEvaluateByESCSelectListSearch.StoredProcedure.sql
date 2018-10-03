USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpEvaluateByESCSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @StatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ApplID Int NOT NULL
 ,RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplID, RequestID)
  SELECT [ERP_ChaneRequest].[ApplID], [ERP_ChaneRequest].[RequestID] FROM [ERP_ChaneRequest]
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
      [ERP_ChaneRequest].[StatusID] >= (@StatusID)
   AND ( 
         STR(ISNULL([ERP_ChaneRequest].[ApplID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ERP_ChaneRequest].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[RequestedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_ChaneRequest].[RequestTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[ChangeSubject],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[ChangeDetails],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_ChaneRequest].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[EvaluationByIT],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[EvaluationByESC],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[Justification],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[ReturnRemarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_ChaneRequest].[PriorityID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[MSLPortalNumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_ChaneRequest].[EffortEstimation], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_ChaneRequest].[ClosingRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ApplID' THEN [ERP_ChaneRequest].[ApplID] END,
     CASE @OrderBy WHEN 'ApplID DESC' THEN [ERP_ChaneRequest].[ApplID] END DESC,
     CASE @OrderBy WHEN 'RequestID' THEN [ERP_ChaneRequest].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [ERP_ChaneRequest].[RequestID] END DESC,
     CASE @OrderBy WHEN 'RequestedBy' THEN [ERP_ChaneRequest].[RequestedBy] END,
     CASE @OrderBy WHEN 'RequestedBy DESC' THEN [ERP_ChaneRequest].[RequestedBy] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [ERP_ChaneRequest].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [ERP_ChaneRequest].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'RequestTypeID' THEN [ERP_ChaneRequest].[RequestTypeID] END,
     CASE @OrderBy WHEN 'RequestTypeID DESC' THEN [ERP_ChaneRequest].[RequestTypeID] END DESC,
     CASE @OrderBy WHEN 'ChangeSubject' THEN [ERP_ChaneRequest].[ChangeSubject] END,
     CASE @OrderBy WHEN 'ChangeSubject DESC' THEN [ERP_ChaneRequest].[ChangeSubject] END DESC,
     CASE @OrderBy WHEN 'ChangeDetails' THEN [ERP_ChaneRequest].[ChangeDetails] END,
     CASE @OrderBy WHEN 'ChangeDetails DESC' THEN [ERP_ChaneRequest].[ChangeDetails] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [ERP_ChaneRequest].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [ERP_ChaneRequest].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'EvaluationByITOn' THEN [ERP_ChaneRequest].[EvaluationByITOn] END,
     CASE @OrderBy WHEN 'EvaluationByITOn DESC' THEN [ERP_ChaneRequest].[EvaluationByITOn] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [ERP_ChaneRequest].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ERP_ChaneRequest].[StatusID] END DESC,
     CASE @OrderBy WHEN 'EvaluationByIT' THEN [ERP_ChaneRequest].[EvaluationByIT] END,
     CASE @OrderBy WHEN 'EvaluationByIT DESC' THEN [ERP_ChaneRequest].[EvaluationByIT] END DESC,
     CASE @OrderBy WHEN 'ApprovedBy' THEN [ERP_ChaneRequest].[ApprovedBy] END,
     CASE @OrderBy WHEN 'ApprovedBy DESC' THEN [ERP_ChaneRequest].[ApprovedBy] END DESC,
     CASE @OrderBy WHEN 'EvaluationByESC' THEN [ERP_ChaneRequest].[EvaluationByESC] END,
     CASE @OrderBy WHEN 'EvaluationByESC DESC' THEN [ERP_ChaneRequest].[EvaluationByESC] END DESC,
     CASE @OrderBy WHEN 'EvaluationByESCOn' THEN [ERP_ChaneRequest].[EvaluationByESCOn] END,
     CASE @OrderBy WHEN 'EvaluationByESCOn DESC' THEN [ERP_ChaneRequest].[EvaluationByESCOn] END DESC,
     CASE @OrderBy WHEN 'Justification' THEN [ERP_ChaneRequest].[Justification] END,
     CASE @OrderBy WHEN 'Justification DESC' THEN [ERP_ChaneRequest].[Justification] END DESC,
     CASE @OrderBy WHEN 'ReturnRemarks' THEN [ERP_ChaneRequest].[ReturnRemarks] END,
     CASE @OrderBy WHEN 'ReturnRemarks DESC' THEN [ERP_ChaneRequest].[ReturnRemarks] END DESC,
     CASE @OrderBy WHEN 'PriorityID' THEN [ERP_ChaneRequest].[PriorityID] END,
     CASE @OrderBy WHEN 'PriorityID DESC' THEN [ERP_ChaneRequest].[PriorityID] END DESC,
     CASE @OrderBy WHEN 'MSLPortalNumber' THEN [ERP_ChaneRequest].[MSLPortalNumber] END,
     CASE @OrderBy WHEN 'MSLPortalNumber DESC' THEN [ERP_ChaneRequest].[MSLPortalNumber] END DESC,
     CASE @OrderBy WHEN 'MSLPortalOn' THEN [ERP_ChaneRequest].[MSLPortalOn] END,
     CASE @OrderBy WHEN 'MSLPortalOn DESC' THEN [ERP_ChaneRequest].[MSLPortalOn] END DESC,
     CASE @OrderBy WHEN 'EffortEstimation' THEN [ERP_ChaneRequest].[EffortEstimation] END,
     CASE @OrderBy WHEN 'EffortEstimation DESC' THEN [ERP_ChaneRequest].[EffortEstimation] END DESC,
     CASE @OrderBy WHEN 'PlannedDeliveryDate' THEN [ERP_ChaneRequest].[PlannedDeliveryDate] END,
     CASE @OrderBy WHEN 'PlannedDeliveryDate DESC' THEN [ERP_ChaneRequest].[PlannedDeliveryDate] END DESC,
     CASE @OrderBy WHEN 'ActualDeliveryDate' THEN [ERP_ChaneRequest].[ActualDeliveryDate] END,
     CASE @OrderBy WHEN 'ActualDeliveryDate DESC' THEN [ERP_ChaneRequest].[ActualDeliveryDate] END DESC,
     CASE @OrderBy WHEN 'ClosingRemarks' THEN [ERP_ChaneRequest].[ClosingRemarks] END,
     CASE @OrderBy WHEN 'ClosingRemarks DESC' THEN [ERP_ChaneRequest].[ClosingRemarks] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ERP_Applications3_ApplName' THEN [ERP_Applications3].[ApplName] END,
     CASE @OrderBy WHEN 'ERP_Applications3_ApplName DESC' THEN [ERP_Applications3].[ApplName] END DESC,
     CASE @OrderBy WHEN 'ERP_RequestPriority4_Description' THEN [ERP_RequestPriority4].[Description] END,
     CASE @OrderBy WHEN 'ERP_RequestPriority4_Description DESC' THEN [ERP_RequestPriority4].[Description] END DESC,
     CASE @OrderBy WHEN 'ERP_RequestStatus5_Description' THEN [ERP_RequestStatus5].[Description] END,
     CASE @OrderBy WHEN 'ERP_RequestStatus5_Description DESC' THEN [ERP_RequestStatus5].[Description] END DESC,
     CASE @OrderBy WHEN 'ERP_RequestTypes6_Description' THEN [ERP_RequestTypes6].[Description] END,
     CASE @OrderBy WHEN 'ERP_RequestTypes6_Description DESC' THEN [ERP_RequestTypes6].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_ChaneRequest].[ApplID] ,
		[ERP_ChaneRequest].[RequestID] ,
		[ERP_ChaneRequest].[RequestedBy] ,
		[ERP_ChaneRequest].[RequestedOn] ,
		[ERP_ChaneRequest].[RequestTypeID] ,
		[ERP_ChaneRequest].[ChangeSubject] ,
		[ERP_ChaneRequest].[ChangeDetails] ,
		[ERP_ChaneRequest].[ApprovedOn] ,
		[ERP_ChaneRequest].[EvaluationByITOn] ,
		[ERP_ChaneRequest].[StatusID] ,
		[ERP_ChaneRequest].[EvaluationByIT] ,
		[ERP_ChaneRequest].[ApprovedBy] ,
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
