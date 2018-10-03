USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtUnlinkedPAsSelectListFilteres]
  @Filter_VendorID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @AdviceStatusID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AdviceNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_PaymentAdvice].[AdviceNo]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_PaymentAdvice] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes4].[TranTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[VendorID] = [SPMT_Vendors5].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[EmployeeID] = [aspnet_Users6].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[DepartmentID] = [HRM_Departments7].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ProjectID] = [IDM_Projects8].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[ElementID] = [IDM_WBS9].[WBSID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[CostCenterID] = [SPMT_CostCenters10].[CostCenterID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ACVouchers] AS [SPMT_ACVouchers11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_PaymentAdvice].[VoucherNo] = [SPMT_ACVouchers11].[VoucherNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[AdviceStatusID] = ''' + STR(@AdviceStatusID) + '''' 
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_PaymentAdvice].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceNo' THEN '[SPMT_PaymentAdvice].[AdviceNo]'
                        WHEN 'AdviceNo DESC' THEN '[SPMT_PaymentAdvice].[AdviceNo] DESC'
                        WHEN 'TranTypeID' THEN '[SPMT_PaymentAdvice].[TranTypeID]'
                        WHEN 'TranTypeID DESC' THEN '[SPMT_PaymentAdvice].[TranTypeID] DESC'
                        WHEN 'VendorID' THEN '[SPMT_PaymentAdvice].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_PaymentAdvice].[VendorID] DESC'
                        WHEN 'ConcernedHOD' THEN '[SPMT_PaymentAdvice].[ConcernedHOD]'
                        WHEN 'ConcernedHOD DESC' THEN '[SPMT_PaymentAdvice].[ConcernedHOD] DESC'
                        WHEN 'CostCenter' THEN '[SPMT_PaymentAdvice].[CostCenter]'
                        WHEN 'CostCenter DESC' THEN '[SPMT_PaymentAdvice].[CostCenter] DESC'
                        WHEN 'CostCenterID' THEN '[SPMT_PaymentAdvice].[CostCenterID]'
                        WHEN 'CostCenterID DESC' THEN '[SPMT_PaymentAdvice].[CostCenterID] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_PaymentAdvice].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_PaymentAdvice].[ProjectID] DESC'
                        WHEN 'ElementID' THEN '[SPMT_PaymentAdvice].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SPMT_PaymentAdvice].[ElementID] DESC'
                        WHEN 'DepartmentID' THEN '[SPMT_PaymentAdvice].[DepartmentID]'
                        WHEN 'DepartmentID DESC' THEN '[SPMT_PaymentAdvice].[DepartmentID] DESC'
                        WHEN 'EmployeeID' THEN '[SPMT_PaymentAdvice].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[SPMT_PaymentAdvice].[EmployeeID] DESC'
                        WHEN 'Remarks' THEN '[SPMT_PaymentAdvice].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[SPMT_PaymentAdvice].[Remarks] DESC'
                        WHEN 'AdviceStatusID' THEN '[SPMT_PaymentAdvice].[AdviceStatusID]'
                        WHEN 'AdviceStatusID DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusID] DESC'
                        WHEN 'AdviceStatusOn' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn]'
                        WHEN 'AdviceStatusOn DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusOn] DESC'
                        WHEN 'AdviceStatusUser' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser]'
                        WHEN 'AdviceStatusUser DESC' THEN '[SPMT_PaymentAdvice].[AdviceStatusUser] DESC'
                        WHEN 'RemarksHOD' THEN '[SPMT_PaymentAdvice].[RemarksHOD]'
                        WHEN 'RemarksHOD DESC' THEN '[SPMT_PaymentAdvice].[RemarksHOD] DESC'
                        WHEN 'RemarksHR' THEN '[SPMT_PaymentAdvice].[RemarksHR]'
                        WHEN 'RemarksHR DESC' THEN '[SPMT_PaymentAdvice].[RemarksHR] DESC'
                        WHEN 'RemarksAC' THEN '[SPMT_PaymentAdvice].[RemarksAC]'
                        WHEN 'RemarksAC DESC' THEN '[SPMT_PaymentAdvice].[RemarksAC] DESC'
                        WHEN 'Returned' THEN '[SPMT_PaymentAdvice].[Returned]'
                        WHEN 'Returned DESC' THEN '[SPMT_PaymentAdvice].[Returned] DESC'
                        WHEN 'Forward' THEN '[SPMT_PaymentAdvice].[Forward]'
                        WHEN 'Forward DESC' THEN '[SPMT_PaymentAdvice].[Forward] DESC'
                        WHEN 'VoucherNo' THEN '[SPMT_PaymentAdvice].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[SPMT_PaymentAdvice].[VoucherNo] DESC'
                        WHEN 'DocumentNo' THEN '[SPMT_PaymentAdvice].[DocumentNo]'
                        WHEN 'DocumentNo DESC' THEN '[SPMT_PaymentAdvice].[DocumentNo] DESC'
                        WHEN 'BaaNCompany' THEN '[SPMT_PaymentAdvice].[BaaNCompany]'
                        WHEN 'BaaNCompany DESC' THEN '[SPMT_PaymentAdvice].[BaaNCompany] DESC'
                        WHEN 'BaaNLedger' THEN '[SPMT_PaymentAdvice].[BaaNLedger]'
                        WHEN 'BaaNLedger DESC' THEN '[SPMT_PaymentAdvice].[BaaNLedger] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'SPMT_PAStatus3_Description' THEN '[SPMT_PAStatus].[Description]'
                        WHEN 'SPMT_PAStatus3_Description DESC' THEN '[SPMT_PAStatus3].[Description] DESC'
                        WHEN 'SPMT_TranTypes4_Description' THEN '[SPMT_TranTypes].[Description]'
                        WHEN 'SPMT_TranTypes4_Description DESC' THEN '[SPMT_TranTypes4].[Description] DESC'
                        WHEN 'SPMT_Vendors5_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors5_Description DESC' THEN '[SPMT_Vendors5].[Description] DESC'
                        WHEN 'aspnet_Users6_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users6_UserFullName DESC' THEN '[aspnet_Users6].[UserFullName] DESC'
                        WHEN 'HRM_Departments7_Description' THEN '[HRM_Departments].[Description]'
                        WHEN 'HRM_Departments7_Description DESC' THEN '[HRM_Departments7].[Description] DESC'
                        WHEN 'IDM_Projects8_Description' THEN '[IDM_Projects].[Description]'
                        WHEN 'IDM_Projects8_Description DESC' THEN '[IDM_Projects8].[Description] DESC'
                        WHEN 'IDM_WBS9_Description' THEN '[IDM_WBS].[Description]'
                        WHEN 'IDM_WBS9_Description DESC' THEN '[IDM_WBS9].[Description] DESC'
                        WHEN 'SPMT_CostCenters10_Description' THEN '[SPMT_CostCenters].[Description]'
                        WHEN 'SPMT_CostCenters10_Description DESC' THEN '[SPMT_CostCenters10].[Description] DESC'
                        ELSE '[SPMT_PaymentAdvice].[AdviceNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_PaymentAdvice].[AdviceNo] ,
		[SPMT_PaymentAdvice].[TranTypeID] ,
		[SPMT_PaymentAdvice].[VendorID] ,
		[SPMT_PaymentAdvice].[ConcernedHOD] ,
		[SPMT_PaymentAdvice].[CostCenter] ,
		[SPMT_PaymentAdvice].[CostCenterID] ,
		[SPMT_PaymentAdvice].[ProjectID] ,
		[SPMT_PaymentAdvice].[ElementID] ,
		[SPMT_PaymentAdvice].[DepartmentID] ,
		[SPMT_PaymentAdvice].[EmployeeID] ,
		[SPMT_PaymentAdvice].[Remarks] ,
		[SPMT_PaymentAdvice].[AdviceStatusID] ,
		[SPMT_PaymentAdvice].[AdviceStatusOn] ,
		[SPMT_PaymentAdvice].[AdviceStatusUser] ,
		[SPMT_PaymentAdvice].[RemarksHOD] ,
		[SPMT_PaymentAdvice].[RemarksHR] ,
		[SPMT_PaymentAdvice].[RemarksAC] ,
		[SPMT_PaymentAdvice].[Returned] ,
		[SPMT_PaymentAdvice].[Forward] ,
		[SPMT_PaymentAdvice].[VoucherNo] ,
		[SPMT_PaymentAdvice].[DocumentNo] ,
		[SPMT_PaymentAdvice].[BaaNCompany] ,
		[SPMT_PaymentAdvice].[BaaNLedger] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[SPMT_PAStatus3].[Description] AS SPMT_PAStatus3_Description,
		[SPMT_TranTypes4].[Description] AS SPMT_TranTypes4_Description,
		[SPMT_Vendors5].[Description] AS SPMT_Vendors5_Description,
		[aspnet_Users6].[UserFullName] AS aspnet_Users6_UserFullName,
		[HRM_Departments7].[Description] AS HRM_Departments7_Description,
		[IDM_Projects8].[Description] AS IDM_Projects8_Description,
		[IDM_WBS9].[Description] AS IDM_WBS9_Description,
		[SPMT_CostCenters10].[Description] AS SPMT_CostCenters10_Description 
  FROM [SPMT_PaymentAdvice] 
    	INNER JOIN #PageIndex
          ON [SPMT_PaymentAdvice].[AdviceNo] = #PageIndex.AdviceNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_PaymentAdvice].[AdviceStatusUser] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_PaymentAdvice].[ConcernedHOD] = [aspnet_Users2].[LoginID]
  INNER JOIN [SPMT_PAStatus] AS [SPMT_PAStatus3]
    ON [SPMT_PaymentAdvice].[AdviceStatusID] = [SPMT_PAStatus3].[AdviceStatusID]
  INNER JOIN [SPMT_TranTypes] AS [SPMT_TranTypes4]
    ON [SPMT_PaymentAdvice].[TranTypeID] = [SPMT_TranTypes4].[TranTypeID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors5]
    ON [SPMT_PaymentAdvice].[VendorID] = [SPMT_Vendors5].[VendorID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users6]
    ON [SPMT_PaymentAdvice].[EmployeeID] = [aspnet_Users6].[LoginID]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments7]
    ON [SPMT_PaymentAdvice].[DepartmentID] = [HRM_Departments7].[DepartmentID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects8]
    ON [SPMT_PaymentAdvice].[ProjectID] = [IDM_Projects8].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS9]
    ON [SPMT_PaymentAdvice].[ElementID] = [IDM_WBS9].[WBSID]
  LEFT OUTER JOIN [SPMT_CostCenters] AS [SPMT_CostCenters10]
    ON [SPMT_PaymentAdvice].[CostCenterID] = [SPMT_CostCenters10].[CostCenterID]
  LEFT OUTER JOIN [SPMT_ACVouchers] AS [SPMT_ACVouchers11]
    ON [SPMT_PaymentAdvice].[VoucherNo] = [SPMT_ACVouchers11].[VoucherNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
