USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsSelectListFilteres]
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
 ,GroupID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_Groups].[GroupID]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_Groups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[SYS_Groups].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[SYS_Groups].[GroupID] DESC'
                        WHEN 'Description' THEN '[SYS_Groups].[Description]'
                        WHEN 'Description DESC' THEN '[SYS_Groups].[Description] DESC'
                        WHEN 'Active' THEN '[SYS_Groups].[Active]'
                        WHEN 'Active DESC' THEN '[SYS_Groups].[Active] DESC'
                        ELSE '[SYS_Groups].[GroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_Groups].*  
  FROM [SYS_Groups] 
      INNER JOIN #PageIndex
          ON [SYS_Groups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
