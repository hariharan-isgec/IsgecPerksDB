USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupsSelectListSearch]
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
 ,GroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (GroupID)
  SELECT [QCM_InspectorGroups].[GroupID] FROM [QCM_InspectorGroups]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectorGroups].[GroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectorGroups].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GroupID' THEN [QCM_InspectorGroups].[GroupID] END,
     CASE @OrderBy WHEN 'GroupID DESC' THEN [QCM_InspectorGroups].[GroupID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectorGroups].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectorGroups].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectorGroups].[GroupID] ,
		[QCM_InspectorGroups].[Description]  
  FROM [QCM_InspectorGroups] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectorGroups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
