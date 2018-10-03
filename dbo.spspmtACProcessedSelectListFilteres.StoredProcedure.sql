USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtACProcessedSelectListFilteres]
  @Filter_AdviceNo Int,
  @Filter_TranTypeID NVarChar(3),
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
  SET @LGSQL = @LGSQL + '[SPMT_PaymentAdvice].[AdviceNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_PaymentAdvice] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[EmployeeID] = [aspnet_users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[DepartmentID] = [HRM_Departments4].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ProjectID] = [IDM_Projects5].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ElementID] = [IDM_WBS6].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[CostCenterID] = [SPMT_CostCenters8].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus9].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes10].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[BPID] = [VR_BusinessPartner11].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE [SPMT_PaymentAdvice].[AdviceStatusID] IN (2,7,8,9,10,11,12) '
  IF (@Filter_AdviceNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[AdviceNo] = ' + STR(@Filter_AdviceNo)
  IF (@Filter_TranTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[TranTypeID] = ''' + @Filter_TranTypeID + ''''
  IF (@Filter_BPID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[BPID] = ''' + @Filter_BPID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceNo' THEN '[SPMT_PaymentAdvice].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_PaymentAdvice].[AdviceNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_PaymentAdvice].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_PaymentAdvice].[TranTypeID] DESC'
                        WHEN 'BPID' THEN '[SPMT_PaymentAdvice].[BPID]'
                        WHEN 'BPID DESC' THEN '[SPMT_PaymentAdvice].[BPID] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_PaymentAdvice].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_PaymentAdvice].[ConcernedHOD] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_PaymentAdvice].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_PaymentAdvice].[ProjectID] DESC'
                        WHEN 'ElementID' THEN '[SPMT_PaymentAdvice].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_PaymentAdvice].[ElementID] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_PaymentAdvice].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_PaymentAdvice].[CostCenterID] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_PaymentAdvice].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_PaymentAdvice].[DepartmentID] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_PaymentAdvice].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_PaymentAdvice].[EmployeeID] DESC'
                        WHEN 'Remarks' THEN '[SPMT_PaymentAdvice].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_PaymentAdvice].[Remarks] DESC'
                        WHEN 'Returned' THEN '[SPMT_PaymentAdvice].[Returned]'
                        WHEN 'Returned DESC' THEN '[SPMT_PaymentAdvice].[Returned] DESC'
                        WHEN 'Forward' THEN '[SPMT_PaymentAdvice].[Forward]'
                        WHEN 'Forward DESC' THEN '[SPMT_PaymentAdvice].[Forward] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_PaymentAdvice].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_PaymentAdvice].[BaaNLedger] DESC'
                        WHEN 'RemarksHR' THEN '[SPMT_PaymentAdvice].[RemarksHR]'
                        WHEN 'RemarksHR DESC' THEN '[SPMT_PaymentAdvice].[RemarksHR] DESC'
                        WHEN 'VoucherNo' THEN '[SPMT_PaymentAdvice].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_PaymentAdvice].[VoucherNo] DESC'
                        WHEN 'VendorID' THEN '[SPMT_PaymentAdvice].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_PaymentAdvice].[VendorID] DESC'
                        WHEN 'RemarksHOD' THEN '[SPMT_PaymentAdvice].[RemarksHOD]'
                        WHEN 'RemarksHOD DESC' THEN '[SPMT_PaymentAdvice].[RemarksHOD] DESC'
                        WHEN 'AdviceStatusOn' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn]'
                        WHEN 'AdviceStatusOn DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn] DESC'
                        WHEN 'AdviceStatusUser' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser]'
                        WHEN 'AdviceStatusUser DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_PaymentAdvice].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_PaymentAdvice].[RemarksAC] DESC'
                        WHEN 'AdviceStatusID' THEN '[SPMT_PaymentAdvice].[AdviceStatusID]'
                        WHEN 'AdviceStatusID DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusID] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_PaymentAdvice].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_PaymentAdvice].[BaaNCompany] DESC'
                        WHEN 'DocumentNo' THEN '[SPMT_PaymentAdvice].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[SPMT_PaymentAdvice].[DocumentNo] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_PaymentAdvice].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_PaymentAdvice].[CostCenter] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Departments4_Description' THEN '[HRM_Departments4].[Description]'
                        WHEN 'HRM_Departments4_Description DESC' THEN '[HRM_Departments4].[Description] DESC'
                        WHEN 'IDM_Projects5_Description' THEN '[IDM_Projects5].[Description]'
                        WHEN 'IDM_Projects5_Description DESC' THEN '[IDM_Projects5].[Description] DESC'
                        WHEN 'IDM_WBS6_Description' THEN '[IDM_WBS6].[Description]'
                        WHEN 'IDM_WBS6_Description DESC' THEN '[IDM_WBS6].[Description] DESC'
                        WHEN 'SPMT_CostCenters8_Description' THEN '[SPMT_CostCenters8].[Description]'
                        WHEN 'SPMT_CostCenters8_Description DESC' THEN '[SPMT_CostCenters8].[Description] DESC'
                        WHEN 'SPMT_PAStatus9_Description' THEN '[SPMT_PAStatus9].[Description]'
                        WHEN 'SPMT_PAStatus9_Description DESC' THEN '[SPMT_PAStatus9].[Description] DESC'
                        WHEN 'SPMT_TranTypes10_Description' THEN '[SPMT_TranTypes10].[Description]'
                        WHEN 'SPMT_TranTypes10_Description DESC' THEN '[SPMT_TranTypes10].[Description] DESC'
                        WHEN 'VR_BusinessPartner11_BPName' THEN '[VR_BusinessPartner11].[BPName]'
                        WHEN 'VR_BusinessPartner11_BPName DESC' THEN '[VR_BusinessPartner11].[BPName] DESC'
                        ELSE '[SPMT_PaymentAdvice].[AdviceNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_PaymentAdvice].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [HRM_Departments4].[Description] AS HRM_Departments4_Description,
    [IDM_Projects5].[Description] AS IDM_Projects5_Description,
    [IDM_WBS6].[Description] AS IDM_WBS6_Description,
    [SPMT_CostCenters8].[Description] AS SPMT_CostCenters8_Description,
    [SPMT_PAStatus9].[Description] AS SPMT_PAStatus9_Description,
    [SPMT_TranTypes10].[Description] AS SPMT_TranTypes10_Description,
    [VR_BusinessPartner11].[BPName] AS VR_BusinessPartner11_BPName 
  FROM [SPMT_PaymentAdvice] 
      INNER JOIN #PageIndex
          ON [SPMT_PaymentAdvice].[AdviceNo] = #PageIndex.AdviceNo
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_users2].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users3]
    ON [SPMT_PaymentAdvice].[EmployeeID] = [aspnet_users3].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments4]
    ON [SPMT_PaymentAdvice].[DepartmentID] = [HRM_Departments4].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [SPMT_PaymentAdvice].[ProjectID] = [IDM_Projects5].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS6]
    ON [SPMT_PaymentAdvice].[ElementID] = [IDM_WBS6].[WBSID]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters8]
    ON [SPMT_PaymentAdvice].[CostCenterID] = [SPMT_CostCenters8].[CostCenterID]
  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus9]
    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus9].[AdviceStatusID]
  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes10]
    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes10].[TranTypeID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner11]
    ON [SPMT_PaymentAdvice].[BPID] = [VR_BusinessPartner11].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
