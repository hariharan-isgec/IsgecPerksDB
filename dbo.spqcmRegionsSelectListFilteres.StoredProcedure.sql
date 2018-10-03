USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsSelectListFilteres]
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
 ,RegionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RegionID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_Regions].[RegionID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_Regions] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RegionID' THEN '[QCM_Regions].[RegionID]'
                        WHEN 'RegionID DESC' THEN '[QCM_Regions].[RegionID] DESC'
                        WHEN 'RegionName' THEN '[QCM_Regions].[RegionName]'
                        WHEN 'RegionName DESC' THEN '[QCM_Regions].[RegionName] DESC'
                        ELSE '[QCM_Regions].[RegionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_Regions].[RegionID] ,
		[QCM_Regions].[RegionName]  
  FROM [QCM_Regions] 
    	INNER JOIN #PageIndex
          ON [QCM_Regions].[RegionID] = #PageIndex.RegionID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
