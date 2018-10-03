USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,DocumentStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_DocumentStatus].[DocumentStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_DocumentStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentStatusID' THEN '[IDM_DocumentStatus].[DocumentStatusID]'
                        WHEN 'DocumentStatusID DESC' THEN '[IDM_DocumentStatus].[DocumentStatusID] DESC'
                        WHEN 'Description' THEN '[IDM_DocumentStatus].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_DocumentStatus].[Description] DESC'
                        ELSE '[IDM_DocumentStatus].[DocumentStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentStatus].[DocumentStatusID] ,
		[IDM_DocumentStatus].[Description]  
  FROM [IDM_DocumentStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentStatus].[DocumentStatusID] = #PageIndex.DocumentStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
