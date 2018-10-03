USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spsc_LG_RApprovalSelectListSearch]
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
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID, SerialNo)
  SELECT [SC_Approval].[RequestID], [SC_Approval].[SerialNo] FROM [SC_Approval]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Approval].[ApproverID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [SC_ApprovalStatus] AS [SC_ApprovalStatus2]
    ON [SC_Approval].[StatusID] = [SC_ApprovalStatus2].[StatusID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Approval].[RequestID] = [SC_Request3].[RequestID]
 WHERE  [SC_Approval].[ApproverID] = @LoginID
   AND [SC_Approval].[StatusID] = 3 
   AND ( 
         STR(ISNULL([SC_Approval].[RequestID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SC_Approval].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Approval].[ApproverID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Approval].[ApproverRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Approval].[StatusID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [SC_Approval].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [SC_Approval].[RequestID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [SC_Approval].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SC_Approval].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ApproverID' THEN [SC_Approval].[ApproverID] END,
     CASE @OrderBy WHEN 'ApproverID DESC' THEN [SC_Approval].[ApproverID] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [SC_Approval].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [SC_Approval].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApprovedOn' THEN [SC_Approval].[ApprovedOn] END,
     CASE @OrderBy WHEN 'ApprovedOn DESC' THEN [SC_Approval].[ApprovedOn] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [SC_Approval].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SC_Approval].[StatusID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'SC_ApprovalStatus2_Description' THEN [SC_ApprovalStatus2].[Description] END,
     CASE @OrderBy WHEN 'SC_ApprovalStatus2_Description DESC' THEN [SC_ApprovalStatus2].[Description] END DESC,
     CASE @OrderBy WHEN 'SC_Request3_RequestRefNo' THEN [SC_Request3].[RequestRefNo] END,
     CASE @OrderBy WHEN 'SC_Request3_RequestRefNo DESC' THEN [SC_Request3].[RequestRefNo] END DESC 

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
