USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesSelectListFilteres]
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
 ,TravelTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TravelTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_TravelTypes].[TravelTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_TravelTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TravelTypeID' THEN '[TA_TravelTypes].[TravelTypeID]'
                        WHEN 'TravelTypeID DESC' THEN '[TA_TravelTypes].[TravelTypeID] DESC'
                        WHEN 'TravelTypeDescription' THEN '[TA_TravelTypes].[TravelTypeDescription]'
                        WHEN 'TravelTypeDescription DESC' THEN '[TA_TravelTypes].[TravelTypeDescription] DESC'
                        ELSE '[TA_TravelTypes].[TravelTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_TravelTypes].[TravelTypeID] ,
		[TA_TravelTypes].[TravelTypeDescription]  
  FROM [TA_TravelTypes] 
      INNER JOIN #PageIndex
          ON [TA_TravelTypes].[TravelTypeID] = #PageIndex.TravelTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
