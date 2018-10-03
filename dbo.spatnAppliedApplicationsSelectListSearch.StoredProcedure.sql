USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAppliedApplicationsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @CardNo NVarChar(8),
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
  INNER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_ApplHeader].[ApplStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
 WHERE  
      [ATN_ApplHeader].[CardNo] = @CardNo
  AND [ATN_ApplHeader].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([ATN_ApplHeader].[LeaveApplID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_ApplHeader].[ApplStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[VerificationRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[ApprovalRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplHeader].[SanctionRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_ApplicationStatus1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'LeaveApplID' THEN [ATN_ApplHeader].[LeaveApplID] END,
     CASE @orderBy WHEN 'LeaveApplID DESC' THEN [ATN_ApplHeader].[LeaveApplID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_ApplHeader].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_ApplHeader].[CardNo] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [ATN_ApplHeader].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [ATN_ApplHeader].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [ATN_ApplHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [ATN_ApplHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'ApplStatusID' THEN [ATN_ApplHeader].[ApplStatusID] END,
     CASE @orderBy WHEN 'ApplStatusID DESC' THEN [ATN_ApplHeader].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'VerificationRemark' THEN [ATN_ApplHeader].[VerificationRemark] END,
     CASE @orderBy WHEN 'VerificationRemark DESC' THEN [ATN_ApplHeader].[VerificationRemark] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [ATN_ApplHeader].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [ATN_ApplHeader].[FinYear] END DESC,
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
     CASE @orderBy WHEN 'ApprovalRemark' THEN [ATN_ApplHeader].[ApprovalRemark] END,
     CASE @orderBy WHEN 'ApprovalRemark DESC' THEN [ATN_ApplHeader].[ApprovalRemark] END DESC,
     CASE @orderBy WHEN 'SanctionRemark' THEN [ATN_ApplHeader].[SanctionRemark] END,
     CASE @orderBy WHEN 'SanctionRemark DESC' THEN [ATN_ApplHeader].[SanctionRemark] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus1_ApplStatusID' THEN [ATN_ApplicationStatus1].[ApplStatusID] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus1_ApplStatusID DESC' THEN [ATN_ApplicationStatus1].[ApplStatusID] END DESC,
     CASE @orderBy WHEN 'ATN_ApplicationStatus1_Description' THEN [ATN_ApplicationStatus1].[Description] END,
     CASE @orderBy WHEN 'ATN_ApplicationStatus1_Description DESC' THEN [ATN_ApplicationStatus1].[Description] END DESC 

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
