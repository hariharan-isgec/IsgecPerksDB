USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplHeaderSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
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
 WHERE  
      [ATN_ApplHeader].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[PostedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerificationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovalRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[PostingRemark],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ExecutionState], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @orderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'VerificationOn' THEN [ATN_ApplHeader].[VerificationOn] END,
     CASE @orderBy WHEN 'VerificationOn DESC' THEN [ATN_ApplHeader].[VerificationOn] END DESC,
     CASE @orderBy WHEN 'ApprovalOn' THEN [ATN_ApplHeader].[ApprovalOn] END,
     CASE @orderBy WHEN 'ApprovalOn DESC' THEN [ATN_ApplHeader].[ApprovalOn] END DESC,
     CASE @orderBy WHEN 'SanctionOn' THEN [ATN_ApplHeader].[SanctionOn] END,
     CASE @orderBy WHEN 'SanctionOn DESC' THEN [ATN_ApplHeader].[SanctionOn] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [ATN_ApplHeader].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [ATN_ApplHeader].[PostedOn] END DESC,
     CASE @orderBy WHEN 'VerificationRequired' THEN [ATN_ApplHeader].[VerificationRequired] END,
     CASE @orderBy WHEN 'VerificationRequired DESC' THEN [ATN_ApplHeader].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'ApprovalRequired' THEN [ATN_ApplHeader].[ApprovalRequired] END,
     CASE @orderBy WHEN 'ApprovalRequired DESC' THEN [ATN_ApplHeader].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'SanctionRequired' THEN [ATN_ApplHeader].[SanctionRequired] END,
     CASE @orderBy WHEN 'SanctionRequired DESC' THEN [ATN_ApplHeader].[SanctionRequired] END DESC,
     CASE @orderBy WHEN 'VerifiedBy' THEN [ATN_ApplHeader].[VerifiedBy] END,
     CASE @orderBy WHEN 'VerifiedBy DESC' THEN [ATN_ApplHeader].[VerifiedBy] END DESC,
     CASE @orderBy WHEN 'ApprovedBy' THEN [ATN_ApplHeader].[ApprovedBy] END,
     CASE @orderBy WHEN 'ApprovedBy DESC' THEN [ATN_ApplHeader].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'SanctionedBy' THEN [ATN_ApplHeader].[SanctionedBy] END,
     CASE @orderBy WHEN 'SanctionedBy DESC' THEN [ATN_ApplHeader].[SanctionedBy] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [ATN_ApplHeader].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [ATN_ApplHeader].[PostedBy] END DESC,
     CASE @orderBy WHEN 'VerificationRemark' THEN [ATN_ApplHeader].[VerificationRemark] END,
     CASE @orderBy WHEN 'VerificationRemark DESC' THEN [ATN_ApplHeader].[VerificationRemark] END DESC,
     CASE @orderBy WHEN 'ApprovalRemark' THEN [ATN_ApplHeader].[ApprovalRemark] END,
     CASE @orderBy WHEN 'ApprovalRemark DESC' THEN [ATN_ApplHeader].[ApprovalRemark] END DESC,
     CASE @orderBy WHEN 'SanctionRemark' THEN [ATN_ApplHeader].[SanctionRemark] END,
     CASE @orderBy WHEN 'SanctionRemark DESC' THEN [ATN_ApplHeader].[SanctionRemark] END DESC,
     CASE @orderBy WHEN 'PostingRemark' THEN [ATN_ApplHeader].[PostingRemark] END,
     CASE @orderBy WHEN 'PostingRemark DESC' THEN [ATN_ApplHeader].[PostingRemark] END DESC,
     CASE @orderBy WHEN 'AdvanceApplication' THEN [ATN_ApplHeader].[AdvanceApplication] END,
     CASE @orderBy WHEN 'AdvanceApplication DESC' THEN [ATN_ApplHeader].[AdvanceApplication] END DESC,
     CASE @orderBy WHEN 'ExecutionState' THEN [ATN_ApplHeader].[ExecutionState] END,
     CASE @orderBy WHEN 'ExecutionState DESC' THEN [ATN_ApplHeader].[ExecutionState] END DESC 

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
