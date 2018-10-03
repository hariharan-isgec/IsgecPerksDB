USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakMaterialStatesSelectListFilteres]
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
 ,MaterialStateID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MaterialStateID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_MaterialStates].[MaterialStateID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_MaterialStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MaterialStateID' THEN '[VR_MaterialStates].[MaterialStateID]'
                        WHEN 'MaterialStateID DESC' THEN '[VR_MaterialStates].[MaterialStateID] DESC'
                        WHEN 'Description' THEN '[VR_MaterialStates].[Description]'
                        WHEN 'Description DESC' THEN '[VR_MaterialStates].[Description] DESC'
                        ELSE '[VR_MaterialStates].[MaterialStateID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_MaterialStates].*  
  FROM [VR_MaterialStates] 
      INNER JOIN #PageIndex
          ON [VR_MaterialStates].[MaterialStateID] = #PageIndex.MaterialStateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
