USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectSelectListFilteres]
  @Filter_RequestID Int,
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
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SC_Project].[RequestID]'
  SET @LGSQL = @LGSQL + ', [SC_Project].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [SC_Project] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [SC_Project].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]'
  SET @LGSQL = @LGSQL + '    ON [SC_Project].[ElementID] = [IDM_WBS2].[WBSID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SC_Request] AS [SC_Request3]'
  SET @LGSQL = @LGSQL + '    ON [SC_Project].[RequestID] = [SC_Request3].[RequestID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [SC_Project].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[SC_Project].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[SC_Project].[RequestID] DESC'
                        WHEN 'SerialNo' THEN '[SC_Project].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[SC_Project].[SerialNo] DESC'
                        WHEN 'ProjectID' THEN '[SC_Project].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SC_Project].[ProjectID] DESC'
                        WHEN 'IsFromProject' THEN '[SC_Project].[IsFromProject]'
                        WHEN 'IsFromProject DESC' THEN '[SC_Project].[IsFromProject] DESC'
                        WHEN 'Amount' THEN '[SC_Project].[Amount]'
                        WHEN 'Amount DESC' THEN '[SC_Project].[Amount] DESC'
                        WHEN 'ElementID' THEN '[SC_Project].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[SC_Project].[ElementID] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'IDM_WBS2_Description' THEN '[IDM_WBS2].[Description]'
                        WHEN 'IDM_WBS2_Description DESC' THEN '[IDM_WBS2].[Description] DESC'
                        WHEN 'SC_Request3_RequestRefNo' THEN '[SC_Request3].[RequestRefNo]'
                        WHEN 'SC_Request3_RequestRefNo DESC' THEN '[SC_Request3].[RequestRefNo] DESC'
                        ELSE '[SC_Project].[RequestID],[SC_Project].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SC_Project].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [IDM_WBS2].[Description] AS IDM_WBS2_Description,
    [SC_Request3].[RequestRefNo] AS SC_Request3_RequestRefNo 
  FROM [SC_Project] 
      INNER JOIN #PageIndex
          ON [SC_Project].[RequestID] = #PageIndex.RequestID
          AND [SC_Project].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [SC_Project].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [SC_Project].[ElementID] = [IDM_WBS2].[WBSID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Project].[RequestID] = [SC_Request3].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
