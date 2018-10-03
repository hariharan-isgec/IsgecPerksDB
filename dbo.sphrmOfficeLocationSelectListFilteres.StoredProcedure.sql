USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationSelectListFilteres]
  @Filter_LocationID Int,
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
 ,LocationID Int NOT NULL
 ,OfficeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LocationID'
  SET @LGSQL = @LGSQL + ', OfficeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_OfficeLocation].[LocationID]'
  SET @LGSQL = @LGSQL + ', [HRM_OfficeLocation].[OfficeID]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_OfficeLocation] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Locations] AS [HRM_Locations1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Offices] AS [HRM_Offices2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_OfficeLocation].[LocationID] = ' + STR(@Filter_LocationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationID' THEN '[HRM_OfficeLocation].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[HRM_OfficeLocation].[LocationID] DESC'
                        WHEN 'OfficeID' THEN '[HRM_OfficeLocation].[OfficeID]'
                        WHEN 'OfficeID DESC' THEN '[HRM_OfficeLocation].[OfficeID] DESC'
                        WHEN 'Description' THEN '[HRM_OfficeLocation].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_OfficeLocation].[Description] DESC'
                        WHEN 'HRM_Locations1_Description' THEN '[HRM_Locations1].[Description]'
                        WHEN 'HRM_Locations1_Description DESC' THEN '[HRM_Locations1].[Description] DESC'
                        WHEN 'HRM_Offices2_Description' THEN '[HRM_Offices2].[Description]'
                        WHEN 'HRM_Offices2_Description DESC' THEN '[HRM_Offices2].[Description] DESC'
                        ELSE '[HRM_OfficeLocation].[LocationID],[HRM_OfficeLocation].[OfficeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [HRM_OfficeLocation].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [HRM_Offices2].[Description] AS HRM_Offices2_Description 
  FROM [HRM_OfficeLocation] 
      INNER JOIN #PageIndex
          ON [HRM_OfficeLocation].[LocationID] = #PageIndex.LocationID
          AND [HRM_OfficeLocation].[OfficeID] = #PageIndex.OfficeID
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices2]
    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
