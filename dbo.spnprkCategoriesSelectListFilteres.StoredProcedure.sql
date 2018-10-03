USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkCategoriesSelectListFilteres]
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
 ,CategoryID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CategoryID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_Categories].[CategoryID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_Categories] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CategoryID' THEN '[PRK_Categories].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[PRK_Categories].[CategoryID] DESC'
                        WHEN 'CategoryCode' THEN '[PRK_Categories].[CategoryCode]'
                        WHEN 'CategoryCode DESC' THEN '[PRK_Categories].[CategoryCode] DESC'
                        WHEN 'Description' THEN '[PRK_Categories].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_Categories].[Description] DESC'
                        WHEN 'Active' THEN '[PRK_Categories].[Active]'
                        WHEN 'Active DESC' THEN '[PRK_Categories].[Active] DESC'
                        WHEN 'STDCategory' THEN '[PRK_Categories].[STDCategory]'
                        WHEN 'STDCategory DESC' THEN '[PRK_Categories].[STDCategory] DESC'
                        WHEN 'cmba' THEN '[PRK_Categories].[cmba]'
                        WHEN 'cmba DESC' THEN '[PRK_Categories].[cmba] DESC'
                        ELSE '[PRK_Categories].[CategoryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_Categories].*  
  FROM [PRK_Categories] 
      INNER JOIN #PageIndex
          ON [PRK_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
