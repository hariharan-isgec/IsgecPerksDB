USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnExecuteChangeRequestSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID)
  SELECT [ATN_ApproverChangeRequest].[RequestID] FROM [ATN_ApproverChangeRequest]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApproverChangeRequest].[UserID] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApproverChangeRequest].[VerifierID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApproverChangeRequest].[ApproverID] = [HRM_Employees3].[CardNo]
 WHERE  [ATN_ApproverChangeRequest].[Executed] = 0 AND  
   ( 
         STR(ISNULL([ATN_ApproverChangeRequest].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApproverChangeRequest].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApproverChangeRequest].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApproverChangeRequest].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RequestID' THEN [ATN_ApproverChangeRequest].[RequestID] END,
     CASE @orderBy WHEN 'RequestID DESC' THEN [ATN_ApproverChangeRequest].[RequestID] END DESC,
     CASE @orderBy WHEN 'UserID' THEN [ATN_ApproverChangeRequest].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [ATN_ApproverChangeRequest].[UserID] END DESC,
     CASE @orderBy WHEN 'VerificationRequired' THEN [ATN_ApproverChangeRequest].[VerificationRequired] END,
     CASE @orderBy WHEN 'VerificationRequired DESC' THEN [ATN_ApproverChangeRequest].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'VerifierID' THEN [ATN_ApproverChangeRequest].[VerifierID] END,
     CASE @orderBy WHEN 'VerifierID DESC' THEN [ATN_ApproverChangeRequest].[VerifierID] END DESC,
     CASE @orderBy WHEN 'ApprovalRequired' THEN [ATN_ApproverChangeRequest].[ApprovalRequired] END,
     CASE @orderBy WHEN 'ApprovalRequired DESC' THEN [ATN_ApproverChangeRequest].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'ApproverID' THEN [ATN_ApproverChangeRequest].[ApproverID] END,
     CASE @orderBy WHEN 'ApproverID DESC' THEN [ATN_ApproverChangeRequest].[ApproverID] END DESC,
     CASE @orderBy WHEN 'Requested' THEN [ATN_ApproverChangeRequest].[Requested] END,
     CASE @orderBy WHEN 'Requested DESC' THEN [ATN_ApproverChangeRequest].[Requested] END DESC,
     CASE @orderBy WHEN 'RequestedOn' THEN [ATN_ApproverChangeRequest].[RequestedOn] END,
     CASE @orderBy WHEN 'RequestedOn DESC' THEN [ATN_ApproverChangeRequest].[RequestedOn] END DESC,
     CASE @orderBy WHEN 'Executed' THEN [ATN_ApproverChangeRequest].[Executed] END,
     CASE @orderBy WHEN 'Executed DESC' THEN [ATN_ApproverChangeRequest].[Executed] END DESC,
     CASE @orderBy WHEN 'ExecutedOn' THEN [ATN_ApproverChangeRequest].[ExecutedOn] END,
     CASE @orderBy WHEN 'ExecutedOn DESC' THEN [ATN_ApproverChangeRequest].[ExecutedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApproverChangeRequest].[RequestID],
		[ATN_ApproverChangeRequest].[UserID],
		[ATN_ApproverChangeRequest].[VerificationRequired],
		[ATN_ApproverChangeRequest].[VerifierID],
		[ATN_ApproverChangeRequest].[ApprovalRequired],
		[ATN_ApproverChangeRequest].[ApproverID],
		[ATN_ApproverChangeRequest].[Requested],
		[ATN_ApproverChangeRequest].[RequestedOn],
		[ATN_ApproverChangeRequest].[Executed],
		[ATN_ApproverChangeRequest].[ExecutedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName 
  FROM [ATN_ApproverChangeRequest] 
    	INNER JOIN #PageIndex
          ON [ATN_ApproverChangeRequest].[RequestID] = #PageIndex.RequestID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_ApproverChangeRequest].[UserID] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_ApproverChangeRequest].[VerifierID] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ATN_ApproverChangeRequest].[ApproverID] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
