USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatn_LG_atnSABySIDaysSubmittedData]
  @FinYear Int,
  @MonthID Int,
  @CardNo NVarChar(8)  
  AS
  BEGIN

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
     [ATN_SABySIDays].[CardNo] = @CardNo 
     AND [ATN_SABySI1].[FinYear] = @FinYear
     AND [ATN_SABySI1].[MonthID] = @MonthID
     AND [ATN_SABySI1].[SAStatusID] = 8 --Submitted to HO
  END
GO
