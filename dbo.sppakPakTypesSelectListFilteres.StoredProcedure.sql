USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesSelectListFilteres]
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
 ,PackTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PackTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_PakTypes].[PackTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_PakTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PackTypeID' THEN '[PAK_PakTypes].[PackTypeID]'
                        WHEN 'PackTypeID DESC' THEN '[PAK_PakTypes].[PackTypeID] DESC'
                        WHEN 'Description' THEN '[PAK_PakTypes].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_PakTypes].[Description] DESC'
                        ELSE '[PAK_PakTypes].[PackTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_PakTypes].*  
  FROM [PAK_PakTypes] 
      INNER JOIN #PageIndex
          ON [PAK_PakTypes].[PackTypeID] = #PageIndex.PackTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
