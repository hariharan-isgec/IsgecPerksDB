USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscBHApprovalSelectListFilteres]
  @Filter_RequestID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SC_Request].[RequestID]'
  SET @LGSQL = @LGSQL + ' FROM [SC_Request] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[SubmittedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[MDApprovalBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[AuditedBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SC_Status] AS [SC_Status4]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[StatusID] = [SC_Status4].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[PHApprovalBy] = [aspnet_users5].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]'
  SET @LGSQL = @LGSQL + '    ON [SC_Request].[BHApprovalBy] = [aspnet_users6].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SC_Request].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[SC_Request].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[SC_Request].[RequestID] DESC'
                        WHEN 'PHApprovalOn' THEN '[SC_Request].[PHApprovalOn]'
                        WHEN 'PHApprovalOn DESC' THEN '[SC_Request].[PHApprovalOn] DESC'
                        WHEN 'PHApprovalBy' THEN '[SC_Request].[PHApprovalBy]'
                        WHEN 'PHApprovalBy DESC' THEN '[SC_Request].[PHApprovalBy] DESC'
                        WHEN 'PHRemarks' THEN '[SC_Request].[PHRemarks]'
                        WHEN 'PHRemarks DESC' THEN '[SC_Request].[PHRemarks] DESC'
                        WHEN 'BHApprovalOn' THEN '[SC_Request].[BHApprovalOn]'
                        WHEN 'BHApprovalOn DESC' THEN '[SC_Request].[BHApprovalOn] DESC'
                        WHEN 'BHApprovalBy' THEN '[SC_Request].[BHApprovalBy]'
                        WHEN 'BHApprovalBy DESC' THEN '[SC_Request].[BHApprovalBy] DESC'
                        WHEN 'BHRemarks' THEN '[SC_Request].[BHRemarks]'
                        WHEN 'BHRemarks DESC' THEN '[SC_Request].[BHRemarks] DESC'
                        WHEN 'Remarks' THEN '[SC_Request].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SC_Request].[Remarks] DESC'
                        WHEN 'MDApprovalRequired' THEN '[SC_Request].[MDApprovalRequired]'
                        WHEN 'MDApprovalRequired DESC' THEN '[SC_Request].[MDApprovalRequired] DESC'
                        WHEN 'MDDiskFileName' THEN '[SC_Request].[MDDiskFileName]'
                        WHEN 'MDDiskFileName DESC' THEN '[SC_Request].[MDDiskFileName] DESC'
                        WHEN 'MDFileName' THEN '[SC_Request].[MDFileName]'
                        WHEN 'MDFileName DESC' THEN '[SC_Request].[MDFileName] DESC'
                        WHEN 'DiskFileName' THEN '[SC_Request].[DiskFileName]'
                        WHEN 'DiskFileName DESC' THEN '[SC_Request].[DiskFileName] DESC'
                        WHEN 'MDRemarks' THEN '[SC_Request].[MDRemarks]'
                        WHEN 'MDRemarks DESC' THEN '[SC_Request].[MDRemarks] DESC'
                        WHEN 'SubmittedBy' THEN '[SC_Request].[SubmittedBy]'
                        WHEN 'SubmittedBy DESC' THEN '[SC_Request].[SubmittedBy] DESC'
                        WHEN 'AuditedBy' THEN '[SC_Request].[AuditedBy]'
                        WHEN 'AuditedBy DESC' THEN '[SC_Request].[AuditedBy] DESC'
                        WHEN 'SubmittedOn' THEN '[SC_Request].[SubmittedOn]'
                        WHEN 'SubmittedOn DESC' THEN '[SC_Request].[SubmittedOn] DESC'
                        WHEN 'RequestRefNo' THEN '[SC_Request].[RequestRefNo]'
                        WHEN 'RequestRefNo DESC' THEN '[SC_Request].[RequestRefNo] DESC'
                        WHEN 'FileName' THEN '[SC_Request].[FileName]'
                        WHEN 'FileName DESC' THEN '[SC_Request].[FileName] DESC'
                        WHEN 'MDApprovalOn' THEN '[SC_Request].[MDApprovalOn]'
                        WHEN 'MDApprovalOn DESC' THEN '[SC_Request].[MDApprovalOn] DESC'
                        WHEN 'MDApprovalBy' THEN '[SC_Request].[MDApprovalBy]'
                        WHEN 'MDApprovalBy DESC' THEN '[SC_Request].[MDApprovalBy] DESC'
                        WHEN 'StatusID' THEN '[SC_Request].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[SC_Request].[StatusID] DESC'
                        WHEN 'AuditedOn' THEN '[SC_Request].[AuditedOn]'
                        WHEN 'AuditedOn DESC' THEN '[SC_Request].[AuditedOn] DESC'
                        WHEN 'AuditorRemarks' THEN '[SC_Request].[AuditorRemarks]'
                        WHEN 'AuditorRemarks DESC' THEN '[SC_Request].[AuditorRemarks] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'SC_Status4_Description' THEN '[SC_Status4].[Description]'
                        WHEN 'SC_Status4_Description DESC' THEN '[SC_Status4].[Description] DESC'
                        WHEN 'aspnet_Users5_UserFullName' THEN '[aspnet_Users5].[UserFullName]'
                        WHEN 'aspnet_Users5_UserFullName DESC' THEN '[aspnet_Users5].[UserFullName] DESC'
                        WHEN 'aspnet_Users6_UserFullName' THEN '[aspnet_Users6].[UserFullName]'
                        WHEN 'aspnet_Users6_UserFullName DESC' THEN '[aspnet_Users6].[UserFullName] DESC'
                        ELSE '[SC_Request].[RequestID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SC_Request].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [SC_Status4].[Description] AS SC_Status4_Description,
    [aspnet_Users5].[UserFullName] AS aspnet_Users5_UserFullName,
    [aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName 
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
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users5]
    ON [SC_Request].[PHApprovalBy] = [aspnet_users5].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users6]
    ON [SC_Request].[BHApprovalBy] = [aspnet_users6].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
