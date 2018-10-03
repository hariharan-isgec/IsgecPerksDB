USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceSelectListSearch]
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
 ,AdviceNo Int NOT NULL
  )
  INSERT INTO #PageIndex (AdviceNo)
  SELECT [SPMT_PaymentAdvice].[AdviceNo] FROM [SPMT_PaymentAdvice]
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
   ( 
         STR(ISNULL([SPMT_PaymentAdvice].[AdviceNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[BPID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ConcernedHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[CostCenter],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[AdviceStatusUser],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdvice].[AdviceStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksAC],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHR],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ElementID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[CostCenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[EmployeeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdvice].[VoucherNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[DocumentNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[BaaNCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[BaaNLedger],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'AdviceNo' THEN [SPMT_PaymentAdvice].[AdviceNo] END,
     CASE @OrderBy WHEN 'AdviceNo DESC' THEN [SPMT_PaymentAdvice].[AdviceNo] END DESC,
     CASE @OrderBy WHEN 'TranTypeID' THEN [SPMT_PaymentAdvice].[TranTypeID] END,
     CASE @OrderBy WHEN 'TranTypeID DESC' THEN [SPMT_PaymentAdvice].[TranTypeID] END DESC,
     CASE @OrderBy WHEN 'BPID' THEN [SPMT_PaymentAdvice].[BPID] END,
     CASE @OrderBy WHEN 'BPID DESC' THEN [SPMT_PaymentAdvice].[BPID] END DESC,
     CASE @OrderBy WHEN 'ConcernedHOD' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END,
     CASE @OrderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END DESC,
     CASE @OrderBy WHEN 'CostCenter' THEN [SPMT_PaymentAdvice].[CostCenter] END,
     CASE @OrderBy WHEN 'CostCenter DESC' THEN [SPMT_PaymentAdvice].[CostCenter] END DESC,
     CASE @OrderBy WHEN 'AdviceStatusUser' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END,
     CASE @OrderBy WHEN 'AdviceStatusUser DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END DESC,
     CASE @OrderBy WHEN 'AdviceStatusID' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END,
     CASE @OrderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END DESC,
     CASE @OrderBy WHEN 'RemarksAC' THEN [SPMT_PaymentAdvice].[RemarksAC] END,
     CASE @OrderBy WHEN 'RemarksAC DESC' THEN [SPMT_PaymentAdvice].[RemarksAC] END DESC,
     CASE @OrderBy WHEN 'VendorID' THEN [SPMT_PaymentAdvice].[VendorID] END,
     CASE @OrderBy WHEN 'VendorID DESC' THEN [SPMT_PaymentAdvice].[VendorID] END DESC,
     CASE @OrderBy WHEN 'AdviceStatusOn' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END,
     CASE @OrderBy WHEN 'AdviceStatusOn DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [SPMT_PaymentAdvice].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [SPMT_PaymentAdvice].[Remarks] END DESC,
     CASE @OrderBy WHEN 'RemarksHOD' THEN [SPMT_PaymentAdvice].[RemarksHOD] END,
     CASE @OrderBy WHEN 'RemarksHOD DESC' THEN [SPMT_PaymentAdvice].[RemarksHOD] END DESC,
     CASE @OrderBy WHEN 'RemarksHR' THEN [SPMT_PaymentAdvice].[RemarksHR] END,
     CASE @OrderBy WHEN 'RemarksHR DESC' THEN [SPMT_PaymentAdvice].[RemarksHR] END DESC,
     CASE @OrderBy WHEN 'Returned' THEN [SPMT_PaymentAdvice].[Returned] END,
     CASE @OrderBy WHEN 'Returned DESC' THEN [SPMT_PaymentAdvice].[Returned] END DESC,
     CASE @OrderBy WHEN 'Forward' THEN [SPMT_PaymentAdvice].[Forward] END,
     CASE @OrderBy WHEN 'Forward DESC' THEN [SPMT_PaymentAdvice].[Forward] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_PaymentAdvice].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_PaymentAdvice].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SPMT_PaymentAdvice].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SPMT_PaymentAdvice].[ElementID] END DESC,
     CASE @OrderBy WHEN 'CostCenterID' THEN [SPMT_PaymentAdvice].[CostCenterID] END,
     CASE @OrderBy WHEN 'CostCenterID DESC' THEN [SPMT_PaymentAdvice].[CostCenterID] END DESC,
     CASE @OrderBy WHEN 'EmployeeID' THEN [SPMT_PaymentAdvice].[EmployeeID] END,
     CASE @OrderBy WHEN 'EmployeeID DESC' THEN [SPMT_PaymentAdvice].[EmployeeID] END DESC,
     CASE @OrderBy WHEN 'DepartmentID' THEN [SPMT_PaymentAdvice].[DepartmentID] END,
     CASE @OrderBy WHEN 'DepartmentID DESC' THEN [SPMT_PaymentAdvice].[DepartmentID] END DESC,
     CASE @OrderBy WHEN 'VoucherNo' THEN [SPMT_PaymentAdvice].[VoucherNo] END,
     CASE @OrderBy WHEN 'VoucherNo DESC' THEN [SPMT_PaymentAdvice].[VoucherNo] END DESC,
     CASE @OrderBy WHEN 'DocumentNo' THEN [SPMT_PaymentAdvice].[DocumentNo] END,
     CASE @OrderBy WHEN 'DocumentNo DESC' THEN [SPMT_PaymentAdvice].[DocumentNo] END DESC,
     CASE @OrderBy WHEN 'BaaNCompany' THEN [SPMT_PaymentAdvice].[BaaNCompany] END,
     CASE @OrderBy WHEN 'BaaNCompany DESC' THEN [SPMT_PaymentAdvice].[BaaNCompany] END DESC,
     CASE @OrderBy WHEN 'BaaNLedger' THEN [SPMT_PaymentAdvice].[BaaNLedger] END,
     CASE @OrderBy WHEN 'BaaNLedger DESC' THEN [SPMT_PaymentAdvice].[BaaNLedger] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Departments4_Description' THEN [HRM_Departments4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Departments4_Description DESC' THEN [HRM_Departments4].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects5_Description' THEN [IDM_Projects5].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects5_Description DESC' THEN [IDM_Projects5].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS6_Description' THEN [IDM_WBS6].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS6_Description DESC' THEN [IDM_WBS6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_CostCenters8_Description' THEN [SPMT_CostCenters8].[Description] END,
     CASE @OrderBy WHEN 'SPMT_CostCenters8_Description DESC' THEN [SPMT_CostCenters8].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_PAStatus9_Description' THEN [SPMT_PAStatus9].[Description] END,
     CASE @OrderBy WHEN 'SPMT_PAStatus9_Description DESC' THEN [SPMT_PAStatus9].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_TranTypes10_Description' THEN [SPMT_TranTypes10].[Description] END,
     CASE @OrderBy WHEN 'SPMT_TranTypes10_Description DESC' THEN [SPMT_TranTypes10].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner11_BPName' THEN [VR_BusinessPartner11].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner11_BPName DESC' THEN [VR_BusinessPartner11].[BPName] END DESC 

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
