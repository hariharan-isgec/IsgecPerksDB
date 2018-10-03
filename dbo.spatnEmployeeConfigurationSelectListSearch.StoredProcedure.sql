USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeeConfigurationSelectListSearch]
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
 ,CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [ATN_EmployeeConfiguration].[CardNo] FROM [ATN_EmployeeConfiguration]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_EmployeeConfiguration].[CardNo] = [HRM_Employees1].[CardNo]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_EmployeeConfiguration].[CardNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [ATN_EmployeeConfiguration].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATN_EmployeeConfiguration].[CardNo] END DESC,
     CASE @OrderBy WHEN 'SendVerifyMail' THEN [ATN_EmployeeConfiguration].[SendVerifyMail] END,
     CASE @OrderBy WHEN 'SendVerifyMail DESC' THEN [ATN_EmployeeConfiguration].[SendVerifyMail] END DESC,
     CASE @OrderBy WHEN 'SendApproveMail' THEN [ATN_EmployeeConfiguration].[SendApproveMail] END,
     CASE @OrderBy WHEN 'SendApproveMail DESC' THEN [ATN_EmployeeConfiguration].[SendApproveMail] END DESC,
     CASE @OrderBy WHEN 'AttendanceThroughExcel' THEN [ATN_EmployeeConfiguration].[AttendanceThroughExcel] END,
     CASE @OrderBy WHEN 'AttendanceThroughExcel DESC' THEN [ATN_EmployeeConfiguration].[AttendanceThroughExcel] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ATN_EmployeeConfiguration].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_EmployeeConfiguration] 
      INNER JOIN #PageIndex
          ON [ATN_EmployeeConfiguration].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_EmployeeConfiguration].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
