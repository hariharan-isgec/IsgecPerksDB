USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,PlaceID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PlaceID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_Places].[PlaceID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_Places] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PlaceID' THEN '[SPMT_Places].[PlaceID]'
                        WHEN 'PlaceID DESC' THEN '[SPMT_Places].[PlaceID] DESC'
                        WHEN 'Description' THEN '[SPMT_Places].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_Places].[Description] DESC'
                        ELSE '[SPMT_Places].[PlaceID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_Places].[PlaceID] ,
		[SPMT_Places].[Description]  
  FROM [SPMT_Places] 
    	INNER JOIN #PageIndex
          ON [SPMT_Places].[PlaceID] = #PageIndex.PlaceID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
