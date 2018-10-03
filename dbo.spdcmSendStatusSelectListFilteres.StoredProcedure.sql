USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmSendStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SendStatusID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SendStatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[DCM_SendStatus].[SendStatusID]'  SET @LGSQL = @LGSQL + ' FROM [DCM_SendStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SendStatusID' THEN '[DCM_SendStatus].[SendStatusID]'
                        WHEN 'SendStatusID DESC' THEN '[DCM_SendStatus].[SendStatusID] DESC'
                        WHEN 'Description' THEN '[DCM_SendStatus].[Description]'
                        WHEN 'Description DESC' THEN '[DCM_SendStatus].[Description] DESC'
                        ELSE '[DCM_SendStatus].[SendStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[DCM_SendStatus].[SendStatusID],
		[DCM_SendStatus].[Description] 
  FROM [DCM_SendStatus] 
    	INNER JOIN #PageIndex
          ON [DCM_SendStatus].[SendStatusID] = #PageIndex.SendStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
