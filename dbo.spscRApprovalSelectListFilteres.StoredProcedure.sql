USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscRApprovalSelectListFilteres]
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
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SC_Approval].[RequestID]'
  SET @LGSQL = @LGSQL + ', [SC_Approval].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SC_Approval] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SC_Approval].[ApproverID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SC_ApprovalStatus] AS [SC_ApprovalStatus2]'
  SET @LGSQL = @LGSQL + '    ON [SC_Approval].[StatusID] = [SC_ApprovalStatus2].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SC_Request] AS [SC_Request3]'
  SET @LGSQL = @LGSQL + '    ON [SC_Approval].[RequestID] = [SC_Request3].[RequestID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SC_Approval].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[SC_Approval].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[SC_Approval].[RequestID] DESC'
                        WHEN 'SerialNo' THEN '[SC_Approval].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SC_Approval].[SerialNo] DESC'
                        WHEN 'ApproverID' THEN '[SC_Approval].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[SC_Approval].[ApproverID] DESC'
                        WHEN 'ApproverRemarks' THEN '[SC_Approval].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[SC_Approval].[ApproverRemarks] DESC'
                        WHEN 'ApprovedOn' THEN '[SC_Approval].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[SC_Approval].[ApprovedOn] DESC'
                        WHEN 'StatusID' THEN '[SC_Approval].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[SC_Approval].[StatusID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'SC_ApprovalStatus2_Description' THEN '[SC_ApprovalStatus2].[Description]'
                        WHEN 'SC_ApprovalStatus2_Description DESC' THEN '[SC_ApprovalStatus2].[Description] DESC'
                        WHEN 'SC_Request3_RequestRefNo' THEN '[SC_Request3].[RequestRefNo]'
                        WHEN 'SC_Request3_RequestRefNo DESC' THEN '[SC_Request3].[RequestRefNo] DESC'
                        ELSE '[SC_Approval].[RequestID],[SC_Approval].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SC_Approval].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [SC_ApprovalStatus2].[Description] AS SC_ApprovalStatus2_Description,
    [SC_Request3].[RequestRefNo] AS SC_Request3_RequestRefNo 
  FROM [SC_Approval] 
      INNER JOIN #PageIndex
          ON [SC_Approval].[RequestID] = #PageIndex.RequestID
          AND [SC_Approval].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Approval].[ApproverID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [SC_ApprovalStatus] AS [SC_ApprovalStatus2]
    ON [SC_Approval].[StatusID] = [SC_ApprovalStatus2].[StatusID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Approval].[RequestID] = [SC_Request3].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
