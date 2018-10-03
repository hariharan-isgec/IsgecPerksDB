USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[TA_Categories].[CategoryID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_Categories] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CategoryID' THEN '[TA_Categories].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TA_Categories].[CategoryID] DESC'
                        WHEN 'CategoryCode' THEN '[TA_Categories].[CategoryCode]'
                        WHEN 'CategoryCode DESC' THEN '[TA_Categories].[CategoryCode] DESC'
                        WHEN 'CategoryDescription' THEN '[TA_Categories].[CategoryDescription]'
                        WHEN 'CategoryDescription DESC' THEN '[TA_Categories].[CategoryDescription] DESC'
                        WHEN 'CategorySequence' THEN '[TA_Categories].[CategorySequence]'
                        WHEN 'CategorySequence DESC' THEN '[TA_Categories].[CategorySequence] DESC'
                        ELSE '[TA_Categories].[CategoryID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_Categories].[CategoryID] ,
		[TA_Categories].[CategoryCode] ,
		[TA_Categories].[CategoryDescription] ,
		[TA_Categories].[CategorySequence] ,
		[TA_Categories].[cmba]  
  FROM [TA_Categories] 
      INNER JOIN #PageIndex
          ON [TA_Categories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
