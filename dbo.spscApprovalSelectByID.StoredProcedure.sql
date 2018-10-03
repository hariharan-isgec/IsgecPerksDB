USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int,
  @SerialNo Int 
  AS
  SELECT
    [SC_Approval].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [SC_ApprovalStatus2].[Description] AS SC_ApprovalStatus2_Description,
    [SC_Request3].[RequestRefNo] AS SC_Request3_RequestRefNo 
  FROM [SC_Approval] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SC_Approval].[ApproverID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [SC_ApprovalStatus] AS [SC_ApprovalStatus2]
    ON [SC_Approval].[StatusID] = [SC_ApprovalStatus2].[StatusID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Approval].[RequestID] = [SC_Request3].[RequestID]
  WHERE
  [SC_Approval].[RequestID] = @RequestID
  AND [SC_Approval].[SerialNo] = @SerialNo
GO
