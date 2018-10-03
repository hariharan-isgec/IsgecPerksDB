USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPostedApplicationSelectByCardNo]
  @FinYear NVarChar(4),
  @AdvanceApplication Bit,
  @CardNo NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[PostingRemark],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[PostedBy],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[AdvanceApplication],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description 
  FROM [ATN_ApplHeader] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  WHERE
  [ATN_ApplHeader].[CardNo] = @CardNo
  AND [ATN_ApplHeader].[FinYear] = @FinYear
  AND [ATN_ApplHeader].[AdvanceApplication] = @AdvanceApplication
  ORDER BY
     CASE @orderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @orderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'PostingRemark' THEN [ATN_ApplHeader].[PostingRemark] END,
     CASE @orderBy WHEN 'PostingRemark DESC' THEN [ATN_ApplHeader].[PostingRemark] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [ATN_ApplHeader].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [ATN_ApplHeader].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [ATN_ApplHeader].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [ATN_ApplHeader].[PostedBy] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @orderBy WHEN 'AdvanceApplication' THEN [ATN_ApplHeader].[AdvanceApplication] END,
     CASE @orderBy WHEN 'AdvanceApplication DESC' THEN [ATN_ApplHeader].[AdvanceApplication] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID' THEN [ATN_ApplicationStatus2].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID DESC' THEN [ATN_ApplicationStatus2].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description' THEN [ATN_ApplicationStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description DESC' THEN [ATN_ApplicationStatus2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
