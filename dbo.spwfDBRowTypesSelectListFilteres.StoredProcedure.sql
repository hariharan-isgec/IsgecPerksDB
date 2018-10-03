USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesSelectListFilteres]
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
 ,RowTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RowTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DBRowTypes].[RowTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DBRowTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RowTypeID' THEN '[WF_DBRowTypes].[RowTypeID]'
                        WHEN 'RowTypeID DESC' THEN '[WF_DBRowTypes].[RowTypeID] DESC'
                        WHEN 'Description' THEN '[WF_DBRowTypes].[Description]'
                        WHEN 'Description DESC' THEN '[WF_DBRowTypes].[Description] DESC'
                        WHEN 'cssClass' THEN '[WF_DBRowTypes].[cssClass]'
                        WHEN 'cssClass DESC' THEN '[WF_DBRowTypes].[cssClass] DESC'
                        ELSE '[WF_DBRowTypes].[RowTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_DBRowTypes].*  
  FROM [WF_DBRowTypes] 
      INNER JOIN #PageIndex
          ON [WF_DBRowTypes].[RowTypeID] = #PageIndex.RowTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
