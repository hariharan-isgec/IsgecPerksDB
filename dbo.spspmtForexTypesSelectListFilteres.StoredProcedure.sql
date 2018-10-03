USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,FOREXTypeID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FOREXTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_ForexTypes].[FOREXTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_ForexTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FOREXTypeID' THEN '[SPMT_ForexTypes].[FOREXTypeID]'
                        WHEN 'FOREXTypeID DESC' THEN '[SPMT_ForexTypes].[FOREXTypeID] DESC'
                        WHEN 'Description' THEN '[SPMT_ForexTypes].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_ForexTypes].[Description] DESC'
                        ELSE '[SPMT_ForexTypes].[FOREXTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_ForexTypes].[FOREXTypeID] ,
		[SPMT_ForexTypes].[Description]  
  FROM [SPMT_ForexTypes] 
    	INNER JOIN #PageIndex
          ON [SPMT_ForexTypes].[FOREXTypeID] = #PageIndex.FOREXTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
