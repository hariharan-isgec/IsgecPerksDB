USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberSelectListFilteres]
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
 ,NumberID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'NumberID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_DCLastNumber].[NumberID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_DCLastNumber] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'NumberID' THEN '[SPMT_DCLastNumber].[NumberID]'
                        WHEN 'NumberID DESC' THEN '[SPMT_DCLastNumber].[NumberID] DESC'
                        WHEN 'Description' THEN '[SPMT_DCLastNumber].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_DCLastNumber].[Description] DESC'
                        WHEN 'LastNumber' THEN '[SPMT_DCLastNumber].[LastNumber]'
                        WHEN 'LastNumber DESC' THEN '[SPMT_DCLastNumber].[LastNumber] DESC'
                        WHEN 'Year' THEN '[SPMT_DCLastNumber].[Year]'
                        WHEN 'Year DESC' THEN '[SPMT_DCLastNumber].[Year] DESC'
                        WHEN 'Active' THEN '[SPMT_DCLastNumber].[Active]'
                        WHEN 'Active DESC' THEN '[SPMT_DCLastNumber].[Active] DESC'
                        ELSE '[SPMT_DCLastNumber].[NumberID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCLastNumber].*  
  FROM [SPMT_DCLastNumber] 
      INNER JOIN #PageIndex
          ON [SPMT_DCLastNumber].[NumberID] = #PageIndex.NumberID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
