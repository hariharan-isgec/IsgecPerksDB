USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosElementsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,WBSID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'WBSID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_WBS].[WBSID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_WBS] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WBSID' THEN '[IDM_WBS].[WBSID]'
                        WHEN 'WBSID DESC' THEN '[IDM_WBS].[WBSID] DESC'
                        WHEN 'Description' THEN '[IDM_WBS].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_WBS].[Description] DESC'
                        WHEN 'WBSLevel' THEN '[IDM_WBS].[WBSLevel]'
                        WHEN 'WBSLevel DESC' THEN '[IDM_WBS].[WBSLevel] DESC'
                        ELSE '[IDM_WBS].[WBSID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel]  
  FROM [IDM_WBS] 
    	INNER JOIN #PageIndex
          ON [IDM_WBS].[WBSID] = #PageIndex.WBSID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
