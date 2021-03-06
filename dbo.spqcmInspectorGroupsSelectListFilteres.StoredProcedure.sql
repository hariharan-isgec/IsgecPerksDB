USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupsSelectListFilteres]
  @Filter_GroupID Int,
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
 ,GroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectorGroups].[GroupID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectorGroups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectorGroups].[GroupID] = ' + STR(@Filter_GroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[QCM_InspectorGroups].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[QCM_InspectorGroups].[GroupID] DESC'
                        WHEN 'Description' THEN '[QCM_InspectorGroups].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_InspectorGroups].[Description] DESC'
                        ELSE '[QCM_InspectorGroups].[GroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectorGroups].[GroupID] ,
		[QCM_InspectorGroups].[Description]  
  FROM [QCM_InspectorGroups] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectorGroups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
