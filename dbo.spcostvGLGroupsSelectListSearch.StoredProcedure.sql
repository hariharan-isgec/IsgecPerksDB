USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostvGLGroupsSelectListSearch]
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
 ,GLGroupID Int NOT NULL
  )
  INSERT INTO #PageIndex (GLGroupID)
  SELECT [COST_vGLGroups].[GLGroupID] FROM [COST_vGLGroups]
 WHERE  
   ( 
         STR(ISNULL([COST_vGLGroups].[GLGroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_vGLGroups].[GLGroupDescriptions],'')) LIKE @KeyWord1
     OR STR(ISNULL([COST_vGLGroups].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GLGroupID' THEN [COST_vGLGroups].[GLGroupID] END,
     CASE @OrderBy WHEN 'GLGroupID DESC' THEN [COST_vGLGroups].[GLGroupID] END DESC,
     CASE @OrderBy WHEN 'GLGroupDescriptions' THEN [COST_vGLGroups].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'GLGroupDescriptions DESC' THEN [COST_vGLGroups].[GLGroupDescriptions] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [COST_vGLGroups].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [COST_vGLGroups].[Sequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_vGLGroups].*  
  FROM [COST_vGLGroups] 
      INNER JOIN #PageIndex
          ON [COST_vGLGroups].[GLGroupID] = #PageIndex.GLGroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
