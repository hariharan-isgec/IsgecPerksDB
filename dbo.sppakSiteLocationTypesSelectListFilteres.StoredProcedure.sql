USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesSelectListFilteres]
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
 ,LocationTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LocationTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_SiteLocationTypes].[LocationTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_SiteLocationTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LocationTypeID' THEN '[PAK_SiteLocationTypes].[LocationTypeID]'
                        WHEN 'LocationTypeID DESC' THEN '[PAK_SiteLocationTypes].[LocationTypeID] DESC'
                        WHEN 'Description' THEN '[PAK_SiteLocationTypes].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_SiteLocationTypes].[Description] DESC'
                        ELSE '[PAK_SiteLocationTypes].[LocationTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_SiteLocationTypes].*  
  FROM [PAK_SiteLocationTypes] 
      INNER JOIN #PageIndex
          ON [PAK_SiteLocationTypes].[LocationTypeID] = #PageIndex.LocationTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
