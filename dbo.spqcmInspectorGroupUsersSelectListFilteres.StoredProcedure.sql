USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersSelectListFilteres]
  @Filter_GroupID Int,
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
 ,GroupID Int NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectorGroupUsers].[GroupID]'
  SET @LGSQL = @LGSQL + ', [QCM_InspectorGroupUsers].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectorGroupUsers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_InspectorGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]'
  SET @LGSQL = @LGSQL + '    ON [QCM_InspectorGroupUsers].[GroupID] = [QCM_InspectorGroups2].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectorGroupUsers].[GroupID] = ' + STR(@Filter_GroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[QCM_InspectorGroupUsers].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[QCM_InspectorGroupUsers].[GroupID] DESC'
                        WHEN 'CardNo' THEN '[QCM_InspectorGroupUsers].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[QCM_InspectorGroupUsers].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'QCM_InspectorGroups2_Description' THEN '[QCM_InspectorGroups2].[Description]'
                        WHEN 'QCM_InspectorGroups2_Description DESC' THEN '[QCM_InspectorGroups2].[Description] DESC'
                        ELSE '[QCM_InspectorGroupUsers].[GroupID],[QCM_InspectorGroupUsers].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectorGroupUsers].[GroupID] ,
		[QCM_InspectorGroupUsers].[CardNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[QCM_InspectorGroups2].[Description] AS QCM_InspectorGroups2_Description 
  FROM [QCM_InspectorGroupUsers] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectorGroupUsers].[GroupID] = #PageIndex.GroupID
          AND [QCM_InspectorGroupUsers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [QCM_InspectorGroupUsers].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupUsers].[GroupID] = [QCM_InspectorGroups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
