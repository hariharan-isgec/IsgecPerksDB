USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesSelectListFilteres]
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
 ,ProjectTypeID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_ProjectTypes].[ProjectTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_ProjectTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectTypeID' THEN '[COST_ProjectTypes].[ProjectTypeID]'
                        WHEN 'ProjectTypeID DESC' THEN '[COST_ProjectTypes].[ProjectTypeID] DESC'
                        WHEN 'ProjectTypeDescription' THEN '[COST_ProjectTypes].[ProjectTypeDescription]'
                        WHEN 'ProjectTypeDescription DESC' THEN '[COST_ProjectTypes].[ProjectTypeDescription] DESC'
                        ELSE '[COST_ProjectTypes].[ProjectTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectTypes].*  
  FROM [COST_ProjectTypes] 
      INNER JOIN #PageIndex
          ON [COST_ProjectTypes].[ProjectTypeID] = #PageIndex.ProjectTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
