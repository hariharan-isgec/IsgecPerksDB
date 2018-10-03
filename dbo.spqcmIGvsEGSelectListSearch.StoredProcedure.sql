USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGSelectListSearch]
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
 ,InspectorGroupID Int NOT NULL
 ,EmployeeGroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (InspectorGroupID, EmployeeGroupID)
  SELECT [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID], [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] FROM [QCM_InspectorGroupEmployeeGroup]
  INNER JOIN [QCM_EmployeeGroups] AS [QCM_EmployeeGroups1]
    ON [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] = [QCM_EmployeeGroups1].[GroupID]
  INNER JOIN [QCM_InspectorGroups] AS [QCM_InspectorGroups2]
    ON [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] = [QCM_InspectorGroups2].[GroupID]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectorGroupEmployeeGroup].[InspectorGroupID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'InspectorGroupID' THEN [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] END,
     CASE @OrderBy WHEN 'InspectorGroupID DESC' THEN [QCM_InspectorGroupEmployeeGroup].[InspectorGroupID] END DESC,
     CASE @OrderBy WHEN 'EmployeeGroupID' THEN [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] END,
     CASE @OrderBy WHEN 'EmployeeGroupID DESC' THEN [QCM_InspectorGroupEmployeeGroup].[EmployeeGroupID] END DESC,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups1_Description' THEN [QCM_EmployeeGroups1].[Description] END,
     CASE @OrderBy WHEN 'QCM_EmployeeGroups1_Description DESC' THEN [QCM_EmployeeGroups1].[Description] END DESC,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description' THEN [QCM_InspectorGroups2].[Description] END,
     CASE @OrderBy WHEN 'QCM_InspectorGroups2_Description DESC' THEN [QCM_InspectorGroups2].[Description] END DESC 

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
