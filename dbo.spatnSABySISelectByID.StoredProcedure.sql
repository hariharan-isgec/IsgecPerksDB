USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySISelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
    [ATN_SABySI].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_FinYear2].[Description] AS ATN_FinYear2_Description,
    [ATN_Months3].[Description] AS ATN_Months3_Description,
    [HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
    [IDM_Projects5].[Description] AS IDM_Projects5_Description 
  FROM [ATN_SABySI] 
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_SABySI].[SAStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  LEFT OUTER JOIN [ATN_FinYear] AS [ATN_FinYear2]
    ON [ATN_SABySI].[FinYear] = [ATN_FinYear2].[FinYear]
  LEFT OUTER JOIN [ATN_Months] AS [ATN_Months3]
    ON [ATN_SABySI].[MonthID] = [ATN_Months3].[MonthID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [ATN_SABySI].[VerifiedBy] = [HRM_Employees4].[CardNo]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects5]
    ON [ATN_SABySI].[ProjectID] = [IDM_Projects5].[ProjectID]
  WHERE
  [ATN_SABySI].[SerialNo] = @SerialNo
GO
