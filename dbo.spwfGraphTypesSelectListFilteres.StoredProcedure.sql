USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesSelectListFilteres]
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
 ,GraphTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GraphTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_GraphTypes].[GraphTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_GraphTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GraphTypeID' THEN '[WF_GraphTypes].[GraphTypeID]'
                        WHEN 'GraphTypeID DESC' THEN '[WF_GraphTypes].[GraphTypeID] DESC'
                        WHEN 'Description' THEN '[WF_GraphTypes].[Description]'
                        WHEN 'Description DESC' THEN '[WF_GraphTypes].[Description] DESC'
                        ELSE '[WF_GraphTypes].[GraphTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_GraphTypes].*  
  FROM [WF_GraphTypes] 
      INNER JOIN #PageIndex
          ON [WF_GraphTypes].[GraphTypeID] = #PageIndex.GraphTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
