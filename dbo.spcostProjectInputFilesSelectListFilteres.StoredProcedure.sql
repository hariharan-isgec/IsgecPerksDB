USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesSelectListFilteres]
  @Filter_ProjectGroupID Int,
  @Filter_FinYear Int,
  @Filter_Quarter Int,
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
 ,ProjectGroupID Int NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectGroupID'
  SET @LGSQL = @LGSQL + ', FinYear'
  SET @LGSQL = @LGSQL + ', Quarter'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ProjectInputFiles].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectInputFiles].[FinYear]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectInputFiles].[Quarter]'
  SET @LGSQL = @LGSQL + ', [COST_ProjectInputFiles].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectInputFiles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_FinYear] AS [COST_FinYear1]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectInputFiles].[FinYear] = [COST_FinYear1].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups2]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectGroups2].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ProjectsInput] AS [COST_ProjectsInput3]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectsInput3].[ProjectGroupID]'
  SET @LGSQL = @LGSQL + '    AND [COST_ProjectInputFiles].[FinYear] = [COST_ProjectsInput3].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [COST_ProjectInputFiles].[Quarter] = [COST_ProjectsInput3].[Quarter]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_Quarters] AS [COST_Quarters4]'
  SET @LGSQL = @LGSQL + '    ON [COST_ProjectInputFiles].[Quarter] = [COST_Quarters4].[Quarter]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectInputFiles].[ProjectGroupID] = ' + STR(@Filter_ProjectGroupID)
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectInputFiles].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_Quarter > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_ProjectInputFiles].[Quarter] = ' + STR(@Filter_Quarter)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectGroupID' THEN '[COST_ProjectInputFiles].[ProjectGroupID]'
                        WHEN 'ProjectGroupID DESC' THEN '[COST_ProjectInputFiles].[ProjectGroupID] DESC'
                        WHEN 'FinYear' THEN '[COST_ProjectInputFiles].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[COST_ProjectInputFiles].[FinYear] DESC'
                        WHEN 'Quarter' THEN '[COST_ProjectInputFiles].[Quarter]'
                        WHEN 'Quarter DESC' THEN '[COST_ProjectInputFiles].[Quarter] DESC'
                        WHEN 'SerialNo' THEN '[COST_ProjectInputFiles].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[COST_ProjectInputFiles].[SerialNo] DESC'
                        WHEN 'Description' THEN '[COST_ProjectInputFiles].[Description]'
                        WHEN 'Description DESC' THEN '[COST_ProjectInputFiles].[Description] DESC'
                        WHEN 'FileName' THEN '[COST_ProjectInputFiles].[FileName]'
                        WHEN 'FileName DESC' THEN '[COST_ProjectInputFiles].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[COST_ProjectInputFiles].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[COST_ProjectInputFiles].[DiskFile] DESC'
                        WHEN 'COST_FinYear1_Descpription' THEN '[COST_FinYear1].[Descpription]'
                        WHEN 'COST_FinYear1_Descpription DESC' THEN '[COST_FinYear1].[Descpription] DESC'
                        WHEN 'COST_ProjectGroups2_ProjectGroupDescription' THEN '[COST_ProjectGroups2].[ProjectGroupDescription]'
                        WHEN 'COST_ProjectGroups2_ProjectGroupDescription DESC' THEN '[COST_ProjectGroups2].[ProjectGroupDescription] DESC'
                        WHEN 'COST_ProjectsInput3_GroupOrderValueINR' THEN '[COST_ProjectsInput3].[GroupOrderValueINR]'
                        WHEN 'COST_ProjectsInput3_GroupOrderValueINR DESC' THEN '[COST_ProjectsInput3].[GroupOrderValueINR] DESC'
                        WHEN 'COST_Quarters4_Description' THEN '[COST_Quarters4].[Description]'
                        WHEN 'COST_Quarters4_Description DESC' THEN '[COST_Quarters4].[Description] DESC'
                        ELSE '[COST_ProjectInputFiles].[ProjectGroupID],[COST_ProjectInputFiles].[FinYear],[COST_ProjectInputFiles].[Quarter],[COST_ProjectInputFiles].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectInputFiles].* ,
    [COST_FinYear1].[Descpription] AS COST_FinYear1_Descpription,
    [COST_ProjectGroups2].[ProjectGroupDescription] AS COST_ProjectGroups2_ProjectGroupDescription,
    [COST_ProjectsInput3].[GroupOrderValueINR] AS COST_ProjectsInput3_GroupOrderValueINR,
    [COST_Quarters4].[Description] AS COST_Quarters4_Description 
  FROM [COST_ProjectInputFiles] 
      INNER JOIN #PageIndex
          ON [COST_ProjectInputFiles].[ProjectGroupID] = #PageIndex.ProjectGroupID
          AND [COST_ProjectInputFiles].[FinYear] = #PageIndex.FinYear
          AND [COST_ProjectInputFiles].[Quarter] = #PageIndex.Quarter
          AND [COST_ProjectInputFiles].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [COST_FinYear] AS [COST_FinYear1]
    ON [COST_ProjectInputFiles].[FinYear] = [COST_FinYear1].[FinYear]
  INNER JOIN [COST_ProjectGroups] AS [COST_ProjectGroups2]
    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectGroups2].[ProjectGroupID]
  INNER JOIN [COST_ProjectsInput] AS [COST_ProjectsInput3]
    ON [COST_ProjectInputFiles].[ProjectGroupID] = [COST_ProjectsInput3].[ProjectGroupID]
    AND [COST_ProjectInputFiles].[FinYear] = [COST_ProjectsInput3].[FinYear]
    AND [COST_ProjectInputFiles].[Quarter] = [COST_ProjectsInput3].[Quarter]
  INNER JOIN [COST_Quarters] AS [COST_Quarters4]
    ON [COST_ProjectInputFiles].[Quarter] = [COST_Quarters4].[Quarter]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
