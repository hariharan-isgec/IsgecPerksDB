USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsSelectListFilteres]
  @Filter_DashboardID Int,
  @Filter_DBRows Int,
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
 ,DashboardID Int NOT NULL
 ,DBRows Int NOT NULL
 ,DBCols Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DashboardID'
  SET @LGSQL = @LGSQL + ', DBRows'
  SET @LGSQL = @LGSQL + ', DBCols'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DBRowCols].[DashboardID]'
  SET @LGSQL = @LGSQL + ', [WF_DBRowCols].[DBRows]'
  SET @LGSQL = @LGSQL + ', [WF_DBRowCols].[DBCols]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DBRowCols] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_Dashboards] AS [WF_Dashboards1]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRowCols].[DashboardID] = [WF_Dashboards1].[DashboardID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]'
  SET @LGSQL = @LGSQL + '    ON [WF_DBRowCols].[DashboardID] = [WF_DBRows2].[DashboardID]'
  SET @LGSQL = @LGSQL + '    AND [WF_DBRowCols].[DBRows] = [WF_DBRows2].[DBRows]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DashboardID > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_DBRowCols].[DashboardID] = ' + STR(@Filter_DashboardID)
  IF (@Filter_DBRows > 0) 
    SET @LGSQL = @LGSQL + ' AND [WF_DBRowCols].[DBRows] = ' + STR(@Filter_DBRows)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DashboardID' THEN '[WF_DBRowCols].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_DBRowCols].[DashboardID] DESC'
                        WHEN 'DBRows' THEN '[WF_DBRowCols].[DBRows]'
                        WHEN 'DBRows DESC' THEN '[WF_DBRowCols].[DBRows] DESC'
                        WHEN 'DBCols' THEN '[WF_DBRowCols].[DBCols]'
                        WHEN 'DBCols DESC' THEN '[WF_DBRowCols].[DBCols] DESC'
                        WHEN 'Description' THEN '[WF_DBRowCols].[Description]'
                        WHEN 'Description DESC' THEN '[WF_DBRowCols].[Description] DESC'
                        WHEN 'DBFieldName' THEN '[WF_DBRowCols].[DBFieldName]'
                        WHEN 'DBFieldName DESC' THEN '[WF_DBRowCols].[DBFieldName] DESC'
                        WHEN 'LinkURL' THEN '[WF_DBRowCols].[LinkURL]'
                        WHEN 'LinkURL DESC' THEN '[WF_DBRowCols].[LinkURL] DESC'
                        WHEN 'cssHeader' THEN '[WF_DBRowCols].[cssHeader]'
                        WHEN 'cssHeader DESC' THEN '[WF_DBRowCols].[cssHeader] DESC'
                        WHEN 'cssCell' THEN '[WF_DBRowCols].[cssCell]'
                        WHEN 'cssCell DESC' THEN '[WF_DBRowCols].[cssCell] DESC'
                        WHEN 'Sequence' THEN '[WF_DBRowCols].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[WF_DBRowCols].[Sequence] DESC'
                        WHEN 'WF_Dashboards1_DBDescription' THEN '[WF_Dashboards1].[DBDescription]'
                        WHEN 'WF_Dashboards1_DBDescription DESC' THEN '[WF_Dashboards1].[DBDescription] DESC'
                        WHEN 'WF_DBRows2_Description' THEN '[WF_DBRows2].[Description]'
                        WHEN 'WF_DBRows2_Description DESC' THEN '[WF_DBRows2].[Description] DESC'
                        ELSE '[WF_DBRowCols].[DashboardID],[WF_DBRowCols].[DBRows],[WF_DBRowCols].[DBCols]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_DBRowCols].* ,
    [WF_Dashboards1].[DBDescription] AS WF_Dashboards1_DBDescription,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description 
  FROM [WF_DBRowCols] 
      INNER JOIN #PageIndex
          ON [WF_DBRowCols].[DashboardID] = #PageIndex.DashboardID
          AND [WF_DBRowCols].[DBRows] = #PageIndex.DBRows
          AND [WF_DBRowCols].[DBCols] = #PageIndex.DBCols
  LEFT OUTER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRowCols].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRowCols].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRowCols].[DBRows] = [WF_DBRows2].[DBRows]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
