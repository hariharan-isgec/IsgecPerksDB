USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnCardReplacementSelectListSearch]
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
  ReplacedCardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (ReplacedCardNo)
  SELECT [ATN_CardReplacement].[ReplacedCardNo] FROM [ATN_CardReplacement]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_CardReplacement].[CardNo] = [HRM_Employees1].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_CardReplacement].[ReplacedCardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_CardReplacement].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[VerifierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DivisionID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ReplacedCardNo' THEN [ATN_CardReplacement].[ReplacedCardNo] END,
     CASE @orderBy WHEN 'ReplacedCardNo DESC' THEN [ATN_CardReplacement].[ReplacedCardNo] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [ATN_CardReplacement].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [ATN_CardReplacement].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_VerificationRequired' THEN [HRM_Employees1].[VerificationRequired] END,
     CASE @orderBy WHEN 'HRM_Employees1_VerificationRequired DESC' THEN [HRM_Employees1].[VerificationRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_VerifierID' THEN [HRM_Employees1].[VerifierID] END,
     CASE @orderBy WHEN 'HRM_Employees1_VerifierID DESC' THEN [HRM_Employees1].[VerifierID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ApprovalRequired' THEN [HRM_Employees1].[ApprovalRequired] END,
     CASE @orderBy WHEN 'HRM_Employees1_ApprovalRequired DESC' THEN [HRM_Employees1].[ApprovalRequired] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ApproverID' THEN [HRM_Employees1].[ApproverID] END,
     CASE @orderBy WHEN 'HRM_Employees1_ApproverID DESC' THEN [HRM_Employees1].[ApproverID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining' THEN [HRM_Employees1].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN [HRM_Employees1].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfReleaving' THEN [HRM_Employees1].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DateOfReleaving DESC' THEN [HRM_Employees1].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID' THEN [HRM_Employees1].[C_CompanyID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_CompanyID DESC' THEN [HRM_Employees1].[C_CompanyID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID' THEN [HRM_Employees1].[C_DivisionID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DivisionID DESC' THEN [HRM_Employees1].[C_DivisionID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID' THEN [HRM_Employees1].[C_DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN [HRM_Employees1].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID' THEN [HRM_Employees1].[C_DesignationID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_DesignationID DESC' THEN [HRM_Employees1].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState' THEN [HRM_Employees1].[ActiveState] END,
     CASE @orderBy WHEN 'HRM_Employees1_ActiveState DESC' THEN [HRM_Employees1].[ActiveState] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_CardReplacement].[ReplacedCardNo],
		[ATN_CardReplacement].[CardNo],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState 
  FROM [ATN_CardReplacement] 
    	INNER JOIN #PageIndex
          ON [ATN_CardReplacement].[ReplacedCardNo] = #PageIndex.ReplacedCardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_CardReplacement].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
