USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPASelectListFilteres]
  @Filter_TranTypeID NVarChar(3),
  @Filter_CreatedBy NVarChar(8),
  @Filter_BPID NVarChar(9),
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
 ,AdviceNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AdviceNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_newPA].[AdviceNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_newPA] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[ReceivedInACBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[PostedInACBy] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[LockedInACBy] = [aspnet_users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[ConcernedHOD] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[StatusID] = [SPMT_PAStatus6].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[TranTypeID] = [SPMT_TranTypes7].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_newPA].[BPID] = [VR_BusinessPartner8].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newPA].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_CreatedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newPA].[CreatedBy] = ''' + @Filter_CreatedBy + ''''
  IF (@Filter_BPID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_newPA].[BPID] = ''' + @Filter_BPID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceNo' THEN '[SPMT_newPA].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_newPA].[AdviceNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_newPA].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_newPA].[TranTypeID] DESC'
                        WHEN 'BPID' THEN '[SPMT_newPA].[BPID]'
                        WHEN 'BPID DESC' THEN '[SPMT_newPA].[BPID] DESC'
                        WHEN 'SupplierName' THEN '[SPMT_newPA].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[SPMT_newPA].[SupplierName] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_newPA].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_newPA].[ConcernedHOD] DESC'
                        WHEN 'Remarks' THEN '[SPMT_newPA].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_newPA].[Remarks] DESC'
                        WHEN 'AdvanceRate' THEN '[SPMT_newPA].[AdvanceRate]'
                        WHEN 'AdvanceRate DESC' THEN '[SPMT_newPA].[AdvanceRate] DESC'
                        WHEN 'AdvanceAmount' THEN '[SPMT_newPA].[AdvanceAmount]'
                        WHEN 'AdvanceAmount DESC' THEN '[SPMT_newPA].[AdvanceAmount] DESC'
                        WHEN 'RetensionRate' THEN '[SPMT_newPA].[RetensionRate]'
                        WHEN 'RetensionRate DESC' THEN '[SPMT_newPA].[RetensionRate] DESC'
                        WHEN 'RetensionAmount' THEN '[SPMT_newPA].[RetensionAmount]'
                        WHEN 'RetensionAmount DESC' THEN '[SPMT_newPA].[RetensionAmount] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_newPA].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_newPA].[CreatedBy] DESC'
                        WHEN 'ERPCompany' THEN '[SPMT_newPA].[ERPCompany]'
                        WHEN 'ERPCompany DESC' THEN '[SPMT_newPA].[ERPCompany] DESC'
                        WHEN 'VoucherType' THEN '[SPMT_newPA].[VoucherType]'
                        WHEN 'VoucherType DESC' THEN '[SPMT_newPA].[VoucherType] DESC'
                        WHEN 'UploadBatchNo' THEN '[SPMT_newPA].[UploadBatchNo]'
                        WHEN 'UploadBatchNo DESC' THEN '[SPMT_newPA].[UploadBatchNo] DESC'
                        WHEN 'VoucherNo' THEN '[SPMT_newPA].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_newPA].[VoucherNo] DESC'
                        WHEN 'PostedInACBy' THEN '[SPMT_newPA].[PostedInACBy]'
                        WHEN 'PostedInACBy DESC' THEN '[SPMT_newPA].[PostedInACBy] DESC'
                        WHEN 'AccountsRemarks' THEN '[SPMT_newPA].[AccountsRemarks]'
                        WHEN 'AccountsRemarks DESC' THEN '[SPMT_newPA].[AccountsRemarks] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_newPA].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_newPA].[CreatedOn] DESC'
                        WHEN 'TotalAdviceAmount' THEN '[SPMT_newPA].[TotalAdviceAmount]'
                        WHEN 'TotalAdviceAmount DESC' THEN '[SPMT_newPA].[TotalAdviceAmount] DESC'
                        WHEN 'StatusID' THEN '[SPMT_newPA].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[SPMT_newPA].[StatusID] DESC'
                        WHEN 'ReceivedInACBy' THEN '[SPMT_newPA].[ReceivedInACBy]'
                        WHEN 'ReceivedInACBy DESC' THEN '[SPMT_newPA].[ReceivedInACBy] DESC'
                        WHEN 'LockedInACBy' THEN '[SPMT_newPA].[LockedInACBy]'
                        WHEN 'LockedInACBy DESC' THEN '[SPMT_newPA].[LockedInACBy] DESC'
                        WHEN 'LockedInACOn' THEN '[SPMT_newPA].[LockedInACOn]'
                        WHEN 'LockedInACOn DESC' THEN '[SPMT_newPA].[LockedInACOn] DESC'
                        WHEN 'ReceivedInACOn' THEN '[SPMT_newPA].[ReceivedInACOn]'
                        WHEN 'ReceivedInACOn DESC' THEN '[SPMT_newPA].[ReceivedInACOn] DESC'
                        WHEN 'PostedInACOn' THEN '[SPMT_newPA].[PostedInACOn]'
                        WHEN 'PostedInACOn DESC' THEN '[SPMT_newPA].[PostedInACOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'SPMT_PAStatus6_Description' THEN '[SPMT_PAStatus6].[Description]'
                        WHEN 'SPMT_PAStatus6_Description DESC' THEN '[SPMT_PAStatus6].[Description] DESC'
                        WHEN 'SPMT_TranTypes7_Description' THEN '[SPMT_TranTypes7].[Description]'
                        WHEN 'SPMT_TranTypes7_Description DESC' THEN '[SPMT_TranTypes7].[Description] DESC'
                        WHEN 'VR_BusinessPartner8_BPName' THEN '[VR_BusinessPartner8].[BPName]'
                        WHEN 'VR_BusinessPartner8_BPName DESC' THEN '[VR_BusinessPartner8].[BPName] DESC'
                        ELSE '[SPMT_newPA].[AdviceNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
      INNER JOIN #PageIndex
          ON [SPMT_newPA].[AdviceNo] = #PageIndex.AdviceNo
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
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
