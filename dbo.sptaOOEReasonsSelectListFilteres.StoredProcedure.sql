USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsSelectListFilteres]
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
 ,ReasonID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReasonID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_OOEReasons].[ReasonID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_OOEReasons] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReasonID' THEN '[TA_OOEReasons].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[TA_OOEReasons].[ReasonID] DESC'
                        WHEN 'Description' THEN '[TA_OOEReasons].[Description]'
                        WHEN 'Description DESC' THEN '[TA_OOEReasons].[Description] DESC'
                        ELSE '[TA_OOEReasons].[ReasonID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_OOEReasons].[ReasonID] ,
		[TA_OOEReasons].[Description]  
  FROM [TA_OOEReasons] 
      INNER JOIN #PageIndex
          ON [TA_OOEReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
