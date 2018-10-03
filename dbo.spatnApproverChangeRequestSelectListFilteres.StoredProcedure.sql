USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproverChangeRequestSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RequestID) ' + 
               'SELECT [ATN_ApproverChangeRequest].[RequestID] FROM [ATN_ApproverChangeRequest] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApproverChangeRequest].[UserID] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApproverChangeRequest].[VerifierID] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApproverChangeRequest].[ApproverID] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_ApproverChangeRequest].[UserID] = ''' + @UserID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[ATN_ApproverChangeRequest].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[ATN_ApproverChangeRequest].[RequestID] DESC'
                        WHEN 'UserID' THEN '[ATN_ApproverChangeRequest].[UserID]'
                        WHEN 'UserID DESC' THEN '[ATN_ApproverChangeRequest].[UserID] DESC'
                        WHEN 'VerificationRequired' THEN '[ATN_ApproverChangeRequest].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[ATN_ApproverChangeRequest].[VerificationRequired] DESC'
                        WHEN 'VerifierID' THEN '[ATN_ApproverChangeRequest].[VerifierID]'
                        WHEN 'VerifierID DESC' THEN '[ATN_ApproverChangeRequest].[VerifierID] DESC'
                        WHEN 'ApprovalRequired' THEN '[ATN_ApproverChangeRequest].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[ATN_ApproverChangeRequest].[ApprovalRequired] DESC'
                        WHEN 'ApproverID' THEN '[ATN_ApproverChangeRequest].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[ATN_ApproverChangeRequest].[ApproverID] DESC'
                        WHEN 'Requested' THEN '[ATN_ApproverChangeRequest].[Requested]'
                        WHEN 'Requested DESC' THEN '[ATN_ApproverChangeRequest].[Requested] DESC'
                        WHEN 'RequestedOn' THEN '[ATN_ApproverChangeRequest].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[ATN_ApproverChangeRequest].[RequestedOn] DESC'
                        WHEN 'Executed' THEN '[ATN_ApproverChangeRequest].[Executed]'
                        WHEN 'Executed DESC' THEN '[ATN_ApproverChangeRequest].[Executed] DESC'
                        WHEN 'ExecutedOn' THEN '[ATN_ApproverChangeRequest].[ExecutedOn]'
                        WHEN 'ExecutedOn DESC' THEN '[ATN_ApproverChangeRequest].[ExecutedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_CardNo' THEN '[HRM_Employees2].[CardNo]'
                        WHEN 'HRM_Employees2_CardNo DESC' THEN '[HRM_Employees2].[CardNo] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        ELSE '[ATN_ApproverChangeRequest].[RequestID]'
                    END
  EXEC (@LGSQL)

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
