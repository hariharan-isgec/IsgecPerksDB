USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtACVchPAsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,AdviceNo Int NOT NULL
  )
  INSERT INTO #PageIndex (AdviceNo)
  SELECT [SPMT_PaymentAdvice].[AdviceNo] FROM [SPMT_PaymentAdvice]
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
   ( 
         STR(ISNULL([SPMT_PaymentAdvice].[AdviceNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[TranTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ConcernedHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[CostCenter],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[CostCenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[ElementID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[EmployeeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdvice].[AdviceStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[AdviceStatusUser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHOD],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksHR],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[RemarksAC],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_PaymentAdvice].[VoucherNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[DocumentNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[BaaNCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_PaymentAdvice].[BaaNLedger],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AdviceNo' THEN [SPMT_PaymentAdvice].[AdviceNo] END,
     CASE @orderBy WHEN 'AdviceNo DESC' THEN [SPMT_PaymentAdvice].[AdviceNo] END DESC,
     CASE @orderBy WHEN 'TranTypeID' THEN [SPMT_PaymentAdvice].[TranTypeID] END,
     CASE @orderBy WHEN 'TranTypeID DESC' THEN [SPMT_PaymentAdvice].[TranTypeID] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_PaymentAdvice].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_PaymentAdvice].[VendorID] END DESC,
     CASE @orderBy WHEN 'ConcernedHOD' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END,
     CASE @orderBy WHEN 'ConcernedHOD DESC' THEN [SPMT_PaymentAdvice].[ConcernedHOD] END DESC,
     CASE @orderBy WHEN 'CostCenter' THEN [SPMT_PaymentAdvice].[CostCenter] END,
     CASE @orderBy WHEN 'CostCenter DESC' THEN [SPMT_PaymentAdvice].[CostCenter] END DESC,
     CASE @orderBy WHEN 'CostCenterID' THEN [SPMT_PaymentAdvice].[CostCenterID] END,
     CASE @orderBy WHEN 'CostCenterID DESC' THEN [SPMT_PaymentAdvice].[CostCenterID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [SPMT_PaymentAdvice].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [SPMT_PaymentAdvice].[ProjectID] END DESC,
     CASE @orderBy WHEN 'ElementID' THEN [SPMT_PaymentAdvice].[ElementID] END,
     CASE @orderBy WHEN 'ElementID DESC' THEN [SPMT_PaymentAdvice].[ElementID] END DESC,
     CASE @orderBy WHEN 'DepartmentID' THEN [SPMT_PaymentAdvice].[DepartmentID] END,
     CASE @orderBy WHEN 'DepartmentID DESC' THEN [SPMT_PaymentAdvice].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [SPMT_PaymentAdvice].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [SPMT_PaymentAdvice].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [SPMT_PaymentAdvice].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [SPMT_PaymentAdvice].[Remarks] END DESC,
     CASE @orderBy WHEN 'AdviceStatusID' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END,
     CASE @orderBy WHEN 'AdviceStatusID DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusID] END DESC,
     CASE @orderBy WHEN 'AdviceStatusOn' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END,
     CASE @orderBy WHEN 'AdviceStatusOn DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusOn] END DESC,
     CASE @orderBy WHEN 'AdviceStatusUser' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END,
     CASE @orderBy WHEN 'AdviceStatusUser DESC' THEN [SPMT_PaymentAdvice].[AdviceStatusUser] END DESC,
     CASE @orderBy WHEN 'RemarksHOD' THEN [SPMT_PaymentAdvice].[RemarksHOD] END,
     CASE @orderBy WHEN 'RemarksHOD DESC' THEN [SPMT_PaymentAdvice].[RemarksHOD] END DESC,
     CASE @orderBy WHEN 'RemarksHR' THEN [SPMT_PaymentAdvice].[RemarksHR] END,
     CASE @orderBy WHEN 'RemarksHR DESC' THEN [SPMT_PaymentAdvice].[RemarksHR] END DESC,
     CASE @orderBy WHEN 'RemarksAC' THEN [SPMT_PaymentAdvice].[RemarksAC] END,
     CASE @orderBy WHEN 'RemarksAC DESC' THEN [SPMT_PaymentAdvice].[RemarksAC] END DESC,
     CASE @orderBy WHEN 'Returned' THEN [SPMT_PaymentAdvice].[Returned] END,
     CASE @orderBy WHEN 'Returned DESC' THEN [SPMT_PaymentAdvice].[Returned] END DESC,
     CASE @orderBy WHEN 'Forward' THEN [SPMT_PaymentAdvice].[Forward] END,
     CASE @orderBy WHEN 'Forward DESC' THEN [SPMT_PaymentAdvice].[Forward] END DESC,
     CASE @orderBy WHEN 'VoucherNo' THEN [SPMT_PaymentAdvice].[VoucherNo] END,
     CASE @orderBy WHEN 'VoucherNo DESC' THEN [SPMT_PaymentAdvice].[VoucherNo] END DESC,
     CASE @orderBy WHEN 'DocumentNo' THEN [SPMT_PaymentAdvice].[DocumentNo] END,
     CASE @orderBy WHEN 'DocumentNo DESC' THEN [SPMT_PaymentAdvice].[DocumentNo] END DESC,
     CASE @orderBy WHEN 'BaaNCompany' THEN [SPMT_PaymentAdvice].[BaaNCompany] END,
     CASE @orderBy WHEN 'BaaNCompany DESC' THEN [SPMT_PaymentAdvice].[BaaNCompany] END DESC,
     CASE @orderBy WHEN 'BaaNLedger' THEN [SPMT_PaymentAdvice].[BaaNLedger] END,
     CASE @orderBy WHEN 'BaaNLedger DESC' THEN [SPMT_PaymentAdvice].[BaaNLedger] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description' THEN [SPMT_PAStatus3].[Description] END,
     CASE @orderBy WHEN 'SPMT_PAStatus3_Description DESC' THEN [SPMT_PAStatus3].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_TranTypes4_Description' THEN [SPMT_TranTypes4].[Description] END,
     CASE @orderBy WHEN 'SPMT_TranTypes4_Description DESC' THEN [SPMT_TranTypes4].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description' THEN [SPMT_Vendors5].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors5_Description DESC' THEN [SPMT_Vendors5].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users6_UserFullName' THEN [aspnet_Users6].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users6_UserFullName DESC' THEN [aspnet_Users6].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Departments7_Description' THEN [HRM_Departments7].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments7_Description DESC' THEN [HRM_Departments7].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_Projects8_Description' THEN [IDM_Projects8].[Description] END,
     CASE @orderBy WHEN 'IDM_Projects8_Description DESC' THEN [IDM_Projects8].[Description] END DESC,
     CASE @orderBy WHEN 'IDM_WBS9_Description' THEN [IDM_WBS9].[Description] END,
     CASE @orderBy WHEN 'IDM_WBS9_Description DESC' THEN [IDM_WBS9].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_CostCenters10_Description' THEN [SPMT_CostCenters10].[Description] END,
     CASE @orderBy WHEN 'SPMT_CostCenters10_Description DESC' THEN [SPMT_CostCenters10].[Description] END DESC 

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
