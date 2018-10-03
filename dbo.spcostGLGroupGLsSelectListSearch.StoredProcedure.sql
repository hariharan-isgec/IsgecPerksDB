USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsSelectListSearch]
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
 ,GLCode NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (GLGroupID, GLCode)
  SELECT [COST_GLGroupGLs].[GLGroupID], [COST_GLGroupGLs].[GLCode] FROM [COST_GLGroupGLs]
  INNER JOIN [COST_GLGroups] AS [COST_GLGroups1]
    ON [COST_GLGroupGLs].[GLGroupID] = [COST_GLGroups1].[GLGroupID]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_GLGroupGLs].[GLCode] = [COST_ERPGLCodes2].[GLCode]
 WHERE  
   ( 
         STR(ISNULL([COST_GLGroupGLs].[GLGroupID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_GLGroupGLs].[GLCode],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GLGroupID' THEN [COST_GLGroupGLs].[GLGroupID] END,
     CASE @OrderBy WHEN 'GLGroupID DESC' THEN [COST_GLGroupGLs].[GLGroupID] END DESC,
     CASE @OrderBy WHEN 'GLCode' THEN [COST_GLGroupGLs].[GLCode] END,
     CASE @OrderBy WHEN 'GLCode DESC' THEN [COST_GLGroupGLs].[GLCode] END DESC,
     CASE @OrderBy WHEN 'EffectiveStartDate' THEN [COST_GLGroupGLs].[EffectiveStartDate] END,
     CASE @OrderBy WHEN 'EffectiveStartDate DESC' THEN [COST_GLGroupGLs].[EffectiveStartDate] END DESC,
     CASE @OrderBy WHEN 'EffectiveEndDate' THEN [COST_GLGroupGLs].[EffectiveEndDate] END,
     CASE @OrderBy WHEN 'EffectiveEndDate DESC' THEN [COST_GLGroupGLs].[EffectiveEndDate] END DESC,
     CASE @OrderBy WHEN 'COST_GLGroups1_GLGroupDescriptions' THEN [COST_GLGroups1].[GLGroupDescriptions] END,
     CASE @OrderBy WHEN 'COST_GLGroups1_GLGroupDescriptions DESC' THEN [COST_GLGroups1].[GLGroupDescriptions] END DESC,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription' THEN [COST_ERPGLCodes2].[GLDescription] END,
     CASE @OrderBy WHEN 'COST_ERPGLCodes2_GLDescription DESC' THEN [COST_ERPGLCodes2].[GLDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_GLGroupGLs].* ,
    [COST_GLGroups1].[GLGroupDescriptions] AS COST_GLGroups1_GLGroupDescriptions,
    [COST_ERPGLCodes2].[GLDescription] AS COST_ERPGLCodes2_GLDescription 
  FROM [COST_GLGroupGLs] 
      INNER JOIN #PageIndex
          ON [COST_GLGroupGLs].[GLGroupID] = #PageIndex.GLGroupID
          AND [COST_GLGroupGLs].[GLCode] = #PageIndex.GLCode
  INNER JOIN [COST_GLGroups] AS [COST_GLGroups1]
    ON [COST_GLGroupGLs].[GLGroupID] = [COST_GLGroups1].[GLGroupID]
  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]
    ON [COST_GLGroupGLs].[GLCode] = [COST_ERPGLCodes2].[GLCode]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
