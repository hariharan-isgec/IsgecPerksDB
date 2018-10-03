USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwf_LG_AdminIUserDBSelectListFilteres]
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
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DashboardID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_Dashboards].[DashboardID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_Dashboards] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes1]'
  SET @LGSQL = @LGSQL + '    ON [WF_Dashboards].[DBRowTypeID] = [WF_DBRowTypes1].[RowTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes2]'
  SET @LGSQL = @LGSQL + '    ON [WF_Dashboards].[GraphTypeID] = [WF_GraphTypes2].[GraphTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE [WF_Dashboards].[InitializedByMe] = 1 '
  SET @LGSQL = @LGSQL + '  AND [WF_Dashboards].[Active] = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DashboardID' THEN '[WF_Dashboards].[DashboardID]'
                        WHEN 'DashboardID DESC' THEN '[WF_Dashboards].[DashboardID] DESC'
                        WHEN 'DBDescription' THEN '[WF_Dashboards].[DBDescription]'
                        WHEN 'DBDescription DESC' THEN '[WF_Dashboards].[DBDescription] DESC'
                        WHEN 'Active' THEN '[WF_Dashboards].[Active]'
                        WHEN 'Active DESC' THEN '[WF_Dashboards].[Active] DESC'
                        WHEN 'InitializedByMe' THEN '[WF_Dashboards].[InitializedByMe]'
                        WHEN 'InitializedByMe DESC' THEN '[WF_Dashboards].[InitializedByMe] DESC'
                        WHEN 'IconName' THEN '[WF_Dashboards].[IconName]'
                        WHEN 'IconName DESC' THEN '[WF_Dashboards].[IconName] DESC'
                        WHEN 'NotToDraw' THEN '[WF_Dashboards].[NotToDraw]'
                        WHEN 'NotToDraw DESC' THEN '[WF_Dashboards].[NotToDraw] DESC'
                        WHEN 'DBRowTypeID' THEN '[WF_Dashboards].[DBRowTypeID]'
                        WHEN 'DBRowTypeID DESC' THEN '[WF_Dashboards].[DBRowTypeID] DESC'
                        WHEN 'GraphTypeID' THEN '[WF_Dashboards].[GraphTypeID]'
                        WHEN 'GraphTypeID DESC' THEN '[WF_Dashboards].[GraphTypeID] DESC'
                        WHEN 'ConvertForGraph' THEN '[WF_Dashboards].[ConvertForGraph]'
                        WHEN 'ConvertForGraph DESC' THEN '[WF_Dashboards].[ConvertForGraph] DESC'
                        WHEN 'WF_DBRowTypes1_Description' THEN '[WF_DBRowTypes1].[Description]'
                        WHEN 'WF_DBRowTypes1_Description DESC' THEN '[WF_DBRowTypes1].[Description] DESC'
                        WHEN 'WF_GraphTypes2_Description' THEN '[WF_GraphTypes2].[Description]'
                        WHEN 'WF_GraphTypes2_Description DESC' THEN '[WF_GraphTypes2].[Description] DESC'
                        ELSE '[WF_Dashboards].[DashboardID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_Dashboards].* ,
    [WF_DBRowTypes1].[Description] AS WF_DBRowTypes1_Description,
    [WF_GraphTypes2].[Description] AS WF_GraphTypes2_Description 
  FROM [WF_Dashboards] 
      INNER JOIN #PageIndex
          ON [WF_Dashboards].[DashboardID] = #PageIndex.DashboardID
  LEFT OUTER JOIN [WF_DBRowTypes] AS [WF_DBRowTypes1]
    ON [WF_Dashboards].[DBRowTypeID] = [WF_DBRowTypes1].[RowTypeID]
  LEFT OUTER JOIN [WF_GraphTypes] AS [WF_GraphTypes2]
    ON [WF_Dashboards].[GraphTypeID] = [WF_GraphTypes2].[GraphTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
