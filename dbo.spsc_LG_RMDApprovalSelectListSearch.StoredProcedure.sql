USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsc_LG_RMDApprovalSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID)
  SELECT [SC_Request].[RequestID] FROM [SC_Request]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Request].[SubmittedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SC_Request].[MDApprovalBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SC_Request].[AuditedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [SC_Status] AS [SC_Status4]
    ON [SC_Request].[StatusID] = [SC_Status4].[StatusID]
 WHERE  [SC_Request].[StatusID] = 5 AND [SC_Request].[MDApprovalRequired] = 1 
    AND ( 
         STR(ISNULL([SC_Request].[RequestID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[MDApprovalBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[MDFileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[MDDiskFileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[DiskFileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[AuditorRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[MDRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[RequestRefNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[AuditedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Request].[SubmittedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [SC_Request].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [SC_Request].[RequestID] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [SC_Request].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [SC_Request].[Remarks] END DESC,
     CASE @OrderBy WHEN 'MDApprovalRequired' THEN [SC_Request].[MDApprovalRequired] END,
     CASE @OrderBy WHEN 'MDApprovalRequired DESC' THEN [SC_Request].[MDApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'MDApprovalBy' THEN [SC_Request].[MDApprovalBy] END,
     CASE @OrderBy WHEN 'MDApprovalBy DESC' THEN [SC_Request].[MDApprovalBy] END DESC,
     CASE @OrderBy WHEN 'MDApprovalOn' THEN [SC_Request].[MDApprovalOn] END,
     CASE @OrderBy WHEN 'MDApprovalOn DESC' THEN [SC_Request].[MDApprovalOn] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [SC_Request].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_Request].[StatusID] END DESC,
     CASE @OrderBy WHEN 'MDFileName' THEN [SC_Request].[MDFileName] END,
     CASE @OrderBy WHEN 'MDFileName DESC' THEN [SC_Request].[MDFileName] END DESC,
     CASE @OrderBy WHEN 'MDDiskFileName' THEN [SC_Request].[MDDiskFileName] END,
     CASE @OrderBy WHEN 'MDDiskFileName DESC' THEN [SC_Request].[MDDiskFileName] END DESC,
     CASE @OrderBy WHEN 'DiskFileName' THEN [SC_Request].[DiskFileName] END,
     CASE @OrderBy WHEN 'DiskFileName DESC' THEN [SC_Request].[DiskFileName] END DESC,
     CASE @OrderBy WHEN 'AuditorRemarks' THEN [SC_Request].[AuditorRemarks] END,
     CASE @OrderBy WHEN 'AuditorRemarks DESC' THEN [SC_Request].[AuditorRemarks] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [SC_Request].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [SC_Request].[FileName] END DESC,
     CASE @OrderBy WHEN 'MDRemarks' THEN [SC_Request].[MDRemarks] END,
     CASE @OrderBy WHEN 'MDRemarks DESC' THEN [SC_Request].[MDRemarks] END DESC,
     CASE @OrderBy WHEN 'RequestRefNo' THEN [SC_Request].[RequestRefNo] END,
     CASE @OrderBy WHEN 'RequestRefNo DESC' THEN [SC_Request].[RequestRefNo] END DESC,
     CASE @OrderBy WHEN 'SubmittedOn' THEN [SC_Request].[SubmittedOn] END,
     CASE @OrderBy WHEN 'SubmittedOn DESC' THEN [SC_Request].[SubmittedOn] END DESC,
     CASE @OrderBy WHEN 'AuditedOn' THEN [SC_Request].[AuditedOn] END,
     CASE @OrderBy WHEN 'AuditedOn DESC' THEN [SC_Request].[AuditedOn] END DESC,
     CASE @OrderBy WHEN 'AuditedBy' THEN [SC_Request].[AuditedBy] END,
     CASE @OrderBy WHEN 'AuditedBy DESC' THEN [SC_Request].[AuditedBy] END DESC,
     CASE @OrderBy WHEN 'SubmittedBy' THEN [SC_Request].[SubmittedBy] END,
     CASE @OrderBy WHEN 'SubmittedBy DESC' THEN [SC_Request].[SubmittedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'SC_Status4_Description' THEN [SC_Status4].[Description] END,
     CASE @OrderBy WHEN 'SC_Status4_Description DESC' THEN [SC_Status4].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SC_Request].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [SC_Status4].[Description] AS SC_Status4_Description 
  FROM [SC_Request] 
      INNER JOIN #PageIndex
          ON [SC_Request].[RequestID] = #PageIndex.RequestID
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Request].[SubmittedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SC_Request].[MDApprovalBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SC_Request].[AuditedBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [SC_Status] AS [SC_Status4]
    ON [SC_Request].[StatusID] = [SC_Status4].[StatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
