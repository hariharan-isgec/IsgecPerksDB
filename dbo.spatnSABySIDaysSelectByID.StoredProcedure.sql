USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDaysSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @CardNo NVarChar(8) 
  AS
  SELECT
    [ATN_SABySIDays].* ,
    [ATN_SABySI1].[SiteName] AS ATN_SABySI1_SiteName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [ATN_SABySIDays] 
  INNER JOIN [ATN_SABySI] AS [ATN_SABySI1]
    ON [ATN_SABySIDays].[SerialNo] = [ATN_SABySI1].[SerialNo]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_SABySIDays].[CardNo] = [HRM_Employees2].[CardNo]
  WHERE
  [ATN_SABySIDays].[SerialNo] = @SerialNo
  AND [ATN_SABySIDays].[CardNo] = @CardNo
GO
