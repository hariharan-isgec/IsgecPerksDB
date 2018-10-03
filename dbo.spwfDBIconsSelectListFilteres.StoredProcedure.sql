USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsSelectListFilteres]
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
 ,DBIconID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DBIconID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DBIcons].[DBIconID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DBIcons] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DBIconID' THEN '[WF_DBIcons].[DBIconID]'
                        WHEN 'DBIconID DESC' THEN '[WF_DBIcons].[DBIconID] DESC'
                        WHEN 'IconName' THEN '[WF_DBIcons].[IconName]'
                        WHEN 'IconName DESC' THEN '[WF_DBIcons].[IconName] DESC'
                        WHEN 'IconStyle' THEN '[WF_DBIcons].[IconStyle]'
                        WHEN 'IconStyle DESC' THEN '[WF_DBIcons].[IconStyle] DESC'
                        ELSE '[WF_DBIcons].[DBIconID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_DBIcons].*  
  FROM [WF_DBIcons] 
      INNER JOIN #PageIndex
          ON [WF_DBIcons].[DBIconID] = #PageIndex.DBIconID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
