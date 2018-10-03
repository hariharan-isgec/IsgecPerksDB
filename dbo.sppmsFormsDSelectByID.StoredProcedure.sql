USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsDSelectByID]
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @SrNo Int 
  AS
  SELECT
		[PMS_FormsD].[FinYear] ,
		[PMS_FormsD].[CardNo] ,
		[PMS_FormsD].[SrNo] ,
		[PMS_FormsD].[KRA] ,
		[PMS_FormsD].[KPI] ,
		[PMS_FormsD].[Competancy] ,
		[PMS_FormsD].[DetailTypeID] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[PMS_DetailTypes2].[Description] AS PMS_DetailTypes2_Description,
		[PMS_FinYear3].[Description] AS PMS_FinYear3_Description 
  FROM [PMS_FormsD] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsD].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [PMS_DetailTypes] AS [PMS_DetailTypes2]
    ON [PMS_FormsD].[DetailTypeID] = [PMS_DetailTypes2].[DetailTypeID]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear3]
    ON [PMS_FormsD].[FinYear] = [PMS_FinYear3].[FinYear]
  INNER JOIN [PMS_FormsH] AS [PMS_FormsH4]
    ON [PMS_FormsD].[FinYear] = [PMS_FormsH4].[FinYear]
    AND [PMS_FormsD].[CardNo] = [PMS_FormsH4].[CardNo]
  WHERE
  [PMS_FormsD].[FinYear] = @FinYear
  AND [PMS_FormsD].[CardNo] = @CardNo
  AND [PMS_FormsD].[SrNo] = @SrNo
GO
