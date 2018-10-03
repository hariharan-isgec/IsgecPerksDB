USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesSelectListFilteres]
  @Filter_GLNatureID Int,
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
 ,GLNatureID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GLNatureID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_GLNatures].[GLNatureID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_GLNatures] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GLNatureID > 0) 
    SET @LGSQL = @LGSQL + ' AND [COST_GLNatures].[GLNatureID] = ' + STR(@Filter_GLNatureID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GLNatureID' THEN '[COST_GLNatures].[GLNatureID]'
                        WHEN 'GLNatureID DESC' THEN '[COST_GLNatures].[GLNatureID] DESC'
                        WHEN 'GLNatureDescription' THEN '[COST_GLNatures].[GLNatureDescription]'
                        WHEN 'GLNatureDescription DESC' THEN '[COST_GLNatures].[GLNatureDescription] DESC'
                        ELSE '[COST_GLNatures].[GLNatureID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_GLNatures].*  
  FROM [COST_GLNatures] 
      INNER JOIN #PageIndex
          ON [COST_GLNatures].[GLNatureID] = #PageIndex.GLNatureID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
