USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSiteAttendanceSelectByID]
  @LoginID NVarChar(8),
  @FinYear NVarChar(4),
  @MonthID Int,
  @CardNo NVarChar(8) 
  AS
  SELECT
    [ATN_SiteAttendance].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_FinYear2].[Description] AS ATN_FinYear2_Description,
    [ATN_Months3].[Description] AS ATN_Months3_Description,
    [ATN_SAStatus4].[Description] AS ATN_SAStatus4_Description,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
    [ATN_SABySI1].[SiteName] AS ATN_SABySI1_SiteName,
    [ATN_SABySI3].[SiteName] AS ATN_SABySI3_SiteName,
    [ATN_SABySI4].[SiteName] AS ATN_SABySI4_SiteName,
    [ATN_SABySI5].[SiteName] AS ATN_SABySI5_SiteName,
    [ATN_SABySI6].[SiteName] AS ATN_SABySI6_SiteName,
    [ATN_SABySI7].[SiteName] AS ATN_SABySI7_SiteName,
    [ATN_SABySI8].[SiteName] AS ATN_SABySI8_SiteName,
    [ATN_SABySI9].[SiteName] AS ATN_SABySI9_SiteName,
    [ATN_SABySI10].[SiteName] AS ATN_SABySI10_SiteName,
    [ATN_SABySI11].[SiteName] AS ATN_SABySI11_SiteName,
    [ATN_SABySI12].[SiteName] AS ATN_SABySI12_SiteName,
    [ATN_SABySI13].[SiteName] AS ATN_SABySI13_SiteName,
    [ATN_SABySI14].[SiteName] AS ATN_SABySI14_SiteName,
    [ATN_SABySI15].[SiteName] AS ATN_SABySI15_SiteName,
    [ATN_SABySI16].[SiteName] AS ATN_SABySI16_SiteName,
    [ATN_SABySI17].[SiteName] AS ATN_SABySI17_SiteName,
    [ATN_SABySI18].[SiteName] AS ATN_SABySI18_SiteName,
    [ATN_SABySI19].[SiteName] AS ATN_SABySI19_SiteName,
    [ATN_SABySI20].[SiteName] AS ATN_SABySI20_SiteName,
    [ATN_SABySI21].[SiteName] AS ATN_SABySI21_SiteName,
    [ATN_SABySI22].[SiteName] AS ATN_SABySI22_SiteName,
    [ATN_SABySI23].[SiteName] AS ATN_SABySI23_SiteName,
    [ATN_SABySI24].[SiteName] AS ATN_SABySI24_SiteName,
    [ATN_SABySI25].[SiteName] AS ATN_SABySI25_SiteName,
    [ATN_SABySI26].[SiteName] AS ATN_SABySI26_SiteName,
    [ATN_SABySI27].[SiteName] AS ATN_SABySI27_SiteName,
    [ATN_SABySI28].[SiteName] AS ATN_SABySI28_SiteName,
    [ATN_SABySI29].[SiteName] AS ATN_SABySI29_SiteName,
    [ATN_SABySI30].[SiteName] AS ATN_SABySI30_SiteName,
    [ATN_SABySI31].[SiteName] AS ATN_SABySI31_SiteName,
    [ATN_SABySI2].[SiteName] AS ATN_SABySI2_SiteName,
    [HRM_Employees8].[EmployeeName] AS HRM_Employees8_EmployeeName 
  FROM [ATN_SiteAttendance] 
  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]
    ON [ATN_SiteAttendance].[ATNStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]
  INNER JOIN [ATN_FinYear] AS [ATN_FinYear2]
    ON [ATN_SiteAttendance].[FinYear] = [ATN_FinYear2].[FinYear]
  INNER JOIN [ATN_Months] AS [ATN_Months3]
    ON [ATN_SiteAttendance].[MonthID] = [ATN_Months3].[MonthID]
  LEFT OUTER JOIN [ATN_SAStatus] AS [ATN_SAStatus4]
    ON [ATN_SiteAttendance].[SAStatusID] = [ATN_SAStatus4].[StatusID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [ATN_SiteAttendance].[CardNo] = [HRM_Employees5].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]
    ON [ATN_SiteAttendance].[ApprovedBy] = [HRM_Employees6].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]
    ON [ATN_SiteAttendance].[PostedBy] = [HRM_Employees7].[CardNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI1]
    ON [ATN_SiteAttendance].[SN01] = [ATN_SABySI1].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI3]
    ON [ATN_SiteAttendance].[SN03] = [ATN_SABySI3].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI4]
    ON [ATN_SiteAttendance].[SN04] = [ATN_SABySI4].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI5]
    ON [ATN_SiteAttendance].[SN05] = [ATN_SABySI5].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI6]
    ON [ATN_SiteAttendance].[SN06] = [ATN_SABySI6].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI7]
    ON [ATN_SiteAttendance].[SN07] = [ATN_SABySI7].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI8]
    ON [ATN_SiteAttendance].[SN08] = [ATN_SABySI8].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI9]
    ON [ATN_SiteAttendance].[SN09] = [ATN_SABySI9].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI10]
    ON [ATN_SiteAttendance].[SN10] = [ATN_SABySI10].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI11]
    ON [ATN_SiteAttendance].[SN11] = [ATN_SABySI11].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI12]
    ON [ATN_SiteAttendance].[SN12] = [ATN_SABySI12].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI13]
    ON [ATN_SiteAttendance].[SN13] = [ATN_SABySI13].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI14]
    ON [ATN_SiteAttendance].[SN14] = [ATN_SABySI14].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI15]
    ON [ATN_SiteAttendance].[SN15] = [ATN_SABySI15].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI16]
    ON [ATN_SiteAttendance].[SN16] = [ATN_SABySI16].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI17]
    ON [ATN_SiteAttendance].[SN17] = [ATN_SABySI17].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI18]
    ON [ATN_SiteAttendance].[SN18] = [ATN_SABySI18].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI19]
    ON [ATN_SiteAttendance].[SN19] = [ATN_SABySI19].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI20]
    ON [ATN_SiteAttendance].[SN20] = [ATN_SABySI20].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI21]
    ON [ATN_SiteAttendance].[SN21] = [ATN_SABySI21].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI22]
    ON [ATN_SiteAttendance].[SN22] = [ATN_SABySI22].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI23]
    ON [ATN_SiteAttendance].[SN23] = [ATN_SABySI23].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI24]
    ON [ATN_SiteAttendance].[SN24] = [ATN_SABySI24].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI25]
    ON [ATN_SiteAttendance].[SN25] = [ATN_SABySI25].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI26]
    ON [ATN_SiteAttendance].[SN26] = [ATN_SABySI26].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI27]
    ON [ATN_SiteAttendance].[SN27] = [ATN_SABySI27].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI28]
    ON [ATN_SiteAttendance].[SN28] = [ATN_SABySI28].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI29]
    ON [ATN_SiteAttendance].[SN29] = [ATN_SABySI29].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI30]
    ON [ATN_SiteAttendance].[SN30] = [ATN_SABySI30].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI31]
    ON [ATN_SiteAttendance].[SN31] = [ATN_SABySI31].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI] AS [ATN_SABySI2]
    ON [ATN_SiteAttendance].[SN02] = [ATN_SABySI2].[SerialNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [ATN_SiteAttendance].[VerifiedBy] = [HRM_Employees8].[CardNo]
  WHERE
  [ATN_SiteAttendance].[FinYear] = @FinYear
  AND [ATN_SiteAttendance].[MonthID] = @MonthID
  AND [ATN_SiteAttendance].[CardNo] = @CardNo
GO
