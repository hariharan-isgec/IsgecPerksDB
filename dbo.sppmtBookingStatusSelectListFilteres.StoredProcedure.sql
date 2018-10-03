USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBookingStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_BookingStatus].[StatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_BookingStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[PMT_BookingStatus].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PMT_BookingStatus].[StatusID] DESC'
                        WHEN 'Description' THEN '[PMT_BookingStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PMT_BookingStatus].[Description] DESC'
                        ELSE '[PMT_BookingStatus].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_BookingStatus].[StatusID],
		[PMT_BookingStatus].[Description] 
  FROM [PMT_BookingStatus] 
    	INNER JOIN #PageIndex
          ON [PMT_BookingStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
