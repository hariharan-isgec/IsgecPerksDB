USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogCargoTypesSelectListFilteres]
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
 ,CargoTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CargoTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_CargoTypes].[CargoTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_CargoTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CargoTypeID' THEN '[ELOG_CargoTypes].[CargoTypeID]'
                        WHEN 'CargoTypeID DESC' THEN '[ELOG_CargoTypes].[CargoTypeID] DESC'
                        WHEN 'Description' THEN '[ELOG_CargoTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ELOG_CargoTypes].[Description] DESC'
                        ELSE '[ELOG_CargoTypes].[CargoTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_CargoTypes].*  
  FROM [ELOG_CargoTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_CargoTypes].[CargoTypeID] = #PageIndex.CargoTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
