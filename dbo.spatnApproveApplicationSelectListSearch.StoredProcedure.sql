USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproveApplicationSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplStatusID Int,
  @ApprovedBy NVarChar(8),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveApplID Int NOT NULL
  )
  INSERT INTO #PageIndex (LeaveApplID)
  SELECT [ATN_ApplHeader].[LeaveApplID] FROM [ATN_ApplHeader]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus3]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus3].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees4].[CardNo]
 WHERE  
      [ATN_ApplHeader].[ApplStatusID] = @ApplStatusID
  AND [ATN_ApplHeader].[ApprovedBy] = @ApprovedBy
  AND [ATN_ApplHeader].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerifiedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovalRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees4].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees4].[EmployeeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @orderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'VerifiedBy' THEN [ATN_ApplHeader].[VerifiedBy] END,
     CASE @orderBy WHEN 'VerifiedBy DESC' THEN [ATN_ApplHeader].[VerifiedBy] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ApprovalRemark' THEN [ATN_ApplHeader].[ApprovalRemark] END,
     CASE @orderBy WHEN 'ApprovalRemark DESC' THEN [ATN_ApplHeader].[ApprovalRemark] END DESC,
     CASE @orderBy WHEN 'ApprovalOn' THEN [ATN_ApplHeader].[ApprovalOn] END,
     CASE @orderBy WHEN 'ApprovalOn DESC' THEN [ATN_ApplHeader].[ApprovalOn] END DESC,
     CASE @orderBy WHEN 'SanctionRequired' THEN [ATN_ApplHeader].[SanctionRequired] END,
     CASE @orderBy WHEN 'SanctionRequired DESC' THEN [ATN_ApplHeader].[SanctionRequired] END DESC,
     CASE @orderBy WHEN 'ApprovedBy' THEN [ATN_ApplHeader].[ApprovedBy] END,
     CASE @orderBy WHEN 'ApprovedBy DESC' THEN [ATN_ApplHeader].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus3_ApplStatusID' THEN [ATN_ApplicationStatus3].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus3_ApplStatusID DESC' THEN [ATN_ApplicationStatus3].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus3_Description' THEN [ATN_ApplicationStatus3].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus3_Description DESC' THEN [ATN_ApplicationStatus3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees4_CardNo' THEN [HRM_Employees4].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees4_CardNo DESC' THEN [HRM_Employees4].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[ATN_ApplicationStatus3].[ApplStatusID] AS ATN_ApplicationStatus3_ApplStatusID,
		[ATN_ApplicationStatus3].[Description] AS ATN_ApplicationStatus3_Description,
		[HRM_Employees4].[CardNo] AS HRM_Employees4_CardNo,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees2].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus3]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus3].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_ApplHeader].[ApprovedBy] = [HRM_Employees4].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
