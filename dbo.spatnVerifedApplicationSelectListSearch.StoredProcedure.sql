USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnVerifedApplicationSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @ApplStatusID Int,
  @VerifiedBy NVarChar(8),
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
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees3].[CardNo]
 WHERE  
      [ATN_ApplHeader].[ApplStatusID] >= @ApplStatusID
  AND [ATN_ApplHeader].[VerifiedBy] = @VerifiedBy
  AND [ATN_ApplHeader].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerificationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
   ) 
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
     CASE @orderBy WHEN 'VerificationRemark' THEN [ATN_ApplHeader].[VerificationRemark] END,
     CASE @orderBy WHEN 'VerificationRemark DESC' THEN [ATN_ApplHeader].[VerificationRemark] END DESC,
     CASE @orderBy WHEN 'VerificationOn' THEN [ATN_ApplHeader].[VerificationOn] END,
     CASE @orderBy WHEN 'VerificationOn DESC' THEN [ATN_ApplHeader].[VerificationOn] END DESC,
     CASE @orderBy WHEN 'VerifiedBy' THEN [ATN_ApplHeader].[VerifiedBy] END,
     CASE @orderBy WHEN 'VerifiedBy DESC' THEN [ATN_ApplHeader].[VerifiedBy] END DESC,
     CASE @orderBy WHEN 'ApprovalRequired' THEN [ATN_ApplHeader].[ApprovalRequired] END,
     CASE @orderBy WHEN 'ApprovalRequired DESC' THEN [ATN_ApplHeader].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'SanctionRequired' THEN [ATN_ApplHeader].[SanctionRequired] END,
     CASE @orderBy WHEN 'SanctionRequired DESC' THEN [ATN_ApplHeader].[SanctionRequired] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID' THEN [ATN_ApplicationStatus2].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_ApplStatusID DESC' THEN [ATN_ApplicationStatus2].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description' THEN [ATN_ApplicationStatus2].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus2_Description DESC' THEN [ATN_ApplicationStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[FinYear],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[ATN_ApplicationStatus2].[ApplStatusID] AS ATN_ApplicationStatus2_ApplStatusID,
		[ATN_ApplicationStatus2].[Description] AS ATN_ApplicationStatus2_Description,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApplHeader].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus2]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus2].[ApplStatusID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApplHeader].[VerifiedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
