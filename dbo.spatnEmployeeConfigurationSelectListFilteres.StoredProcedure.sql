USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeeConfigurationSelectListFilteres]
  @Filter_CardNo NVarChar(8),
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
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_EmployeeConfiguration].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_EmployeeConfiguration] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_EmployeeConfiguration].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_EmployeeConfiguration].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[ATN_EmployeeConfiguration].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_EmployeeConfiguration].[CardNo] DESC'
                        WHEN 'SendVerifyMail' THEN '[ATN_EmployeeConfiguration].[SendVerifyMail]'
                        WHEN 'SendVerifyMail DESC' THEN '[ATN_EmployeeConfiguration].[SendVerifyMail] DESC'
                        WHEN 'SendApproveMail' THEN '[ATN_EmployeeConfiguration].[SendApproveMail]'
                        WHEN 'SendApproveMail DESC' THEN '[ATN_EmployeeConfiguration].[SendApproveMail] DESC'
                        WHEN 'AttendanceThroughExcel' THEN '[ATN_EmployeeConfiguration].[AttendanceThroughExcel]'
                        WHEN 'AttendanceThroughExcel DESC' THEN '[ATN_EmployeeConfiguration].[AttendanceThroughExcel] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        ELSE '[ATN_EmployeeConfiguration].[CardNo]'
                    END
  EXEC (@LGSQL)

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
