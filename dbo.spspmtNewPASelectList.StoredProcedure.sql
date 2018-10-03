USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPASelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SPMT_newPA].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [SPMT_PAStatus6].[Description] AS SPMT_PAStatus6_Description,
    [SPMT_TranTypes7].[Description] AS SPMT_TranTypes7_Description,
    [VR_BusinessPartner8].[BPName] AS VR_BusinessPartner8_BPName 
  FROM [SPMT_newPA] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_newPA].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SPMT_newPA].[ReceivedInACBy] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SPMT_newPA].[PostedInACBy] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]
    ON [SPMT_newPA].[LockedInACBy] = [aspnet_users4].[LoginID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [SPMT_newPA].[ConcernedHOD] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus6]
    ON [SPMT_newPA].[StatusID] = [SPMT_PAStatus6].[AdviceStatusID]
  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes7]
    ON [SPMT_newPA].[TranTypeID] = [SPMT_TranTypes7].[TranTypeID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]
    ON [SPMT_newPA].[BPID] = [VR_BusinessPartner8].[BPID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_newPA].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_newPA].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_newPA].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_newPA].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [SPMT_newPA].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [SPMT_newPA].[BPID] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [SPMT_newPA].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [SPMT_newPA].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'ConcernedHOD' THEN [SPMT_newPA].[ConcernedHOD] END,
     CASE @OrderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_newPA].[ConcernedHOD] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [SPMT_newPA].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [SPMT_newPA].[Remarks] END DESC,
     CASE @OrderBy WHEN 'AdvanceRate' THEN [SPMT_newPA].[AdvanceRate] END,
     CASE @OrderBy WHEN 'AdvanceRate DESC' THEN [SPMT_newPA].[AdvanceRate] END DESC,
     CASE @OrderBy WHEN 'AdvanceAmount' THEN [SPMT_newPA].[AdvanceAmount] END,
     CASE @OrderBy WHEN 'AdvanceAmount DESC' THEN [SPMT_newPA].[AdvanceAmount] END DESC,
     CASE @OrderBy WHEN 'RetensionRate' THEN [SPMT_newPA].[RetensionRate] END,
     CASE @OrderBy WHEN 'RetensionRate DESC' THEN [SPMT_newPA].[RetensionRate] END DESC,
     CASE @OrderBy WHEN 'RetensionAmount' THEN [SPMT_newPA].[RetensionAmount] END,
     CASE @OrderBy WHEN 'RetensionAmount DESC' THEN [SPMT_newPA].[RetensionAmount] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [SPMT_newPA].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [SPMT_newPA].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'ERPCompany' THEN [SPMT_newPA].[ERPCompany] END,
     CASE @OrderBy WHEN 'ERPCompany DESC' THEN [SPMT_newPA].[ERPCompany] END DESC,
     CASE @OrderBy WHEN 'VoucherType' THEN [SPMT_newPA].[VoucherType] END,
     CASE @OrderBy WHEN 'VoucherType DESC' THEN [SPMT_newPA].[VoucherType] END DESC,
     CASE @OrderBy WHEN 'UploadBatchNo' THEN [SPMT_newPA].[UploadBatchNo] END,
     CASE @OrderBy WHEN 'UploadBatchNo DESC' THEN [SPMT_newPA].[UploadBatchNo] END DESC,
     CASE @OrderBy WHEN 'VoucherNo' THEN [SPMT_newPA].[VoucherNo] END,
     CASE @OrderBy WHEN 'VoucherNo DESC' THEN [SPMT_newPA].[VoucherNo] END DESC,
     CASE @OrderBy WHEN 'PostedInACBy' THEN [SPMT_newPA].[PostedInACBy] END,
     CASE @OrderBy WHEN 'PostedInACBy DESC' THEN [SPMT_newPA].[PostedInACBy] END DESC,
     CASE @OrderBy WHEN 'AccountsRemarks' THEN [SPMT_newPA].[AccountsRemarks] END,
     CASE @OrderBy WHEN 'AccountsRemarks DESC' THEN [SPMT_newPA].[AccountsRemarks] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [SPMT_newPA].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [SPMT_newPA].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'TotalAdviceAmount' THEN [SPMT_newPA].[TotalAdviceAmount] END,
     CASE @OrderBy WHEN 'TotalAdviceAmount DESC' THEN [SPMT_newPA].[TotalAdviceAmount] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [SPMT_newPA].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SPMT_newPA].[StatusID] END DESC,
     CASE @OrderBy WHEN 'ReceivedInACBy' THEN [SPMT_newPA].[ReceivedInACBy] END,
     CASE @OrderBy WHEN 'ReceivedInACBy DESC' THEN [SPMT_newPA].[ReceivedInACBy] END DESC,
     CASE @OrderBy WHEN 'LockedInACBy' THEN [SPMT_newPA].[LockedInACBy] END,
     CASE @OrderBy WHEN 'LockedInACBy DESC' THEN [SPMT_newPA].[LockedInACBy] END DESC,
     CASE @OrderBy WHEN 'LockedInACOn' THEN [SPMT_newPA].[LockedInACOn] END,
     CASE @OrderBy WHEN 'LockedInACOn DESC' THEN [SPMT_newPA].[LockedInACOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedInACOn' THEN [SPMT_newPA].[ReceivedInACOn] END,
     CASE @OrderBy WHEN 'ReceivedInACOn DESC' THEN [SPMT_newPA].[ReceivedInACOn] END DESC,
     CASE @OrderBy WHEN 'PostedInACOn' THEN [SPMT_newPA].[PostedInACOn] END,
     CASE @OrderBy WHEN 'PostedInACOn DESC' THEN [SPMT_newPA].[PostedInACOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'SPMT_PAStatus6_Description' THEN [SPMT_PAStatus6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_PAStatus6_Description DESC' THEN [SPMT_PAStatus6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes7_Description' THEN [SPMT_TranTypes7].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes7_Description DESC' THEN [SPMT_TranTypes7].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName' THEN [VR_BusinessPartner8].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner8_BPName DESC' THEN [VR_BusinessPartner8].[BPName] END DESC 
  SET @RecordCount = @@RowCount
GO
