USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesSelectListFilteres]
  @Filter_StateID NVarChar(10),
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
 ,StateID NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StateID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_RequestStates].[StateID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_RequestStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_StateID > '') 
    SET @LGSQL = @LGSQL + ' AND [QCM_RequestStates].[StateID] = ''' + @Filter_StateID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StateID' THEN '[QCM_RequestStates].[StateID]'
                        WHEN 'StateID DESC' THEN '[QCM_RequestStates].[StateID] DESC'
                        WHEN 'Description' THEN '[QCM_RequestStates].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_RequestStates].[Description] DESC'
                        ELSE '[QCM_RequestStates].[StateID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_RequestStates].[StateID] ,
		[QCM_RequestStates].[Description]  
  FROM [QCM_RequestStates] 
    	INNER JOIN #PageIndex
          ON [QCM_RequestStates].[StateID] = #PageIndex.StateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
