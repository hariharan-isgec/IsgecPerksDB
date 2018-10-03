USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsSelectListFilteres]
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
 ,ComponentID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ComponentID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_Components].[ComponentID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Components] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ComponentID' THEN '[TA_Components].[ComponentID]'
                        WHEN 'ComponentID DESC' THEN '[TA_Components].[ComponentID] DESC'
                        WHEN 'Description' THEN '[TA_Components].[Description]'
                        WHEN 'Description DESC' THEN '[TA_Components].[Description] DESC'
                        ELSE '[TA_Components].[ComponentID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_Components].[ComponentID] ,
		[TA_Components].[Description]  
  FROM [TA_Components] 
      INNER JOIN #PageIndex
          ON [TA_Components].[ComponentID] = #PageIndex.ComponentID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
