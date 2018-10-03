USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsSelectListFilteres]
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
 ,AppID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AppID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[MAPP_Applications].[AppID]'
  SET @LGSQL = @LGSQL + ' FROM [MAPP_Applications] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons1]'
  SET @LGSQL = @LGSQL + '    ON [MAPP_Applications].[AppIconID] = [WF_DBIcons1].[DBIconID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AppID' THEN '[MAPP_Applications].[AppID]'
                        WHEN 'AppID DESC' THEN '[MAPP_Applications].[AppID] DESC'
                        WHEN 'ApplicationName' THEN '[MAPP_Applications].[ApplicationName]'
                        WHEN 'ApplicationName DESC' THEN '[MAPP_Applications].[ApplicationName] DESC'
                        WHEN 'ApplicationDescription' THEN '[MAPP_Applications].[ApplicationDescription]'
                        WHEN 'ApplicationDescription DESC' THEN '[MAPP_Applications].[ApplicationDescription] DESC'
                        WHEN 'IsActive' THEN '[MAPP_Applications].[IsActive]'
                        WHEN 'IsActive DESC' THEN '[MAPP_Applications].[IsActive] DESC'
                        WHEN 'MainPageURL' THEN '[MAPP_Applications].[MainPageURL]'
                        WHEN 'MainPageURL DESC' THEN '[MAPP_Applications].[MainPageURL] DESC'
                        WHEN 'AppIconID' THEN '[MAPP_Applications].[AppIconID]'
                        WHEN 'AppIconID DESC' THEN '[MAPP_Applications].[AppIconID] DESC'
                        WHEN 'AppIconStyle' THEN '[MAPP_Applications].[AppIconStyle]'
                        WHEN 'AppIconStyle DESC' THEN '[MAPP_Applications].[AppIconStyle] DESC'
                        WHEN 'WF_DBIcons1_IconName' THEN '[WF_DBIcons1].[IconName]'
                        WHEN 'WF_DBIcons1_IconName DESC' THEN '[WF_DBIcons1].[IconName] DESC'
                        ELSE '[MAPP_Applications].[AppID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MAPP_Applications].* ,
    [WF_DBIcons1].[IconName] AS WF_DBIcons1_IconName 
  FROM [MAPP_Applications] 
      INNER JOIN #PageIndex
          ON [MAPP_Applications].[AppID] = #PageIndex.AppID
  LEFT OUTER JOIN [WF_DBIcons] AS [WF_DBIcons1]
    ON [MAPP_Applications].[AppIconID] = [WF_DBIcons1].[DBIconID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
