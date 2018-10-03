USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataSelectListFilteres]
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
 ,DBDataID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DBDataID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DBData].[DBDataID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DBData] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DBDataID' THEN '[WF_DBData].[DBDataID]'
                        WHEN 'DBDataID DESC' THEN '[WF_DBData].[DBDataID] DESC'
                        WHEN 'Description' THEN '[WF_DBData].[Description]'
                        WHEN 'Description DESC' THEN '[WF_DBData].[Description] DESC'
                        WHEN 'IsProcedure' THEN '[WF_DBData].[IsProcedure]'
                        WHEN 'IsProcedure DESC' THEN '[WF_DBData].[IsProcedure] DESC'
                        WHEN 'FromERP' THEN '[WF_DBData].[FromERP]'
                        WHEN 'FromERP DESC' THEN '[WF_DBData].[FromERP] DESC'
                        WHEN 'IsList' THEN '[WF_DBData].[IsList]'
                        WHEN 'IsList DESC' THEN '[WF_DBData].[IsList] DESC'
                        WHEN 'IsErpAFSCall' THEN '[WF_DBData].[IsErpAFSCall]'
                        WHEN 'IsErpAFSCall DESC' THEN '[WF_DBData].[IsErpAFSCall] DESC'
                        WHEN 'AFSDllName' THEN '[WF_DBData].[AFSDllName]'
                        WHEN 'AFSDllName DESC' THEN '[WF_DBData].[AFSDllName] DESC'
                        WHEN 'AFSFunctionName' THEN '[WF_DBData].[AFSFunctionName]'
                        WHEN 'AFSFunctionName DESC' THEN '[WF_DBData].[AFSFunctionName] DESC'
                        WHEN 'AFSParameters' THEN '[WF_DBData].[AFSParameters]'
                        WHEN 'AFSParameters DESC' THEN '[WF_DBData].[AFSParameters] DESC'
                        WHEN 'DataSQL' THEN '[WF_DBData].[DataSQL]'
                        WHEN 'DataSQL DESC' THEN '[WF_DBData].[DataSQL] DESC'
                        ELSE '[WF_DBData].[DBDataID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_DBData].*  
  FROM [WF_DBData] 
      INNER JOIN #PageIndex
          ON [WF_DBData].[DBDataID] = #PageIndex.DBDataID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
