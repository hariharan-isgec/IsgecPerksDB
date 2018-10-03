USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
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
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [ATN_ApplHeader].[FinYear] = ''' + @FinYear + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LeaveApplID' THEN '[ATN_ApplHeader].[LeaveApplID]'
                        WHEN 'LeaveApplID DESC' THEN '[ATN_ApplHeader].[LeaveApplID] DESC'
                        WHEN 'CardNo' THEN '[ATN_ApplHeader].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_ApplHeader].[CardNo] DESC'
                        WHEN 'Remarks' THEN '[ATN_ApplHeader].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_ApplHeader].[Remarks] DESC'
                        WHEN 'FinYear' THEN '[ATN_ApplHeader].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_ApplHeader].[FinYear] DESC'
                        WHEN 'ApplStatusID' THEN '[ATN_ApplHeader].[ApplStatusID]'
                        WHEN 'ApplStatusID DESC' THEN '[ATN_ApplHeader].[ApplStatusID] DESC'
                        WHEN 'AppliedOn' THEN '[ATN_ApplHeader].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[ATN_ApplHeader].[AppliedOn] DESC'
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
                        WHEN 'VerifiedBy' THEN '[ATN_ApplHeader].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_ApplHeader].[VerifiedBy] DESC'
                        WHEN 'ApprovedBy' THEN '[ATN_ApplHeader].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[ATN_ApplHeader].[ApprovedBy] DESC'
                        WHEN 'SanctionedBy' THEN '[ATN_ApplHeader].[SanctionedBy]'
                        WHEN 'SanctionedBy DESC' THEN '[ATN_ApplHeader].[SanctionedBy] DESC'
                        WHEN 'PostedBy' THEN '[ATN_ApplHeader].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[ATN_ApplHeader].[PostedBy] DESC'
                        WHEN 'VerificationRemark' THEN '[ATN_ApplHeader].[VerificationRemark]'
                        WHEN 'VerificationRemark DESC' THEN '[ATN_ApplHeader].[VerificationRemark] DESC'
                        WHEN 'ApprovalRemark' THEN '[ATN_ApplHeader].[ApprovalRemark]'
                        WHEN 'ApprovalRemark DESC' THEN '[ATN_ApplHeader].[ApprovalRemark] DESC'
                        WHEN 'SanctionRemark' THEN '[ATN_ApplHeader].[SanctionRemark]'
                        WHEN 'SanctionRemark DESC' THEN '[ATN_ApplHeader].[SanctionRemark] DESC'
                        WHEN 'PostingRemark' THEN '[ATN_ApplHeader].[PostingRemark]'
                        WHEN 'PostingRemark DESC' THEN '[ATN_ApplHeader].[PostingRemark] DESC'
                        WHEN 'AdvanceApplication' THEN '[ATN_ApplHeader].[AdvanceApplication]'
                        WHEN 'AdvanceApplication DESC' THEN '[ATN_ApplHeader].[AdvanceApplication] DESC'
                        WHEN 'ExecutionState' THEN '[ATN_ApplHeader].[ExecutionState]'
                        WHEN 'ExecutionState DESC' THEN '[ATN_ApplHeader].[ExecutionState] DESC'
                        ELSE '[ATN_ApplHeader].[LeaveApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_ApplHeader].[LeaveApplID],
		[ATN_ApplHeader].[CardNo],
		[ATN_ApplHeader].[Remarks],
		[ATN_ApplHeader].[FinYear],
		[ATN_ApplHeader].[ApplStatusID],
		[ATN_ApplHeader].[AppliedOn],
		[ATN_ApplHeader].[VerificationOn],
		[ATN_ApplHeader].[ApprovalOn],
		[ATN_ApplHeader].[SanctionOn],
		[ATN_ApplHeader].[PostedOn],
		[ATN_ApplHeader].[VerificationRequired],
		[ATN_ApplHeader].[ApprovalRequired],
		[ATN_ApplHeader].[SanctionRequired],
		[ATN_ApplHeader].[VerifiedBy],
		[ATN_ApplHeader].[ApprovedBy],
		[ATN_ApplHeader].[SanctionedBy],
		[ATN_ApplHeader].[PostedBy],
		[ATN_ApplHeader].[VerificationRemark],
		[ATN_ApplHeader].[ApprovalRemark],
		[ATN_ApplHeader].[SanctionRemark],
		[ATN_ApplHeader].[PostingRemark],
		[ATN_ApplHeader].[AdvanceApplication],
		[ATN_ApplHeader].[ExecutionState] 
  FROM [ATN_ApplHeader] 
    	INNER JOIN #PageIndex
          ON [ATN_ApplHeader].[LeaveApplID] = #PageIndex.LeaveApplID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
