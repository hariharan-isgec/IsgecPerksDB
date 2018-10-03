USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_TransmittalStatus].[TmtlStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_TransmittalStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlStatusID' THEN '[IDM_TransmittalStatus].[TmtlStatusID]'
                        WHEN 'TmtlStatusID DESC' THEN '[IDM_TransmittalStatus].[TmtlStatusID] DESC'
                        WHEN 'Description' THEN '[IDM_TransmittalStatus].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_TransmittalStatus].[Description] DESC'
                        ELSE '[IDM_TransmittalStatus].[TmtlStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_TransmittalStatus].[TmtlStatusID] ,
		[IDM_TransmittalStatus].[Description]  
  FROM [IDM_TransmittalStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_TransmittalStatus].[TmtlStatusID] = #PageIndex.TmtlStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
