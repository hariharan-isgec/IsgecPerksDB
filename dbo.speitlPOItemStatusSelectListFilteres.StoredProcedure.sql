USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemStatusSelectListFilteres]
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
 ,StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_POItemStatus].[StatusID]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_POItemStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[EITL_POItemStatus].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[EITL_POItemStatus].[StatusID] DESC'
                        WHEN 'Description' THEN '[EITL_POItemStatus].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_POItemStatus].[Description] DESC'
                        ELSE '[EITL_POItemStatus].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_POItemStatus].[StatusID] ,
		[EITL_POItemStatus].[Description]  
  FROM [EITL_POItemStatus] 
    	INNER JOIN #PageIndex
          ON [EITL_POItemStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
