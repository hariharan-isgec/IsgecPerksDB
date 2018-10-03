USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDaysSelectListFilteres]
  @Filter_SerialNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_SABySIDays].[SerialNo]'
  SET @LGSQL = @LGSQL + ', [ATN_SABySIDays].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_SABySIDays] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ATN_SABySI] AS [ATN_SABySI1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySIDays].[SerialNo] = [ATN_SABySI1].[SerialNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [ATN_SABySIDays].[CardNo] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SerialNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [ATN_SABySIDays].[SerialNo] = ' + STR(@Filter_SerialNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ATN_SABySIDays].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ATN_SABySIDays].[SerialNo] DESC'
                        WHEN 'CardNo' THEN '[ATN_SABySIDays].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_SABySIDays].[CardNo] DESC'
                        WHEN 'D22' THEN '[ATN_SABySIDays].[D22]'
                        WHEN 'D22 DESC' THEN '[ATN_SABySIDays].[D22] DESC'
                        WHEN 'D23' THEN '[ATN_SABySIDays].[D23]'
                        WHEN 'D23 DESC' THEN '[ATN_SABySIDays].[D23] DESC'
                        WHEN 'D24' THEN '[ATN_SABySIDays].[D24]'
                        WHEN 'D24 DESC' THEN '[ATN_SABySIDays].[D24] DESC'
                        WHEN 'D21' THEN '[ATN_SABySIDays].[D21]'
                        WHEN 'D21 DESC' THEN '[ATN_SABySIDays].[D21] DESC'
                        WHEN 'D18' THEN '[ATN_SABySIDays].[D18]'
                        WHEN 'D18 DESC' THEN '[ATN_SABySIDays].[D18] DESC'
                        WHEN 'D19' THEN '[ATN_SABySIDays].[D19]'
                        WHEN 'D19 DESC' THEN '[ATN_SABySIDays].[D19] DESC'
                        WHEN 'D20' THEN '[ATN_SABySIDays].[D20]'
                        WHEN 'D20 DESC' THEN '[ATN_SABySIDays].[D20] DESC'
                        WHEN 'D25' THEN '[ATN_SABySIDays].[D25]'
                        WHEN 'D25 DESC' THEN '[ATN_SABySIDays].[D25] DESC'
                        WHEN 'D30' THEN '[ATN_SABySIDays].[D30]'
                        WHEN 'D30 DESC' THEN '[ATN_SABySIDays].[D30] DESC'
                        WHEN 'D31' THEN '[ATN_SABySIDays].[D31]'
                        WHEN 'D31 DESC' THEN '[ATN_SABySIDays].[D31] DESC'
                        WHEN 'Remarks' THEN '[ATN_SABySIDays].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ATN_SABySIDays].[Remarks] DESC'
                        WHEN 'D29' THEN '[ATN_SABySIDays].[D29]'
                        WHEN 'D29 DESC' THEN '[ATN_SABySIDays].[D29] DESC'
                        WHEN 'D26' THEN '[ATN_SABySIDays].[D26]'
                        WHEN 'D26 DESC' THEN '[ATN_SABySIDays].[D26] DESC'
                        WHEN 'D27' THEN '[ATN_SABySIDays].[D27]'
                        WHEN 'D27 DESC' THEN '[ATN_SABySIDays].[D27] DESC'
                        WHEN 'D28' THEN '[ATN_SABySIDays].[D28]'
                        WHEN 'D28 DESC' THEN '[ATN_SABySIDays].[D28] DESC'
                        WHEN 'D17' THEN '[ATN_SABySIDays].[D17]'
                        WHEN 'D17 DESC' THEN '[ATN_SABySIDays].[D17] DESC'
                        WHEN 'D06' THEN '[ATN_SABySIDays].[D06]'
                        WHEN 'D06 DESC' THEN '[ATN_SABySIDays].[D06] DESC'
                        WHEN 'D05' THEN '[ATN_SABySIDays].[D05]'
                        WHEN 'D05 DESC' THEN '[ATN_SABySIDays].[D05] DESC'
                        WHEN 'D08' THEN '[ATN_SABySIDays].[D08]'
                        WHEN 'D08 DESC' THEN '[ATN_SABySIDays].[D08] DESC'
                        WHEN 'D07' THEN '[ATN_SABySIDays].[D07]'
                        WHEN 'D07 DESC' THEN '[ATN_SABySIDays].[D07] DESC'
                        WHEN 'D02' THEN '[ATN_SABySIDays].[D02]'
                        WHEN 'D02 DESC' THEN '[ATN_SABySIDays].[D02] DESC'
                        WHEN 'D01' THEN '[ATN_SABySIDays].[D01]'
                        WHEN 'D01 DESC' THEN '[ATN_SABySIDays].[D01] DESC'
                        WHEN 'D04' THEN '[ATN_SABySIDays].[D04]'
                        WHEN 'D04 DESC' THEN '[ATN_SABySIDays].[D04] DESC'
                        WHEN 'D03' THEN '[ATN_SABySIDays].[D03]'
                        WHEN 'D03 DESC' THEN '[ATN_SABySIDays].[D03] DESC'
                        WHEN 'D14' THEN '[ATN_SABySIDays].[D14]'
                        WHEN 'D14 DESC' THEN '[ATN_SABySIDays].[D14] DESC'
                        WHEN 'D13' THEN '[ATN_SABySIDays].[D13]'
                        WHEN 'D13 DESC' THEN '[ATN_SABySIDays].[D13] DESC'
                        WHEN 'D16' THEN '[ATN_SABySIDays].[D16]'
                        WHEN 'D16 DESC' THEN '[ATN_SABySIDays].[D16] DESC'
                        WHEN 'D15' THEN '[ATN_SABySIDays].[D15]'
                        WHEN 'D15 DESC' THEN '[ATN_SABySIDays].[D15] DESC'
                        WHEN 'D10' THEN '[ATN_SABySIDays].[D10]'
                        WHEN 'D10 DESC' THEN '[ATN_SABySIDays].[D10] DESC'
                        WHEN 'D09' THEN '[ATN_SABySIDays].[D09]'
                        WHEN 'D09 DESC' THEN '[ATN_SABySIDays].[D09] DESC'
                        WHEN 'D12' THEN '[ATN_SABySIDays].[D12]'
                        WHEN 'D12 DESC' THEN '[ATN_SABySIDays].[D12] DESC'
                        WHEN 'D11' THEN '[ATN_SABySIDays].[D11]'
                        WHEN 'D11 DESC' THEN '[ATN_SABySIDays].[D11] DESC'
                        WHEN 'ATN_SABySI1_SiteName' THEN '[ATN_SABySI1].[SiteName]'
                        WHEN 'ATN_SABySI1_SiteName DESC' THEN '[ATN_SABySI1].[SiteName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        ELSE '[ATN_SABySIDays].[SerialNo],[ATN_SABySIDays].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ATN_SABySIDays].* ,
    [ATN_SABySI1].[SiteName] AS ATN_SABySI1_SiteName,
    [HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [ATN_SABySIDays] 
      INNER JOIN #PageIndex
          ON [ATN_SABySIDays].[SerialNo] = #PageIndex.SerialNo
          AND [ATN_SABySIDays].[CardNo] = #PageIndex.CardNo
  INNER JOIN [ATN_SABySI] AS [ATN_SABySI1]
    ON [ATN_SABySIDays].[SerialNo] = [ATN_SABySI1].[SerialNo]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_SABySIDays].[CardNo] = [HRM_Employees2].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
