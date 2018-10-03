USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDaysSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo, CardNo)
  SELECT [ATN_SABySIDays].[SerialNo], [ATN_SABySIDays].[CardNo] FROM [ATN_SABySIDays]
  INNER JOIN [ATN_SABySI] AS [ATN_SABySI1]
    ON [ATN_SABySIDays].[SerialNo] = [ATN_SABySI1].[SerialNo]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [ATN_SABySIDays].[CardNo] = [HRM_Employees2].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_SABySIDays].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D01],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D02],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D03],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D04],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D05],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D06],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D07],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D08],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D09],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D10],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D11],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D12],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D13],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D14],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D15],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D16],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D17],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D18],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D19],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D20],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D21],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D22],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D23],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D24],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D25],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D26],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D27],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D28],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D29],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D30],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[D31],'')) LIKE @KeyWord1
     OR STR(ISNULL([ATN_SABySIDays].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_SABySIDays].[Remarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [ATN_SABySIDays].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ATN_SABySIDays].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'CardNo' THEN [ATN_SABySIDays].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATN_SABySIDays].[CardNo] END DESC,
     CASE @OrderBy WHEN 'D22' THEN [ATN_SABySIDays].[D22] END,
     CASE @OrderBy WHEN 'D22 DESC' THEN [ATN_SABySIDays].[D22] END DESC,
     CASE @OrderBy WHEN 'D23' THEN [ATN_SABySIDays].[D23] END,
     CASE @OrderBy WHEN 'D23 DESC' THEN [ATN_SABySIDays].[D23] END DESC,
     CASE @OrderBy WHEN 'D24' THEN [ATN_SABySIDays].[D24] END,
     CASE @OrderBy WHEN 'D24 DESC' THEN [ATN_SABySIDays].[D24] END DESC,
     CASE @OrderBy WHEN 'D21' THEN [ATN_SABySIDays].[D21] END,
     CASE @OrderBy WHEN 'D21 DESC' THEN [ATN_SABySIDays].[D21] END DESC,
     CASE @OrderBy WHEN 'D18' THEN [ATN_SABySIDays].[D18] END,
     CASE @OrderBy WHEN 'D18 DESC' THEN [ATN_SABySIDays].[D18] END DESC,
     CASE @OrderBy WHEN 'D19' THEN [ATN_SABySIDays].[D19] END,
     CASE @OrderBy WHEN 'D19 DESC' THEN [ATN_SABySIDays].[D19] END DESC,
     CASE @OrderBy WHEN 'D20' THEN [ATN_SABySIDays].[D20] END,
     CASE @OrderBy WHEN 'D20 DESC' THEN [ATN_SABySIDays].[D20] END DESC,
     CASE @OrderBy WHEN 'D25' THEN [ATN_SABySIDays].[D25] END,
     CASE @OrderBy WHEN 'D25 DESC' THEN [ATN_SABySIDays].[D25] END DESC,
     CASE @OrderBy WHEN 'D30' THEN [ATN_SABySIDays].[D30] END,
     CASE @OrderBy WHEN 'D30 DESC' THEN [ATN_SABySIDays].[D30] END DESC,
     CASE @OrderBy WHEN 'D31' THEN [ATN_SABySIDays].[D31] END,
     CASE @OrderBy WHEN 'D31 DESC' THEN [ATN_SABySIDays].[D31] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ATN_SABySIDays].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ATN_SABySIDays].[Remarks] END DESC,
     CASE @OrderBy WHEN 'D29' THEN [ATN_SABySIDays].[D29] END,
     CASE @OrderBy WHEN 'D29 DESC' THEN [ATN_SABySIDays].[D29] END DESC,
     CASE @OrderBy WHEN 'D26' THEN [ATN_SABySIDays].[D26] END,
     CASE @OrderBy WHEN 'D26 DESC' THEN [ATN_SABySIDays].[D26] END DESC,
     CASE @OrderBy WHEN 'D27' THEN [ATN_SABySIDays].[D27] END,
     CASE @OrderBy WHEN 'D27 DESC' THEN [ATN_SABySIDays].[D27] END DESC,
     CASE @OrderBy WHEN 'D28' THEN [ATN_SABySIDays].[D28] END,
     CASE @OrderBy WHEN 'D28 DESC' THEN [ATN_SABySIDays].[D28] END DESC,
     CASE @OrderBy WHEN 'D17' THEN [ATN_SABySIDays].[D17] END,
     CASE @OrderBy WHEN 'D17 DESC' THEN [ATN_SABySIDays].[D17] END DESC,
     CASE @OrderBy WHEN 'D06' THEN [ATN_SABySIDays].[D06] END,
     CASE @OrderBy WHEN 'D06 DESC' THEN [ATN_SABySIDays].[D06] END DESC,
     CASE @OrderBy WHEN 'D05' THEN [ATN_SABySIDays].[D05] END,
     CASE @OrderBy WHEN 'D05 DESC' THEN [ATN_SABySIDays].[D05] END DESC,
     CASE @OrderBy WHEN 'D08' THEN [ATN_SABySIDays].[D08] END,
     CASE @OrderBy WHEN 'D08 DESC' THEN [ATN_SABySIDays].[D08] END DESC,
     CASE @OrderBy WHEN 'D07' THEN [ATN_SABySIDays].[D07] END,
     CASE @OrderBy WHEN 'D07 DESC' THEN [ATN_SABySIDays].[D07] END DESC,
     CASE @OrderBy WHEN 'D02' THEN [ATN_SABySIDays].[D02] END,
     CASE @OrderBy WHEN 'D02 DESC' THEN [ATN_SABySIDays].[D02] END DESC,
     CASE @OrderBy WHEN 'D01' THEN [ATN_SABySIDays].[D01] END,
     CASE @OrderBy WHEN 'D01 DESC' THEN [ATN_SABySIDays].[D01] END DESC,
     CASE @OrderBy WHEN 'D04' THEN [ATN_SABySIDays].[D04] END,
     CASE @OrderBy WHEN 'D04 DESC' THEN [ATN_SABySIDays].[D04] END DESC,
     CASE @OrderBy WHEN 'D03' THEN [ATN_SABySIDays].[D03] END,
     CASE @OrderBy WHEN 'D03 DESC' THEN [ATN_SABySIDays].[D03] END DESC,
     CASE @OrderBy WHEN 'D14' THEN [ATN_SABySIDays].[D14] END,
     CASE @OrderBy WHEN 'D14 DESC' THEN [ATN_SABySIDays].[D14] END DESC,
     CASE @OrderBy WHEN 'D13' THEN [ATN_SABySIDays].[D13] END,
     CASE @OrderBy WHEN 'D13 DESC' THEN [ATN_SABySIDays].[D13] END DESC,
     CASE @OrderBy WHEN 'D16' THEN [ATN_SABySIDays].[D16] END,
     CASE @OrderBy WHEN 'D16 DESC' THEN [ATN_SABySIDays].[D16] END DESC,
     CASE @OrderBy WHEN 'D15' THEN [ATN_SABySIDays].[D15] END,
     CASE @OrderBy WHEN 'D15 DESC' THEN [ATN_SABySIDays].[D15] END DESC,
     CASE @OrderBy WHEN 'D10' THEN [ATN_SABySIDays].[D10] END,
     CASE @OrderBy WHEN 'D10 DESC' THEN [ATN_SABySIDays].[D10] END DESC,
     CASE @OrderBy WHEN 'D09' THEN [ATN_SABySIDays].[D09] END,
     CASE @OrderBy WHEN 'D09 DESC' THEN [ATN_SABySIDays].[D09] END DESC,
     CASE @OrderBy WHEN 'D12' THEN [ATN_SABySIDays].[D12] END,
     CASE @OrderBy WHEN 'D12 DESC' THEN [ATN_SABySIDays].[D12] END DESC,
     CASE @OrderBy WHEN 'D11' THEN [ATN_SABySIDays].[D11] END,
     CASE @OrderBy WHEN 'D11 DESC' THEN [ATN_SABySIDays].[D11] END DESC,
     CASE @OrderBy WHEN 'ATN_SABySI1_SiteName' THEN [ATN_SABySI1].[SiteName] END,
     CASE @OrderBy WHEN 'ATN_SABySI1_SiteName DESC' THEN [ATN_SABySI1].[SiteName] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC 

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
