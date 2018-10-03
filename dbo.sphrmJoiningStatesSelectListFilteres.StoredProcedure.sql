USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  JoiningStateID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (JoiningStateID) ' + 
               'SELECT [HRM_JoiningStates].[JoiningStateID] FROM [HRM_JoiningStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'JoiningStateID' THEN '[HRM_JoiningStates].[JoiningStateID]'
                        WHEN 'JoiningStateID DESC' THEN '[HRM_JoiningStates].[JoiningStateID] DESC'
                        WHEN 'Description' THEN '[HRM_JoiningStates].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_JoiningStates].[Description] DESC'
                        ELSE '[HRM_JoiningStates].[JoiningStateID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_JoiningStates].[JoiningStateID],
		[HRM_JoiningStates].[Description] 
  FROM [HRM_JoiningStates] 
    	INNER JOIN #PageIndex
          ON [HRM_JoiningStates].[JoiningStateID] = #PageIndex.JoiningStateID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
