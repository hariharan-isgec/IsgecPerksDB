USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesSelectListFilteres]
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
 ,POTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'POTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_POTypes].[POTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_POTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'POTypeID' THEN '[PAK_POTypes].[POTypeID]'
                        WHEN 'POTypeID DESC' THEN '[PAK_POTypes].[POTypeID] DESC'
                        WHEN 'Description' THEN '[PAK_POTypes].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_POTypes].[Description] DESC'
                        ELSE '[PAK_POTypes].[POTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_POTypes].*  
  FROM [PAK_POTypes] 
      INNER JOIN #PageIndex
          ON [PAK_POTypes].[POTypeID] = #PageIndex.POTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
