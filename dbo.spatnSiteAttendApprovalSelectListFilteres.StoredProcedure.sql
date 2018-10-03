USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSiteAttendApprovalSelectListFilteres]
  @Filter_MonthID Int,
  @Filter_ApprovedBy NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,MonthID Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', MonthID'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_SiteAttendance].[FinYear]'
  SET @LGSQL = @LGSQL + ', [ATN_SiteAttendance].[MonthID]'
  SET @LGSQL = @LGSQL + ', [ATN_SiteAttendance].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_SiteAttendance] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_ApplicationStatus] AS [ATN_ApplicationStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[ATNStatusID] = [ATN_ApplicationStatus1].[ApplStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_FinYear] AS [ATN_FinYear2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[FinYear] = [ATN_FinYear2].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_Months] AS [ATN_Months3]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[MonthID] = [ATN_Months3].[MonthID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ATN_SAStatus] AS [ATN_SAStatus4]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[SAStatusID] = [ATN_SAStatus4].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[CardNo] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees6]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[ApprovedBy] = [HRM_Employees6].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees7]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[PostedBy] = [HRM_Employees7].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SiteAttendance].[VerifiedBy] = [HRM_Employees8].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE [ATN_SiteAttendance].[ATNStatusID] = 3 '   
  SET @LGSQL = @LGSQL + ' AND [ATN_SiteAttendance].[FinYear] = (''' + @FinYear + ''')'
  IF (@LoginID <> '0340') 
    SET @LGSQL = @LGSQL + '  AND [ATN_SiteAttendance].[CardNo] IN (select cardno from hrm_employees where approverid = ''' + @LoginID + '''   ) '
  IF (@Filter_MonthID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATN_SiteAttendance].[MonthID] = ' + STR(@Filter_MonthID)
  IF (@Filter_ApprovedBy > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_SiteAttendance].[ApprovedBy] = ''' + @Filter_ApprovedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[ATN_SiteAttendance].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[ATN_SiteAttendance].[FinYear] DESC'
                        WHEN 'MonthID' THEN '[ATN_SiteAttendance].[MonthID]'
                        WHEN 'MonthID DESC' THEN '[ATN_SiteAttendance].[MonthID] DESC'
                        WHEN 'CardNo' THEN '[ATN_SiteAttendance].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_SiteAttendance].[CardNo] DESC'
                        WHEN 'VD01' THEN '[ATN_SiteAttendance].[VD01]'
                        WHEN 'VD01 DESC' THEN '[ATN_SiteAttendance].[VD01] DESC'
                        WHEN 'VD02' THEN '[ATN_SiteAttendance].[VD02]'
                        WHEN 'VD02 DESC' THEN '[ATN_SiteAttendance].[VD02] DESC'
                        WHEN 'VD03' THEN '[ATN_SiteAttendance].[VD03]'
                        WHEN 'VD03 DESC' THEN '[ATN_SiteAttendance].[VD03] DESC'
                        WHEN 'VD04' THEN '[ATN_SiteAttendance].[VD04]'
                        WHEN 'VD04 DESC' THEN '[ATN_SiteAttendance].[VD04] DESC'
                        WHEN 'VD05' THEN '[ATN_SiteAttendance].[VD05]'
                        WHEN 'VD05 DESC' THEN '[ATN_SiteAttendance].[VD05] DESC'
                        WHEN 'VD06' THEN '[ATN_SiteAttendance].[VD06]'
                        WHEN 'VD06 DESC' THEN '[ATN_SiteAttendance].[VD06] DESC'
                        WHEN 'VD07' THEN '[ATN_SiteAttendance].[VD07]'
                        WHEN 'VD07 DESC' THEN '[ATN_SiteAttendance].[VD07] DESC'
                        WHEN 'VD08' THEN '[ATN_SiteAttendance].[VD08]'
                        WHEN 'VD08 DESC' THEN '[ATN_SiteAttendance].[VD08] DESC'
                        WHEN 'VD09' THEN '[ATN_SiteAttendance].[VD09]'
                        WHEN 'VD09 DESC' THEN '[ATN_SiteAttendance].[VD09] DESC'
                        WHEN 'VD10' THEN '[ATN_SiteAttendance].[VD10]'
                        WHEN 'VD10 DESC' THEN '[ATN_SiteAttendance].[VD10] DESC'
                        WHEN 'VD11' THEN '[ATN_SiteAttendance].[VD11]'
                        WHEN 'VD11 DESC' THEN '[ATN_SiteAttendance].[VD11] DESC'
                        WHEN 'VD12' THEN '[ATN_SiteAttendance].[VD12]'
                        WHEN 'VD12 DESC' THEN '[ATN_SiteAttendance].[VD12] DESC'
                        WHEN 'VD13' THEN '[ATN_SiteAttendance].[VD13]'
                        WHEN 'VD13 DESC' THEN '[ATN_SiteAttendance].[VD13] DESC'
                        WHEN 'VD14' THEN '[ATN_SiteAttendance].[VD14]'
                        WHEN 'VD14 DESC' THEN '[ATN_SiteAttendance].[VD14] DESC'
                        WHEN 'VD15' THEN '[ATN_SiteAttendance].[VD15]'
                        WHEN 'VD15 DESC' THEN '[ATN_SiteAttendance].[VD15] DESC'
                        WHEN 'VD16' THEN '[ATN_SiteAttendance].[VD16]'
                        WHEN 'VD16 DESC' THEN '[ATN_SiteAttendance].[VD16] DESC'
                        WHEN 'VD17' THEN '[ATN_SiteAttendance].[VD17]'
                        WHEN 'VD17 DESC' THEN '[ATN_SiteAttendance].[VD17] DESC'
                        WHEN 'VD18' THEN '[ATN_SiteAttendance].[VD18]'
                        WHEN 'VD18 DESC' THEN '[ATN_SiteAttendance].[VD18] DESC'
                        WHEN 'VD19' THEN '[ATN_SiteAttendance].[VD19]'
                        WHEN 'VD19 DESC' THEN '[ATN_SiteAttendance].[VD19] DESC'
                        WHEN 'VD20' THEN '[ATN_SiteAttendance].[VD20]'
                        WHEN 'VD20 DESC' THEN '[ATN_SiteAttendance].[VD20] DESC'
                        WHEN 'VD21' THEN '[ATN_SiteAttendance].[VD21]'
                        WHEN 'VD21 DESC' THEN '[ATN_SiteAttendance].[VD21] DESC'
                        WHEN 'VD22' THEN '[ATN_SiteAttendance].[VD22]'
                        WHEN 'VD22 DESC' THEN '[ATN_SiteAttendance].[VD22] DESC'
                        WHEN 'VD23' THEN '[ATN_SiteAttendance].[VD23]'
                        WHEN 'VD23 DESC' THEN '[ATN_SiteAttendance].[VD23] DESC'
                        WHEN 'VD24' THEN '[ATN_SiteAttendance].[VD24]'
                        WHEN 'VD24 DESC' THEN '[ATN_SiteAttendance].[VD24] DESC'
                        WHEN 'VD25' THEN '[ATN_SiteAttendance].[VD25]'
                        WHEN 'VD25 DESC' THEN '[ATN_SiteAttendance].[VD25] DESC'
                        WHEN 'VD26' THEN '[ATN_SiteAttendance].[VD26]'
                        WHEN 'VD26 DESC' THEN '[ATN_SiteAttendance].[VD26] DESC'
                        WHEN 'VD27' THEN '[ATN_SiteAttendance].[VD27]'
                        WHEN 'VD27 DESC' THEN '[ATN_SiteAttendance].[VD27] DESC'
                        WHEN 'VD28' THEN '[ATN_SiteAttendance].[VD28]'
                        WHEN 'VD28 DESC' THEN '[ATN_SiteAttendance].[VD28] DESC'
                        WHEN 'VD29' THEN '[ATN_SiteAttendance].[VD29]'
                        WHEN 'VD29 DESC' THEN '[ATN_SiteAttendance].[VD29] DESC'
                        WHEN 'VD30' THEN '[ATN_SiteAttendance].[VD30]'
                        WHEN 'VD30 DESC' THEN '[ATN_SiteAttendance].[VD30] DESC'
                        WHEN 'VD31' THEN '[ATN_SiteAttendance].[VD31]'
                        WHEN 'VD31 DESC' THEN '[ATN_SiteAttendance].[VD31] DESC'
                        WHEN 'PD25' THEN '[ATN_SiteAttendance].[PD25]'
                        WHEN 'PD25 DESC' THEN '[ATN_SiteAttendance].[PD25] DESC'
                        WHEN 'PD18' THEN '[ATN_SiteAttendance].[PD18]'
                        WHEN 'PD18 DESC' THEN '[ATN_SiteAttendance].[PD18] DESC'
                        WHEN 'SAStatusID' THEN '[ATN_SiteAttendance].[SAStatusID]'
                        WHEN 'SAStatusID DESC' THEN '[ATN_SiteAttendance].[SAStatusID] DESC'
                        WHEN 'PD07' THEN '[ATN_SiteAttendance].[PD07]'
                        WHEN 'PD07 DESC' THEN '[ATN_SiteAttendance].[PD07] DESC'
                        WHEN 'PD08' THEN '[ATN_SiteAttendance].[PD08]'
                        WHEN 'PD08 DESC' THEN '[ATN_SiteAttendance].[PD08] DESC'
                        WHEN 'PD06' THEN '[ATN_SiteAttendance].[PD06]'
                        WHEN 'PD06 DESC' THEN '[ATN_SiteAttendance].[PD06] DESC'
                        WHEN 'PD29' THEN '[ATN_SiteAttendance].[PD29]'
                        WHEN 'PD29 DESC' THEN '[ATN_SiteAttendance].[PD29] DESC'
                        WHEN 'PD05' THEN '[ATN_SiteAttendance].[PD05]'
                        WHEN 'PD05 DESC' THEN '[ATN_SiteAttendance].[PD05] DESC'
                        WHEN 'PD19' THEN '[ATN_SiteAttendance].[PD19]'
                        WHEN 'PD19 DESC' THEN '[ATN_SiteAttendance].[PD19] DESC'
                        WHEN 'PD30' THEN '[ATN_SiteAttendance].[PD30]'
                        WHEN 'PD30 DESC' THEN '[ATN_SiteAttendance].[PD30] DESC'
                        WHEN 'PD11' THEN '[ATN_SiteAttendance].[PD11]'
                        WHEN 'PD11 DESC' THEN '[ATN_SiteAttendance].[PD11] DESC'
                        WHEN 'PD03' THEN '[ATN_SiteAttendance].[PD03]'
                        WHEN 'PD03 DESC' THEN '[ATN_SiteAttendance].[PD03] DESC'
                        WHEN 'PD20' THEN '[ATN_SiteAttendance].[PD20]'
                        WHEN 'PD20 DESC' THEN '[ATN_SiteAttendance].[PD20] DESC'
                        WHEN 'PD24' THEN '[ATN_SiteAttendance].[PD24]'
                        WHEN 'PD24 DESC' THEN '[ATN_SiteAttendance].[PD24] DESC'
                        WHEN 'PD27' THEN '[ATN_SiteAttendance].[PD27]'
                        WHEN 'PD27 DESC' THEN '[ATN_SiteAttendance].[PD27] DESC'
                        WHEN 'SN09' THEN '[ATN_SiteAttendance].[SN09]'
                        WHEN 'SN09 DESC' THEN '[ATN_SiteAttendance].[SN09] DESC'
                        WHEN 'SN08' THEN '[ATN_SiteAttendance].[SN08]'
                        WHEN 'SN08 DESC' THEN '[ATN_SiteAttendance].[SN08] DESC'
                        WHEN 'SN07' THEN '[ATN_SiteAttendance].[SN07]'
                        WHEN 'SN07 DESC' THEN '[ATN_SiteAttendance].[SN07] DESC'
                        WHEN 'PD17' THEN '[ATN_SiteAttendance].[PD17]'
                        WHEN 'PD17 DESC' THEN '[ATN_SiteAttendance].[PD17] DESC'
                        WHEN 'PostedBy' THEN '[ATN_SiteAttendance].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[ATN_SiteAttendance].[PostedBy] DESC'
                        WHEN 'PD12' THEN '[ATN_SiteAttendance].[PD12]'
                        WHEN 'PD12 DESC' THEN '[ATN_SiteAttendance].[PD12] DESC'
                        WHEN 'PD13' THEN '[ATN_SiteAttendance].[PD13]'
                        WHEN 'PD13 DESC' THEN '[ATN_SiteAttendance].[PD13] DESC'
                        WHEN 'PostingRemarks' THEN '[ATN_SiteAttendance].[PostingRemarks]'
                        WHEN 'PostingRemarks DESC' THEN '[ATN_SiteAttendance].[PostingRemarks] DESC'
                        WHEN 'ApprovedBy' THEN '[ATN_SiteAttendance].[ApprovedBy]'
                        WHEN 'ApprovedBy DESC' THEN '[ATN_SiteAttendance].[ApprovedBy] DESC'
                        WHEN 'PD09' THEN '[ATN_SiteAttendance].[PD09]'
                        WHEN 'PD09 DESC' THEN '[ATN_SiteAttendance].[PD09] DESC'
                        WHEN 'PD04' THEN '[ATN_SiteAttendance].[PD04]'
                        WHEN 'PD04 DESC' THEN '[ATN_SiteAttendance].[PD04] DESC'
                        WHEN 'SN05' THEN '[ATN_SiteAttendance].[SN05]'
                        WHEN 'SN05 DESC' THEN '[ATN_SiteAttendance].[SN05] DESC'
                        WHEN 'PD15' THEN '[ATN_SiteAttendance].[PD15]'
                        WHEN 'PD15 DESC' THEN '[ATN_SiteAttendance].[PD15] DESC'
                        WHEN 'PD16' THEN '[ATN_SiteAttendance].[PD16]'
                        WHEN 'PD16 DESC' THEN '[ATN_SiteAttendance].[PD16] DESC'
                        WHEN 'PD14' THEN '[ATN_SiteAttendance].[PD14]'
                        WHEN 'PD14 DESC' THEN '[ATN_SiteAttendance].[PD14] DESC'
                        WHEN 'SN04' THEN '[ATN_SiteAttendance].[SN04]'
                        WHEN 'SN04 DESC' THEN '[ATN_SiteAttendance].[SN04] DESC'
                        WHEN 'ApprovedOn' THEN '[ATN_SiteAttendance].[ApprovedOn]'
                        WHEN 'ApprovedOn DESC' THEN '[ATN_SiteAttendance].[ApprovedOn] DESC'
                        WHEN 'PD02' THEN '[ATN_SiteAttendance].[PD02]'
                        WHEN 'PD02 DESC' THEN '[ATN_SiteAttendance].[PD02] DESC'
                        WHEN 'PostedOn' THEN '[ATN_SiteAttendance].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[ATN_SiteAttendance].[PostedOn] DESC'
                        WHEN 'PD28' THEN '[ATN_SiteAttendance].[PD28]'
                        WHEN 'PD28 DESC' THEN '[ATN_SiteAttendance].[PD28] DESC'
                        WHEN 'AD22' THEN '[ATN_SiteAttendance].[AD22]'
                        WHEN 'AD22 DESC' THEN '[ATN_SiteAttendance].[AD22] DESC'
                        WHEN 'AD21' THEN '[ATN_SiteAttendance].[AD21]'
                        WHEN 'AD21 DESC' THEN '[ATN_SiteAttendance].[AD21] DESC'
                        WHEN 'AD24' THEN '[ATN_SiteAttendance].[AD24]'
                        WHEN 'AD24 DESC' THEN '[ATN_SiteAttendance].[AD24] DESC'
                        WHEN 'AD23' THEN '[ATN_SiteAttendance].[AD23]'
                        WHEN 'AD23 DESC' THEN '[ATN_SiteAttendance].[AD23] DESC'
                        WHEN 'AD18' THEN '[ATN_SiteAttendance].[AD18]'
                        WHEN 'AD18 DESC' THEN '[ATN_SiteAttendance].[AD18] DESC'
                        WHEN 'AD17' THEN '[ATN_SiteAttendance].[AD17]'
                        WHEN 'AD17 DESC' THEN '[ATN_SiteAttendance].[AD17] DESC'
                        WHEN 'AD20' THEN '[ATN_SiteAttendance].[AD20]'
                        WHEN 'AD20 DESC' THEN '[ATN_SiteAttendance].[AD20] DESC'
                        WHEN 'AD19' THEN '[ATN_SiteAttendance].[AD19]'
                        WHEN 'AD19 DESC' THEN '[ATN_SiteAttendance].[AD19] DESC'
                        WHEN 'AD30' THEN '[ATN_SiteAttendance].[AD30]'
                        WHEN 'AD30 DESC' THEN '[ATN_SiteAttendance].[AD30] DESC'
                        WHEN 'AD29' THEN '[ATN_SiteAttendance].[AD29]'
                        WHEN 'AD29 DESC' THEN '[ATN_SiteAttendance].[AD29] DESC'
                        WHEN 'ApproverRemarks' THEN '[ATN_SiteAttendance].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[ATN_SiteAttendance].[ApproverRemarks] DESC'
                        WHEN 'AD31' THEN '[ATN_SiteAttendance].[AD31]'
                        WHEN 'AD31 DESC' THEN '[ATN_SiteAttendance].[AD31] DESC'
                        WHEN 'AD26' THEN '[ATN_SiteAttendance].[AD26]'
                        WHEN 'AD26 DESC' THEN '[ATN_SiteAttendance].[AD26] DESC'
                        WHEN 'AD25' THEN '[ATN_SiteAttendance].[AD25]'
                        WHEN 'AD25 DESC' THEN '[ATN_SiteAttendance].[AD25] DESC'
                        WHEN 'AD28' THEN '[ATN_SiteAttendance].[AD28]'
                        WHEN 'AD28 DESC' THEN '[ATN_SiteAttendance].[AD28] DESC'
                        WHEN 'AD27' THEN '[ATN_SiteAttendance].[AD27]'
                        WHEN 'AD27 DESC' THEN '[ATN_SiteAttendance].[AD27] DESC'
                        WHEN 'AD16' THEN '[ATN_SiteAttendance].[AD16]'
                        WHEN 'AD16 DESC' THEN '[ATN_SiteAttendance].[AD16] DESC'
                        WHEN 'AD05' THEN '[ATN_SiteAttendance].[AD05]'
                        WHEN 'AD05 DESC' THEN '[ATN_SiteAttendance].[AD05] DESC'
                        WHEN 'AD04' THEN '[ATN_SiteAttendance].[AD04]'
                        WHEN 'AD04 DESC' THEN '[ATN_SiteAttendance].[AD04] DESC'
                        WHEN 'AD07' THEN '[ATN_SiteAttendance].[AD07]'
                        WHEN 'AD07 DESC' THEN '[ATN_SiteAttendance].[AD07] DESC'
                        WHEN 'AD06' THEN '[ATN_SiteAttendance].[AD06]'
                        WHEN 'AD06 DESC' THEN '[ATN_SiteAttendance].[AD06] DESC'
                        WHEN 'AD01' THEN '[ATN_SiteAttendance].[AD01]'
                        WHEN 'AD01 DESC' THEN '[ATN_SiteAttendance].[AD01] DESC'
                        WHEN 'ATNStatusID' THEN '[ATN_SiteAttendance].[ATNStatusID]'
                        WHEN 'ATNStatusID DESC' THEN '[ATN_SiteAttendance].[ATNStatusID] DESC'
                        WHEN 'AD03' THEN '[ATN_SiteAttendance].[AD03]'
                        WHEN 'AD03 DESC' THEN '[ATN_SiteAttendance].[AD03] DESC'
                        WHEN 'AD02' THEN '[ATN_SiteAttendance].[AD02]'
                        WHEN 'AD02 DESC' THEN '[ATN_SiteAttendance].[AD02] DESC'
                        WHEN 'AD13' THEN '[ATN_SiteAttendance].[AD13]'
                        WHEN 'AD13 DESC' THEN '[ATN_SiteAttendance].[AD13] DESC'
                        WHEN 'AD12' THEN '[ATN_SiteAttendance].[AD12]'
                        WHEN 'AD12 DESC' THEN '[ATN_SiteAttendance].[AD12] DESC'
                        WHEN 'AD15' THEN '[ATN_SiteAttendance].[AD15]'
                        WHEN 'AD15 DESC' THEN '[ATN_SiteAttendance].[AD15] DESC'
                        WHEN 'AD14' THEN '[ATN_SiteAttendance].[AD14]'
                        WHEN 'AD14 DESC' THEN '[ATN_SiteAttendance].[AD14] DESC'
                        WHEN 'AD09' THEN '[ATN_SiteAttendance].[AD09]'
                        WHEN 'AD09 DESC' THEN '[ATN_SiteAttendance].[AD09] DESC'
                        WHEN 'AD08' THEN '[ATN_SiteAttendance].[AD08]'
                        WHEN 'AD08 DESC' THEN '[ATN_SiteAttendance].[AD08] DESC'
                        WHEN 'AD11' THEN '[ATN_SiteAttendance].[AD11]'
                        WHEN 'AD11 DESC' THEN '[ATN_SiteAttendance].[AD11] DESC'
                        WHEN 'AD10' THEN '[ATN_SiteAttendance].[AD10]'
                        WHEN 'AD10 DESC' THEN '[ATN_SiteAttendance].[AD10] DESC'
                        WHEN 'SN22' THEN '[ATN_SiteAttendance].[SN22]'
                        WHEN 'SN22 DESC' THEN '[ATN_SiteAttendance].[SN22] DESC'
                        WHEN 'SN30' THEN '[ATN_SiteAttendance].[SN30]'
                        WHEN 'SN30 DESC' THEN '[ATN_SiteAttendance].[SN30] DESC'
                        WHEN 'SN20' THEN '[ATN_SiteAttendance].[SN20]'
                        WHEN 'SN20 DESC' THEN '[ATN_SiteAttendance].[SN20] DESC'
                        WHEN 'SN23' THEN '[ATN_SiteAttendance].[SN23]'
                        WHEN 'SN23 DESC' THEN '[ATN_SiteAttendance].[SN23] DESC'
                        WHEN 'SN11' THEN '[ATN_SiteAttendance].[SN11]'
                        WHEN 'SN11 DESC' THEN '[ATN_SiteAttendance].[SN11] DESC'
                        WHEN 'SN14' THEN '[ATN_SiteAttendance].[SN14]'
                        WHEN 'SN14 DESC' THEN '[ATN_SiteAttendance].[SN14] DESC'
                        WHEN 'SN13' THEN '[ATN_SiteAttendance].[SN13]'
                        WHEN 'SN13 DESC' THEN '[ATN_SiteAttendance].[SN13] DESC'
                        WHEN 'SN12' THEN '[ATN_SiteAttendance].[SN12]'
                        WHEN 'SN12 DESC' THEN '[ATN_SiteAttendance].[SN12] DESC'
                        WHEN 'SN06' THEN '[ATN_SiteAttendance].[SN06]'
                        WHEN 'SN06 DESC' THEN '[ATN_SiteAttendance].[SN06] DESC'
                        WHEN 'SN10' THEN '[ATN_SiteAttendance].[SN10]'
                        WHEN 'SN10 DESC' THEN '[ATN_SiteAttendance].[SN10] DESC'
                        WHEN 'SN31' THEN '[ATN_SiteAttendance].[SN31]'
                        WHEN 'SN31 DESC' THEN '[ATN_SiteAttendance].[SN31] DESC'
                        WHEN 'SN25' THEN '[ATN_SiteAttendance].[SN25]'
                        WHEN 'SN25 DESC' THEN '[ATN_SiteAttendance].[SN25] DESC'
                        WHEN 'SN18' THEN '[ATN_SiteAttendance].[SN18]'
                        WHEN 'SN18 DESC' THEN '[ATN_SiteAttendance].[SN18] DESC'
                        WHEN 'SN24' THEN '[ATN_SiteAttendance].[SN24]'
                        WHEN 'SN24 DESC' THEN '[ATN_SiteAttendance].[SN24] DESC'
                        WHEN 'PD31' THEN '[ATN_SiteAttendance].[PD31]'
                        WHEN 'PD31 DESC' THEN '[ATN_SiteAttendance].[PD31] DESC'
                        WHEN 'SN21' THEN '[ATN_SiteAttendance].[SN21]'
                        WHEN 'SN21 DESC' THEN '[ATN_SiteAttendance].[SN21] DESC'
                        WHEN 'SN16' THEN '[ATN_SiteAttendance].[SN16]'
                        WHEN 'SN16 DESC' THEN '[ATN_SiteAttendance].[SN16] DESC'
                        WHEN 'SN03' THEN '[ATN_SiteAttendance].[SN03]'
                        WHEN 'SN03 DESC' THEN '[ATN_SiteAttendance].[SN03] DESC'
                        WHEN 'SN27' THEN '[ATN_SiteAttendance].[SN27]'
                        WHEN 'SN27 DESC' THEN '[ATN_SiteAttendance].[SN27] DESC'
                        WHEN 'SN28' THEN '[ATN_SiteAttendance].[SN28]'
                        WHEN 'SN28 DESC' THEN '[ATN_SiteAttendance].[SN28] DESC'
                        WHEN 'PD10' THEN '[ATN_SiteAttendance].[PD10]'
                        WHEN 'PD10 DESC' THEN '[ATN_SiteAttendance].[PD10] DESC'
                        WHEN 'SN19' THEN '[ATN_SiteAttendance].[SN19]'
                        WHEN 'SN19 DESC' THEN '[ATN_SiteAttendance].[SN19] DESC'
                        WHEN 'SN02' THEN '[ATN_SiteAttendance].[SN02]'
                        WHEN 'SN02 DESC' THEN '[ATN_SiteAttendance].[SN02] DESC'
                        WHEN 'SN17' THEN '[ATN_SiteAttendance].[SN17]'
                        WHEN 'SN17 DESC' THEN '[ATN_SiteAttendance].[SN17] DESC'
                        WHEN 'SN15' THEN '[ATN_SiteAttendance].[SN15]'
                        WHEN 'SN15 DESC' THEN '[ATN_SiteAttendance].[SN15] DESC'
                        WHEN 'SN26' THEN '[ATN_SiteAttendance].[SN26]'
                        WHEN 'SN26 DESC' THEN '[ATN_SiteAttendance].[SN26] DESC'
                        WHEN 'PD22' THEN '[ATN_SiteAttendance].[PD22]'
                        WHEN 'PD22 DESC' THEN '[ATN_SiteAttendance].[PD22] DESC'
                        WHEN 'PD21' THEN '[ATN_SiteAttendance].[PD21]'
                        WHEN 'PD21 DESC' THEN '[ATN_SiteAttendance].[PD21] DESC'
                        WHEN 'SN29' THEN '[ATN_SiteAttendance].[SN29]'
                        WHEN 'SN29 DESC' THEN '[ATN_SiteAttendance].[SN29] DESC'
                        WHEN 'PD23' THEN '[ATN_SiteAttendance].[PD23]'
                        WHEN 'PD23 DESC' THEN '[ATN_SiteAttendance].[PD23] DESC'
                        WHEN 'SN01' THEN '[ATN_SiteAttendance].[SN01]'
                        WHEN 'SN01 DESC' THEN '[ATN_SiteAttendance].[SN01] DESC'
                        WHEN 'PD26' THEN '[ATN_SiteAttendance].[PD26]'
                        WHEN 'PD26 DESC' THEN '[ATN_SiteAttendance].[PD26] DESC'
                        WHEN 'PD01' THEN '[ATN_SiteAttendance].[PD01]'
                        WHEN 'PD01 DESC' THEN '[ATN_SiteAttendance].[PD01] DESC'
                        WHEN 'ATN_ApplicationStatus1_Description' THEN '[ATN_ApplicationStatus1].[Description]'
                        WHEN 'ATN_ApplicationStatus1_Description DESC' THEN '[ATN_ApplicationStatus1].[Description] DESC'
                        WHEN 'ATN_FinYear2_Description' THEN '[ATN_FinYear2].[Description]'
                        WHEN 'ATN_FinYear2_Description DESC' THEN '[ATN_FinYear2].[Description] DESC'
                        WHEN 'ATN_Months3_Description' THEN '[ATN_Months3].[Description]'
                        WHEN 'ATN_Months3_Description DESC' THEN '[ATN_Months3].[Description] DESC'
                        WHEN 'ATN_SAStatus4_Description' THEN '[ATN_SAStatus4].[Description]'
                        WHEN 'ATN_SAStatus4_Description DESC' THEN '[ATN_SAStatus4].[Description] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees5].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'HRM_Employees6_EmployeeName' THEN '[HRM_Employees6].[EmployeeName]'
                        WHEN 'HRM_Employees6_EmployeeName DESC' THEN '[HRM_Employees6].[EmployeeName] DESC'
                        WHEN 'HRM_Employees7_EmployeeName' THEN '[HRM_Employees7].[EmployeeName]'
                        WHEN 'HRM_Employees7_EmployeeName DESC' THEN '[HRM_Employees7].[EmployeeName] DESC'
                        WHEN 'ATN_SABySI1_SiteName' THEN '[A1].[SiteName]'
                        WHEN 'ATN_SABySI1_SiteName DESC' THEN '[A1].[SiteName] DESC'
                        WHEN 'ATN_SABySI3_SiteName' THEN '[A3].[SiteName]'
                        WHEN 'ATN_SABySI3_SiteName DESC' THEN '[A3].[SiteName] DESC'
                        WHEN 'ATN_SABySI4_SiteName' THEN '[A4].[SiteName]'
                        WHEN 'ATN_SABySI4_SiteName DESC' THEN '[A4].[SiteName] DESC'
                        WHEN 'ATN_SABySI5_SiteName' THEN '[A5].[SiteName]'
                        WHEN 'ATN_SABySI5_SiteName DESC' THEN '[A5].[SiteName] DESC'
                        WHEN 'ATN_SABySI6_SiteName' THEN '[A6].[SiteName]'
                        WHEN 'ATN_SABySI6_SiteName DESC' THEN '[A6].[SiteName] DESC'
                        WHEN 'ATN_SABySI7_SiteName' THEN '[A7].[SiteName]'
                        WHEN 'ATN_SABySI7_SiteName DESC' THEN '[A7].[SiteName] DESC'
                        WHEN 'ATN_SABySI8_SiteName' THEN '[A8].[SiteName]'
                        WHEN 'ATN_SABySI8_SiteName DESC' THEN '[A8].[SiteName] DESC'
                        WHEN 'ATN_SABySI9_SiteName' THEN '[A9].[SiteName]'
                        WHEN 'ATN_SABySI9_SiteName DESC' THEN '[A9].[SiteName] DESC'
                        WHEN 'ATN_SABySI10_SiteName' THEN '[A10].[SiteName]'
                        WHEN 'ATN_SABySI10_SiteName DESC' THEN '[A10].[SiteName] DESC'
                        WHEN 'ATN_SABySI11_SiteName' THEN '[A11].[SiteName]'
                        WHEN 'ATN_SABySI11_SiteName DESC' THEN '[A11].[SiteName] DESC'
                        WHEN 'ATN_SABySI12_SiteName' THEN '[A12].[SiteName]'
                        WHEN 'ATN_SABySI12_SiteName DESC' THEN '[A12].[SiteName] DESC'
                        WHEN 'ATN_SABySI13_SiteName' THEN '[A13].[SiteName]'
                        WHEN 'ATN_SABySI13_SiteName DESC' THEN '[A13].[SiteName] DESC'
                        WHEN 'ATN_SABySI14_SiteName' THEN '[A14].[SiteName]'
                        WHEN 'ATN_SABySI14_SiteName DESC' THEN '[A14].[SiteName] DESC'
                        WHEN 'ATN_SABySI15_SiteName' THEN '[A15].[SiteName]'
                        WHEN 'ATN_SABySI15_SiteName DESC' THEN '[A15].[SiteName] DESC'
                        WHEN 'ATN_SABySI16_SiteName' THEN '[A16].[SiteName]'
                        WHEN 'ATN_SABySI16_SiteName DESC' THEN '[A16].[SiteName] DESC'
                        WHEN 'ATN_SABySI17_SiteName' THEN '[A17].[SiteName]'
                        WHEN 'ATN_SABySI17_SiteName DESC' THEN '[A17].[SiteName] DESC'
                        WHEN 'ATN_SABySI18_SiteName' THEN '[A18].[SiteName]'
                        WHEN 'ATN_SABySI18_SiteName DESC' THEN '[A18].[SiteName] DESC'
                        WHEN 'ATN_SABySI19_SiteName' THEN '[A19].[SiteName]'
                        WHEN 'ATN_SABySI19_SiteName DESC' THEN '[A19].[SiteName] DESC'
                        WHEN 'ATN_SABySI20_SiteName' THEN '[A20].[SiteName]'
                        WHEN 'ATN_SABySI20_SiteName DESC' THEN '[A20].[SiteName] DESC'
                        WHEN 'ATN_SABySI21_SiteName' THEN '[A21].[SiteName]'
                        WHEN 'ATN_SABySI21_SiteName DESC' THEN '[A21].[SiteName] DESC'
                        WHEN 'ATN_SABySI22_SiteName' THEN '[A22].[SiteName]'
                        WHEN 'ATN_SABySI22_SiteName DESC' THEN '[A22].[SiteName] DESC'
                        WHEN 'ATN_SABySI23_SiteName' THEN '[A23].[SiteName]'
                        WHEN 'ATN_SABySI23_SiteName DESC' THEN '[A23].[SiteName] DESC'
                        WHEN 'ATN_SABySI24_SiteName' THEN '[A24].[SiteName]'
                        WHEN 'ATN_SABySI24_SiteName DESC' THEN '[A24].[SiteName] DESC'
                        WHEN 'ATN_SABySI25_SiteName' THEN '[A25].[SiteName]'
                        WHEN 'ATN_SABySI25_SiteName DESC' THEN '[A25].[SiteName] DESC'
                        WHEN 'ATN_SABySI26_SiteName' THEN '[A26].[SiteName]'
                        WHEN 'ATN_SABySI26_SiteName DESC' THEN '[A26].[SiteName] DESC'
                        WHEN 'ATN_SABySI27_SiteName' THEN '[A27].[SiteName]'
                        WHEN 'ATN_SABySI27_SiteName DESC' THEN '[A27].[SiteName] DESC'
                        WHEN 'ATN_SABySI28_SiteName' THEN '[A28].[SiteName]'
                        WHEN 'ATN_SABySI28_SiteName DESC' THEN '[A28].[SiteName] DESC'
                        WHEN 'ATN_SABySI29_SiteName' THEN '[A29].[SiteName]'
                        WHEN 'ATN_SABySI29_SiteName DESC' THEN '[A29].[SiteName] DESC'
                        WHEN 'ATN_SABySI30_SiteName' THEN '[A30].[SiteName]'
                        WHEN 'ATN_SABySI30_SiteName DESC' THEN '[A30].[SiteName] DESC'
                        WHEN 'ATN_SABySI31_SiteName' THEN '[A31].[SiteName]'
                        WHEN 'ATN_SABySI31_SiteName DESC' THEN '[A31].[SiteName] DESC'
                        WHEN 'ATN_SABySI2_SiteName' THEN '[A2].[SiteName]'
                        WHEN 'ATN_SABySI2_SiteName DESC' THEN '[A2].[SiteName] DESC'
                        WHEN 'VerifierRemarks' THEN '[ATN_SiteAttendance].[VerifierRemarks]'
                        WHEN 'VerifierRemarks DESC' THEN '[ATN_SiteAttendance].[VerifierRemarks] DESC'
                        WHEN 'VerifiedBy' THEN '[ATN_SiteAttendance].[VerifiedBy]'
                        WHEN 'VerifiedBy DESC' THEN '[ATN_SiteAttendance].[VerifiedBy] DESC'
                        WHEN 'VerifiedOn' THEN '[ATN_SiteAttendance].[VerifiedOn]'
                        WHEN 'VerifiedOn DESC' THEN '[ATN_SiteAttendance].[VerifiedOn] DESC'
                        WHEN 'HRM_Employees8_EmployeeName' THEN '[HRM_Employees8].[EmployeeName]'
                        WHEN 'HRM_Employees8_EmployeeName DESC' THEN '[HRM_Employees8].[EmployeeName] DESC'
                        ELSE '[ATN_SiteAttendance].[FinYear],[ATN_SiteAttendance].[MonthID],[ATN_SiteAttendance].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ATN_SiteAttendance].* ,
    [ATN_ApplicationStatus1].[Description] AS ATN_ApplicationStatus1_Description,
    [ATN_FinYear2].[Description] AS ATN_FinYear2_Description,
    [ATN_Months3].[Description] AS ATN_Months3_Description,
    [ATN_SAStatus4].[Description] AS ATN_SAStatus4_Description,
    [HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
    [HRM_Employees6].[EmployeeName] AS HRM_Employees6_EmployeeName,
    [HRM_Employees7].[EmployeeName] AS HRM_Employees7_EmployeeName,
    [HRM_Employees8].[EmployeeName] AS HRM_Employees8_EmployeeName, 
    [A1].[SiteName] AS ATN_SABySI1_SiteName,
    [A3].[SiteName] AS ATN_SABySI3_SiteName,
    [A4].[SiteName] AS ATN_SABySI4_SiteName,
    [A5].[SiteName] AS ATN_SABySI5_SiteName,
    [A6].[SiteName] AS ATN_SABySI6_SiteName,
    [A7].[SiteName] AS ATN_SABySI7_SiteName,
    [A8].[SiteName] AS ATN_SABySI8_SiteName,
    [A9].[SiteName] AS ATN_SABySI9_SiteName,
    [A10].[SiteName] AS ATN_SABySI10_SiteName,
    [A11].[SiteName] AS ATN_SABySI11_SiteName,
    [A12].[SiteName] AS ATN_SABySI12_SiteName,
    [A13].[SiteName] AS ATN_SABySI13_SiteName,
    [A14].[SiteName] AS ATN_SABySI14_SiteName,
    [A15].[SiteName] AS ATN_SABySI15_SiteName,
    [A16].[SiteName] AS ATN_SABySI16_SiteName,
    [A17].[SiteName] AS ATN_SABySI17_SiteName,
    [A18].[SiteName] AS ATN_SABySI18_SiteName,
    [A19].[SiteName] AS ATN_SABySI19_SiteName,
    [A20].[SiteName] AS ATN_SABySI20_SiteName,
    [A21].[SiteName] AS ATN_SABySI21_SiteName,
    [A22].[SiteName] AS ATN_SABySI22_SiteName,
    [A23].[SiteName] AS ATN_SABySI23_SiteName,
    [A24].[SiteName] AS ATN_SABySI24_SiteName,
    [A25].[SiteName] AS ATN_SABySI25_SiteName,
    [A26].[SiteName] AS ATN_SABySI26_SiteName,
    [A27].[SiteName] AS ATN_SABySI27_SiteName,
    [A28].[SiteName] AS ATN_SABySI28_SiteName,
    [A29].[SiteName] AS ATN_SABySI29_SiteName,
    [A30].[SiteName] AS ATN_SABySI30_SiteName,
    [A31].[SiteName] AS ATN_SABySI31_SiteName,
    [A2].[SiteName] AS ATN_SABySI2_SiteName 
  FROM [ATN_SiteAttendance] 
      INNER JOIN #PageIndex
          ON [ATN_SiteAttendance].[FinYear] = #PageIndex.FinYear
          AND [ATN_SiteAttendance].[MonthID] = #PageIndex.MonthID
          AND [ATN_SiteAttendance].[CardNo] = #PageIndex.CardNo
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees8]
    ON [ATN_SiteAttendance].[VerifiedBy] = [HRM_Employees8].[CardNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A1]
    ON [ATN_SiteAttendance].[SN01] = [A1].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A3]
    ON [ATN_SiteAttendance].[SN03] = [A3].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A4]
    ON [ATN_SiteAttendance].[SN04] = [A4].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A5]
    ON [ATN_SiteAttendance].[SN05] = [A5].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A6]
    ON [ATN_SiteAttendance].[SN06] = [A6].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A7]
    ON [ATN_SiteAttendance].[SN07] = [A7].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A8]
    ON [ATN_SiteAttendance].[SN08] = [A8].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A9]
    ON [ATN_SiteAttendance].[SN09] = [A9].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A10]
    ON [ATN_SiteAttendance].[SN10] = [A10].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A11]
    ON [ATN_SiteAttendance].[SN11] = [A11].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A12]
    ON [ATN_SiteAttendance].[SN12] = [A12].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A13]
    ON [ATN_SiteAttendance].[SN13] = [A13].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A14]
    ON [ATN_SiteAttendance].[SN14] = [A14].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A15]
    ON [ATN_SiteAttendance].[SN15] = [A15].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A16]
    ON [ATN_SiteAttendance].[SN16] = [A16].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A17]
    ON [ATN_SiteAttendance].[SN17] = [A17].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A18]
    ON [ATN_SiteAttendance].[SN18] = [A18].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A19]
    ON [ATN_SiteAttendance].[SN19] = [A19].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A20]
    ON [ATN_SiteAttendance].[SN20] = [A20].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A21]
    ON [ATN_SiteAttendance].[SN21] = [A21].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A22]
    ON [ATN_SiteAttendance].[SN22] = [A22].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A23]
    ON [ATN_SiteAttendance].[SN23] = [A23].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A24]
    ON [ATN_SiteAttendance].[SN24] = [A24].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A25]
    ON [ATN_SiteAttendance].[SN25] = [A25].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A26]
    ON [ATN_SiteAttendance].[SN26] = [A26].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A27]
    ON [ATN_SiteAttendance].[SN27] = [A27].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A28]
    ON [ATN_SiteAttendance].[SN28] = [A28].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A29]
    ON [ATN_SiteAttendance].[SN29] = [A29].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A30]
    ON [ATN_SiteAttendance].[SN30] = [A30].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A31]
    ON [ATN_SiteAttendance].[SN31] = [A31].[SerialNo]
  LEFT OUTER JOIN [ATN_SABySI]AS [A2]
    ON [ATN_SiteAttendance].[SN02] = [A2].[SerialNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
