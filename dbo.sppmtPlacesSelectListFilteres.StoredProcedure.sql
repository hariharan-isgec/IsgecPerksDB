USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesSelectListFilteres]
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
  SET @LGSQL = @LGSQL + 'PlaceID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_Places].[PlaceID]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_Places] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PlaceID' THEN '[PMT_Places].[PlaceID]'
                        WHEN 'PlaceID DESC' THEN '[PMT_Places].[PlaceID] DESC'
                        WHEN 'Description' THEN '[PMT_Places].[Description]'
                        WHEN 'Description DESC' THEN '[PMT_Places].[Description] DESC'
                        ELSE '[PMT_Places].[PlaceID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_Places].[PlaceID],
		[PMT_Places].[Description] 
  FROM [PMT_Places] 
    	INNER JOIN #PageIndex
          ON [PMT_Places].[PlaceID] = #PageIndex.PlaceID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
