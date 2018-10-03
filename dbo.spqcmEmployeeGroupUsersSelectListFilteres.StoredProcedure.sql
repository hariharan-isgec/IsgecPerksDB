USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersSelectListFilteres]
  @Filter_GroupiD Int,
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
 ,GroupiD Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupiD'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_EmployeeGroupUsers].[GroupiD]'
  SET @LGSQL = @LGSQL + ', [QCM_EmployeeGroupUsers].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_EmployeeGroupUsers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_EmployeeGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups2]'
  SET @LGSQL = @LGSQL + '    ON [QCM_EmployeeGroupUsers].[GroupiD] = [QCM_EmployeeGroups2].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupiD > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_EmployeeGroupUsers].[GroupiD] = ' + STR(@Filter_GroupiD)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupiD' THEN '[QCM_EmployeeGroupUsers].[GroupiD]'
                        WHEN 'GroupiD DESC' THEN '[QCM_EmployeeGroupUsers].[GroupiD] DESC'
                        WHEN 'CardNo' THEN '[QCM_EmployeeGroupUsers].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[QCM_EmployeeGroupUsers].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'QCM_EmployeeGroups2_Description' THEN '[QCM_EmployeeGroups2].[Description]'
                        WHEN 'QCM_EmployeeGroups2_Description DESC' THEN '[QCM_EmployeeGroups2].[Description] DESC'
                        ELSE '[QCM_EmployeeGroupUsers].[GroupiD],[QCM_EmployeeGroupUsers].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_EmployeeGroupUsers].[GroupiD] ,
		[QCM_EmployeeGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_EmployeeGroups2].[Description] AS QCM_EmployeeGroups2_Description 
  FROM [QCM_EmployeeGroupUsers] 
    	INNER JOIN #PageIndex
          ON [QCM_EmployeeGroupUsers].[GroupiD] = #PageIndex.GroupiD
          AND [QCM_EmployeeGroupUsers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_EmployeeGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups2]
    ON [QCM_EmployeeGroupUsers].[GroupiD] = [QCM_EmployeeGroups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
