USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPaymentAdviceSelectByID]
  @LoginID NVarChar(8),
  @AdviceNo Int 
  AS
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
  [SPMT_PaymentAdvice].[AdviceNo] = @AdviceNo
GO
