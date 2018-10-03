USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPASelectByID]
  @LoginID NVarChar(8),
  @AdviceNo Int 
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
  WHERE
  [SPMT_newPA].[AdviceNo] = @AdviceNo
GO
