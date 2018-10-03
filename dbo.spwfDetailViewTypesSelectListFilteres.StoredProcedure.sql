USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesSelectListFilteres]
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
 ,DVTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DVTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[WF_DetailViewTypes].[DVTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [WF_DetailViewTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DVTypeID' THEN '[WF_DetailViewTypes].[DVTypeID]'
                        WHEN 'DVTypeID DESC' THEN '[WF_DetailViewTypes].[DVTypeID] DESC'
                        WHEN 'DVTypeDescription' THEN '[WF_DetailViewTypes].[DVTypeDescription]'
                        WHEN 'DVTypeDescription DESC' THEN '[WF_DetailViewTypes].[DVTypeDescription] DESC'
                        ELSE '[WF_DetailViewTypes].[DVTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [WF_DetailViewTypes].*  
  FROM [WF_DetailViewTypes] 
      INNER JOIN #PageIndex
          ON [WF_DetailViewTypes].[DVTypeID] = #PageIndex.DVTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
