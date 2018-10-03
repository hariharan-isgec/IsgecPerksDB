USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,OriginatorID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'OriginatorID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_Originator].[OriginatorID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_Originator] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'OriginatorID' THEN '[IDM_Originator].[OriginatorID]'
                        WHEN 'OriginatorID DESC' THEN '[IDM_Originator].[OriginatorID] DESC'
                        WHEN 'Description' THEN '[IDM_Originator].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_Originator].[Description] DESC'
                        ELSE '[IDM_Originator].[OriginatorID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_Originator].[OriginatorID] ,
		[IDM_Originator].[Description]  
  FROM [IDM_Originator] 
    	INNER JOIN #PageIndex
          ON [IDM_Originator].[OriginatorID] = #PageIndex.OriginatorID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
