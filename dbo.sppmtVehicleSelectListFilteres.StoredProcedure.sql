USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVehicleSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VehicleID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VehicleID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_Vehicle].[VehicleID]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_Vehicle] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VehicleID' THEN '[PMT_Vehicle].[VehicleID]'
                        WHEN 'VehicleID DESC' THEN '[PMT_Vehicle].[VehicleID] DESC'
                        WHEN 'Description' THEN '[PMT_Vehicle].[Description]'
                        WHEN 'Description DESC' THEN '[PMT_Vehicle].[Description] DESC'
                        ELSE '[PMT_Vehicle].[VehicleID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_Vehicle].[VehicleID],
		[PMT_Vehicle].[Description] 
  FROM [PMT_Vehicle] 
    	INNER JOIN #PageIndex
          ON [PMT_Vehicle].[VehicleID] = #PageIndex.VehicleID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
