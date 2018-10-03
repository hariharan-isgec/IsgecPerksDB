USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLGroupGLsSelectListFilteres]
  @Filter_GLGroupID Int,
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
 ,GLGroupID Int NOT NULL
 ,GLCode NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GLGroupID'
  SET @LGSQL = @LGSQL + ', GLCode'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_GLGroupGLs].[GLGroupID]'
  SET @LGSQL = @LGSQL + ', [COST_GLGroupGLs].[GLCode]'
  SET @LGSQL = @LGSQL + ' FROM [COST_GLGroupGLs] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_GLGroups] AS [COST_GLGroups1]'
  SET @LGSQL = @LGSQL + '    ON [COST_GLGroupGLs].[GLGroupID] = [COST_GLGroups1].[GLGroupID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [COST_ERPGLCodes] AS [COST_ERPGLCodes2]'
  SET @LGSQL = @LGSQL + '    ON [COST_GLGroupGLs].[GLCode] = [COST_ERPGLCodes2].[GLCode]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GLGroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_GLGroupGLs].[GLGroupID] = ' + STR(@Filter_GLGroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GLGroupID' THEN '[COST_GLGroupGLs].[GLGroupID]'
                        WHEN 'GLGroupID DESC' THEN '[COST_GLGroupGLs].[GLGroupID] DESC'
                        WHEN 'GLCode' THEN '[COST_GLGroupGLs].[GLCode]'
                        WHEN 'GLCode DESC' THEN '[COST_GLGroupGLs].[GLCode] DESC'
                        WHEN 'EffectiveStartDate' THEN '[COST_GLGroupGLs].[EffectiveStartDate]'
                        WHEN 'EffectiveStartDate DESC' THEN '[COST_GLGroupGLs].[EffectiveStartDate] DESC'
                        WHEN 'EffectiveEndDate' THEN '[COST_GLGroupGLs].[EffectiveEndDate]'
                        WHEN 'EffectiveEndDate DESC' THEN '[COST_GLGroupGLs].[EffectiveEndDate] DESC'
                        WHEN 'COST_GLGroups1_GLGroupDescriptions' THEN '[COST_GLGroups1].[GLGroupDescriptions]'
                        WHEN 'COST_GLGroups1_GLGroupDescriptions DESC' THEN '[COST_GLGroups1].[GLGroupDescriptions] DESC'
                        WHEN 'COST_ERPGLCodes2_GLDescription' THEN '[COST_ERPGLCodes2].[GLDescription]'
                        WHEN 'COST_ERPGLCodes2_GLDescription DESC' THEN '[COST_ERPGLCodes2].[GLDescription] DESC'
                        ELSE '[COST_GLGroupGLs].[GLGroupID],[COST_GLGroupGLs].[GLCode]'
                    END
  EXEC (@LGSQL)

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
