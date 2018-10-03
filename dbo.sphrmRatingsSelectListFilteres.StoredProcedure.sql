USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmRatingsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RatingID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RatingID) ' + 
               'SELECT [HRM_Ratings].[RatingID] FROM [HRM_Ratings] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RatingID' THEN '[HRM_Ratings].[RatingID]'
                        WHEN 'RatingID DESC' THEN '[HRM_Ratings].[RatingID] DESC'
                        WHEN 'Description' THEN '[HRM_Ratings].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Ratings].[Description] DESC'
                        WHEN 'sequence' THEN '[HRM_Ratings].[sequence]'
                        WHEN 'sequence DESC' THEN '[HRM_Ratings].[sequence] DESC'
                        ELSE '[HRM_Ratings].[RatingID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Ratings].[RatingID],
		[HRM_Ratings].[Description],
		[HRM_Ratings].[sequence] 
  FROM [HRM_Ratings] 
    	INNER JOIN #PageIndex
          ON [HRM_Ratings].[RatingID] = #PageIndex.RatingID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
