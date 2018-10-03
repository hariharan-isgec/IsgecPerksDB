USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FunctionalAreaID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FunctionalAreaID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_FunctionalArea].[FunctionalAreaID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_FunctionalArea] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FunctionalAreaID' THEN '[TOS_FunctionalArea].[FunctionalAreaID]'
                        WHEN 'FunctionalAreaID DESC' THEN '[TOS_FunctionalArea].[FunctionalAreaID] DESC'
                        WHEN 'Description' THEN '[TOS_FunctionalArea].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_FunctionalArea].[Description] DESC'
                        ELSE '[TOS_FunctionalArea].[FunctionalAreaID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TOS_FunctionalArea].[FunctionalAreaID] ,
		[TOS_FunctionalArea].[Description]  
  FROM [TOS_FunctionalArea] 
    	INNER JOIN #PageIndex
          ON [TOS_FunctionalArea].[FunctionalAreaID] = #PageIndex.FunctionalAreaID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
