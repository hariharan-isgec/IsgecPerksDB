USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateSelectListFilteres]
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
 ,StateID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StateID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[EITL_MaterialState].[StateID]'
  SET @LGSQL = @LGSQL + ' FROM [EITL_MaterialState] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StateID' THEN '[EITL_MaterialState].[StateID]'
                        WHEN 'StateID DESC' THEN '[EITL_MaterialState].[StateID] DESC'
                        WHEN 'Description' THEN '[EITL_MaterialState].[Description]'
                        WHEN 'Description DESC' THEN '[EITL_MaterialState].[Description] DESC'
                        ELSE '[EITL_MaterialState].[StateID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[EITL_MaterialState].[StateID] ,
		[EITL_MaterialState].[Description]  
  FROM [EITL_MaterialState] 
    	INNER JOIN #PageIndex
          ON [EITL_MaterialState].[StateID] = #PageIndex.StateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
