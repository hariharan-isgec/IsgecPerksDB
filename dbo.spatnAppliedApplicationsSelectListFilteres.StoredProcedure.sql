USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAppliedApplicationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @CardNo NVarChar(8),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  LeaveApplID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (LeaveApplID) ' + 
               'SELECT [ATN_ApplHeader].[LeaveApplID] FROM [ATN_ApplHeader] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[CardNo] = ''' + @CardNo + ''''
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveApplID' THEN '[ATN_ApplHeader].[LeaveApplID]'
                        WHEN 'LeaveApplID DESC' THEN '[ATN_ApplHeader].[LeaveApplID] DESC'
                        WHEN 'CardNo' THEN '[ATN_ApplHeader].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_ApplHeader].[CardNo] DESC'
                        WHEN 'AppliedOn' THEN '[ATN_ApplHeader].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[ATN_ApplHeader].[AppliedOn] DESC'
                        WHEN 'Remarks' THEN '[ATN_ApplHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_ApplHeader].[Remarks] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_ApplHeader].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplHeader].[ApplStatusID] DESC'
                        WHEN 'VerificationRemark' THEN '[ATN_ApplHeader].[VerificationRemark]'
                        WHEN 'VerificationRemark DESC' THEN '[ATN_ApplHeader].[VerificationRemark] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'VerificationOn' THEN '[ATN_ApplHeader].[VerificationOn]'
                        WHEN 'VerificationOn DESC' THEN '[ATN_ApplHeader].[VerificationOn] DESC'
                        WHEN 'ApprovalOn' THEN '[ATN_ApplHeader].[ApprovalOn]'
                        WHEN 'ApprovalOn DESC' THEN '[ATN_ApplHeader].[ApprovalOn] DESC'
                        WHEN 'SanctionOn' THEN '[ATN_ApplHeader].[SanctionOn]'
                        WHEN 'SanctionOn DESC' THEN '[ATN_ApplHeader].[SanctionOn] DESC'
                        WHEN 'PostedOn' THEN '[ATN_ApplHeader].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[ATN_ApplHeader].[PostedOn] DESC'
                        WHEN 'VerificationRequired' THEN '[ATN_ApplHeader].[VerificationRequired]'
                        WHEN 'VerificationRequired DESC' THEN '[ATN_ApplHeader].[VerificationRequired] DESC'
                        WHEN 'ApprovalRequired' THEN '[ATN_ApplHeader].[ApprovalRequired]'
                        WHEN 'ApprovalRequired DESC' THEN '[ATN_ApplHeader].[ApprovalRequired] DESC'
                        WHEN 'SanctionRequired' THEN '[ATN_ApplHeader].[SanctionRequired]'
                        WHEN 'SanctionRequired DESC' THEN '[ATN_ApplHeader].[SanctionRequired] DESC'
                        WHEN 'ApprovalRemark' THEN '[ATN_ApplHeader].[ApprovalRemark]'
                        WHEN 'ApprovalRemark DESC' THEN '[ATN_ApplHeader].[ApprovalRemark] DESC'
                        WHEN 'SanctionRemark' THEN '[ATN_ApplHeader].[SanctionRemark]'
                        WHEN 'SanctionRemark DESC' THEN '[ATN_ApplHeader].[SanctionRemark] DESC'
                        WHEN 'ATN_ApplicationStatus1_ApplStatusID' THEN '[ATN_ApplicationStatus1].[ApplStatusID]'
                        WHEN 'ATN_ApplicationStatus1_ApplStatusID DESC' THEN '[ATN_ApplicationStatus1].[ApplStatusID] DESC'
                        WHEN 'ATN_ApplicationStatus1_Description' THEN '[ATN_ApplicationStatus1].[Description]'
                        WHEN 'ATN_ApplicationStatus1_Description DESC' THEN '[ATN_ApplicationStatus1].[Description] DESC'
                        ELSE '[ATN_ApplHeader].[LeaveApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionOn],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[VerificationRequired],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[SanctionRemark],
		[ATN_ApplicationStatus1].[ApplStatusID] AS ATN_ApplicationStatus1_ApplStatusID,
		[ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
