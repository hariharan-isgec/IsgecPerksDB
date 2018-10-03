USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGSelectListFilteres]
  @Filter_InspectorGroupID Int,
  @Filter_EmployeeGroupID Int,
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
 ,InspectorGroupID Int NOT NULL
 ,EmployeeGroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'InspectorGroupID'
  SET @LGSQL = @LGSQL + ', EmployeeGroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID]'
  SET @LGSQL = @LGSQL + ', [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectorGroupEmployeeGroup] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = [QCM_EmployeeGroups1].[GroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]'
  SET @LGSQL = @LGSQL + '    ON [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = [QCM_InspectorGroups2].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_InspectorGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = ' + STR(@Filter_InspectorGroupID)
  IF (@Filter_EmployeeGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = ' + STR(@Filter_EmployeeGroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'InspectorGroupID' THEN '[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID]'
                        WHEN 'InspectorGroupID DESC' THEN '[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] DESC'
                        WHEN 'EmployeeGroupID' THEN '[QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID]'
                        WHEN 'EmployeeGroupID DESC' THEN '[QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] DESC'
                        WHEN 'QCM_EmployeeGroups1_Description' THEN '[QCM_EmployeeGroups1].[Description]'
                        WHEN 'QCM_EmployeeGroups1_Description DESC' THEN '[QCM_EmployeeGroups1].[Description] DESC'
                        WHEN 'QCM_InspectorGroups2_Description' THEN '[QCM_InspectorGroups2].[Description]'
                        WHEN 'QCM_InspectorGroups2_Description DESC' THEN '[QCM_InspectorGroups2].[Description] DESC'
                        ELSE '[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID],[QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] ,
		[QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] ,
		[QCM_EmployeeGroups1].[Description] AS QCM_EmployeeGroups1_Description,
		[QCM_InspectorGroups2].[Description] AS QCM_InspectorGroups2_Description 
  FROM [QCM_InspectorGroupEmployeeGroup] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = #PageIndex.InspectorGroupID
          AND [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = #PageIndex.EmployeeGroupID
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups1]
    ON [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = [QCM_EmployeeGroups1].[GroupID]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = [QCM_InspectorGroups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
