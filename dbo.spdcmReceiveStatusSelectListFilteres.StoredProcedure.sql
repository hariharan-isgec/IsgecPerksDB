USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmReceiveStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ReceiveStatusID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReceiveStatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_ReceiveStatus].[ReceiveStatusID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_ReceiveStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReceiveStatusID' THEN '[DCM_ReceiveStatus].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[DCM_ReceiveStatus].[ReceiveStatusID] DESC'
                        WHEN 'Description' THEN '[DCM_ReceiveStatus].[Description]'
                        WHEN 'Description DESC' THEN '[DCM_ReceiveStatus].[Description] DESC'
                        ELSE '[DCM_ReceiveStatus].[ReceiveStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_ReceiveStatus].[ReceiveStatusID],
		[DCM_ReceiveStatus].[Description] 
  FROM [DCM_ReceiveStatus] 
    	INNER JOIN #PageIndex
          ON [DCM_ReceiveStatus].[ReceiveStatusID] = #PageIndex.ReceiveStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
