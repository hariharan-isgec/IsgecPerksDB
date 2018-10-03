USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsSelectListFilteres]
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
 ,UnitID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UnitID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_Units].[UnitID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_Units] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UnitID' THEN '[VR_Units].[UnitID]'
                        WHEN 'UnitID DESC' THEN '[VR_Units].[UnitID] DESC'
                        WHEN 'Description' THEN '[VR_Units].[Description]'
                        WHEN 'Description DESC' THEN '[VR_Units].[Description] DESC'
                        WHEN 'ConversionFactor' THEN '[VR_Units].[ConversionFactor]'
                        WHEN 'ConversionFactor DESC' THEN '[VR_Units].[ConversionFactor] DESC'
                        ELSE '[VR_Units].[UnitID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_Units].[UnitID] ,
		[VR_Units].[Description] ,
		[VR_Units].[ConversionFactor]  
  FROM [VR_Units] 
    	INNER JOIN #PageIndex
          ON [VR_Units].[UnitID] = #PageIndex.UnitID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
