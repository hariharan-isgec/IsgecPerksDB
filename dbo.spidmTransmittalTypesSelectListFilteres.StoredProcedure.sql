USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TmtlTypeID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TmtlTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_TransmittalTypes].[TmtlTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_TransmittalTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TmtlTypeID' THEN '[IDM_TransmittalTypes].[TmtlTypeID]'
                        WHEN 'TmtlTypeID DESC' THEN '[IDM_TransmittalTypes].[TmtlTypeID] DESC'
                        WHEN 'Description' THEN '[IDM_TransmittalTypes].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_TransmittalTypes].[Description] DESC'
                        ELSE '[IDM_TransmittalTypes].[TmtlTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_TransmittalTypes].[TmtlTypeID] ,
		[IDM_TransmittalTypes].[Description]  
  FROM [IDM_TransmittalTypes] 
    	INNER JOIN #PageIndex
          ON [IDM_TransmittalTypes].[TmtlTypeID] = #PageIndex.TmtlTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
