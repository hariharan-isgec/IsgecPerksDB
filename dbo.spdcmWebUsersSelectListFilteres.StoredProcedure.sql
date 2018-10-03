USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @CreatedBy NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_WebUsers].[UserID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_WebUsers] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [DCM_WebUsers].[CreatedBy] = ''' + @CreatedBy + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[DCM_WebUsers].[UserID]'
                        WHEN 'UserID DESC' THEN '[DCM_WebUsers].[UserID] DESC'
                        WHEN 'UserName' THEN '[DCM_WebUsers].[UserName]'
                        WHEN 'UserName DESC' THEN '[DCM_WebUsers].[UserName] DESC'
                        WHEN 'CreatedBy' THEN '[DCM_WebUsers].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[DCM_WebUsers].[CreatedBy] DESC'
                        WHEN 'ActivateOn' THEN '[DCM_WebUsers].[ActivateOn]'
                        WHEN 'ActivateOn DESC' THEN '[DCM_WebUsers].[ActivateOn] DESC'
                        WHEN 'TillDays' THEN '[DCM_WebUsers].[TillDays]'
                        WHEN 'TillDays DESC' THEN '[DCM_WebUsers].[TillDays] DESC'
                        ELSE '[DCM_WebUsers].[UserID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_WebUsers].[UserID],
		[DCM_WebUsers].[UserName],
		[DCM_WebUsers].[CreatedBy],
		[DCM_WebUsers].[ActivateOn],
		[DCM_WebUsers].[TillDays] 
  FROM [DCM_WebUsers] 
    	INNER JOIN #PageIndex
          ON [DCM_WebUsers].[UserID] = #PageIndex.UserID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
