USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEMailGroupsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,EMailGroup NVarChar(50) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'EMailGroup'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_EMailGroups].[EMailGroup]'  SET @LGSQL = @LGSQL + ' FROM [HRM_EMailGroups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EMailGroup' THEN '[HRM_EMailGroups].[EMailGroup]'
                        WHEN 'EMailGroup DESC' THEN '[HRM_EMailGroups].[EMailGroup] DESC'
                        WHEN 'Description' THEN '[HRM_EMailGroups].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_EMailGroups].[Description] DESC'
                        ELSE '[HRM_EMailGroups].[EMailGroup]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_EMailGroups].[EMailGroup],
		[HRM_EMailGroups].[Description] 
  FROM [HRM_EMailGroups] 
    	INNER JOIN #PageIndex
          ON [HRM_EMailGroups].[EMailGroup] = #PageIndex.EMailGroup
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
