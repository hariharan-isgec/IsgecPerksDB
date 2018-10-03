USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPOutlookSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,ProgressID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ', ProgressID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_CLPData].[ProjectID]'
  SET @LGSQL = @LGSQL + ', [TOS_CLPData].[ProgressID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_CLPData] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TOS_Projects] AS [TOS_Projects2]'
  SET @LGSQL = @LGSQL + '    ON [TOS_CLPData].[ProjectID] = [TOS_Projects2].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [TOS_CLPData].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[TOS_CLPData].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TOS_CLPData].[ProjectID] DESC'
                        WHEN 'ProgressID' THEN '[TOS_CLPData].[ProgressID]'
                        WHEN 'ProgressID DESC' THEN '[TOS_CLPData].[ProgressID] DESC'
                        WHEN 'Description' THEN '[TOS_CLPData].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_CLPData].[Description] DESC'
                        WHEN 'AsOn' THEN '[TOS_CLPData].[AsOn]'
                        WHEN 'AsOn DESC' THEN '[TOS_CLPData].[AsOn] DESC'
                        WHEN 'CreatedBy' THEN '[TOS_CLPData].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[TOS_CLPData].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[TOS_CLPData].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[TOS_CLPData].[CreatedOn] DESC'
                        WHEN 'Active' THEN '[TOS_CLPData].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_CLPData].[Active] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'TOS_Projects2_Description' THEN '[TOS_Projects2].[Description]'
                        WHEN 'TOS_Projects2_Description DESC' THEN '[TOS_Projects2].[Description] DESC'
                        ELSE '[TOS_CLPData].[ProjectID],[TOS_CLPData].[ProgressID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPData].[ProjectID] ,
		[TOS_CLPData].[ProgressID] ,
		[TOS_CLPData].[Description] ,
		[TOS_CLPData].[AsOn] ,
		[TOS_CLPData].[CreatedBy] ,
		[TOS_CLPData].[CreatedOn] ,
		[TOS_CLPData].[Active] ,
		[TOS_CLPData].[DueByDays] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Projects2].[Description] AS TOS_Projects2_Description 
  FROM [TOS_CLPData] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPData].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPData].[ProgressID] = #PageIndex.ProgressID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_CLPData].[ProjectID] = [TOS_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
