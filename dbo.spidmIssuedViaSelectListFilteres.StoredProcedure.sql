USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IssuedViaID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IssuedViaID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_IssuedVia].[IssuedViaID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_IssuedVia] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IssuedViaID' THEN '[IDM_IssuedVia].[IssuedViaID]'
                        WHEN 'IssuedViaID DESC' THEN '[IDM_IssuedVia].[IssuedViaID] DESC'
                        WHEN 'Description' THEN '[IDM_IssuedVia].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_IssuedVia].[Description] DESC'
                        ELSE '[IDM_IssuedVia].[IssuedViaID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_IssuedVia].[IssuedViaID] ,
		[IDM_IssuedVia].[Description]  
  FROM [IDM_IssuedVia] 
    	INNER JOIN #PageIndex
          ON [IDM_IssuedVia].[IssuedViaID] = #PageIndex.IssuedViaID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
