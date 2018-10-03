USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputFilesSelectListSearch]
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
 ,ProjectGroupID Int NOT NULL
 ,FinYear Int NOT NULL
 ,Quarter Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectGroupID, FinYear, Quarter, SerialNo)
  SELECT [COST_ProjectInputFiles].[ProjectGroupID], [COST_ProjectInputFiles].[FinYear], [COST_ProjectInputFiles].[Quarter], [COST_ProjectInputFiles].[SerialNo] FROM [COST_ProjectInputFiles]
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
   ( 
         STR(ISNULL([COST_ProjectInputFiles].[ProjectGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_ProjectInputFiles].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_ProjectInputFiles].[Quarter], 0)) LIKE @KeyWord1
     OR STR(ISNULL([COST_ProjectInputFiles].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectInputFiles].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectInputFiles].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectInputFiles].[DiskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectGroupID' THEN [COST_ProjectInputFiles].[ProjectGroupID] END,
     CASE @OrderBy WHEN 'ProjectGroupID DESC' THEN [COST_ProjectInputFiles].[ProjectGroupID] END DESC,
     CASE @OrderBy WHEN 'FinYear' THEN [COST_ProjectInputFiles].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [COST_ProjectInputFiles].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Quarter' THEN [COST_ProjectInputFiles].[Quarter] END,
     CASE @OrderBy WHEN 'Quarter DESC' THEN [COST_ProjectInputFiles].[Quarter] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [COST_ProjectInputFiles].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [COST_ProjectInputFiles].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [COST_ProjectInputFiles].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [COST_ProjectInputFiles].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [COST_ProjectInputFiles].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [COST_ProjectInputFiles].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [COST_ProjectInputFiles].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [COST_ProjectInputFiles].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'COST_FinYear1_Descpription' THEN [COST_FinYear1].[Descpription] END,
     CASE @OrderBy WHEN 'COST_FinYear1_Descpription DESC' THEN [COST_FinYear1].[Descpription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectGroups2_ProjectGroupDescription' THEN [COST_ProjectGroups2].[ProjectGroupDescription] END,
     CASE @OrderBy WHEN 'COST_ProjectGroups2_ProjectGroupDescription DESC' THEN [COST_ProjectGroups2].[ProjectGroupDescription] END DESC,
     CASE @OrderBy WHEN 'COST_ProjectsInput3_GroupOrderValueINR' THEN [COST_ProjectsInput3].[GroupOrderValueINR] END,
     CASE @OrderBy WHEN 'COST_ProjectsInput3_GroupOrderValueINR DESC' THEN [COST_ProjectsInput3].[GroupOrderValueINR] END DESC,
     CASE @OrderBy WHEN 'COST_Quarters4_Description' THEN [COST_Quarters4].[Description] END,
     CASE @OrderBy WHEN 'COST_Quarters4_Description DESC' THEN [COST_Quarters4].[Description] END DESC 

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
