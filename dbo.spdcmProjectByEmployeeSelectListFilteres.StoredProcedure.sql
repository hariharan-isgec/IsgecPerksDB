USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RecordID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_ProjectByEmployee].[RecordID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_ProjectByEmployee] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users2].[UserName]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [DCM_Projects] AS [DCM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[DCM_ProjectByEmployee].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[DCM_ProjectByEmployee].[RecordID] DESC'
                        WHEN 'CardNo' THEN '[DCM_ProjectByEmployee].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[DCM_ProjectByEmployee].[CardNo] DESC'
                        WHEN 'ProjectID' THEN '[DCM_ProjectByEmployee].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[DCM_ProjectByEmployee].[ProjectID] DESC'
                        WHEN 'aspnet_Users2_UserName' THEN '[aspnet_Users2].[UserName]'
                        WHEN 'aspnet_Users2_UserName DESC' THEN '[aspnet_Users2].[UserName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_ExtnNo' THEN '[aspnet_Users2].[ExtnNo]'
                        WHEN 'aspnet_Users2_ExtnNo DESC' THEN '[aspnet_Users2].[ExtnNo] DESC'
                        WHEN 'aspnet_Users2_MobileNo' THEN '[aspnet_Users2].[MobileNo]'
                        WHEN 'aspnet_Users2_MobileNo DESC' THEN '[aspnet_Users2].[MobileNo] DESC'
                        WHEN 'aspnet_Users2_EMailID' THEN '[aspnet_Users2].[EMailID]'
                        WHEN 'aspnet_Users2_EMailID DESC' THEN '[aspnet_Users2].[EMailID] DESC'
                        WHEN 'DCM_Projects1_ProjectID' THEN '[DCM_Projects1].[ProjectID]'
                        WHEN 'DCM_Projects1_ProjectID DESC' THEN '[DCM_Projects1].[ProjectID] DESC'
                        WHEN 'DCM_Projects1_Description' THEN '[DCM_Projects1].[Description]'
                        WHEN 'DCM_Projects1_Description DESC' THEN '[DCM_Projects1].[Description] DESC'
                        ELSE '[DCM_ProjectByEmployee].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_ProjectByEmployee].[RecordID],
		[DCM_ProjectByEmployee].[CardNo],
		[DCM_ProjectByEmployee].[ProjectID],
		[aspnet_Users2].[UserName] AS aspnet_Users2_UserName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users2].[ExtnNo] AS aspnet_Users2_ExtnNo,
		[aspnet_Users2].[MobileNo] AS aspnet_Users2_MobileNo,
		[aspnet_Users2].[EMailID] AS aspnet_Users2_EMailID,
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_ProjectByEmployee] 
    	INNER JOIN #PageIndex
          ON [DCM_ProjectByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users2].[UserName]
  INNER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
