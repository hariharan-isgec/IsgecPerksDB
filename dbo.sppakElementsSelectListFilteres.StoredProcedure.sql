USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsSelectListFilteres]
  @Filter_ElementID NVarChar(8),
  @Filter_ResponsibleAgencyID Int,
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
 ,ElementID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ElementID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_Elements].[ElementID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_Elements] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements1]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Elements].[ParentElementID] = [PAK_Elements1].[ElementID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PAK_ResponsibleAgencies] AS [PAK_ResponsibleAgencies2]'
  SET @LGSQL = @LGSQL + '    ON [PAK_Elements].[ResponsibleAgencyID] = [PAK_ResponsibleAgencies2].[ResponsibleAgencyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ElementID > '') 
    SET @LGSQL = @LGSQL + ' AND [PAK_Elements].[ElementID] = ''' + @Filter_ElementID + ''''
  IF (@Filter_ResponsibleAgencyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PAK_Elements].[ResponsibleAgencyID] = ' + STR(@Filter_ResponsibleAgencyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ElementID' THEN '[PAK_Elements].[ElementID]'
                        WHEN 'ElementID DESC' THEN '[PAK_Elements].[ElementID] DESC'
                        WHEN 'Description' THEN '[PAK_Elements].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_Elements].[Description] DESC'
                        WHEN 'ResponsibleAgencyID' THEN '[PAK_Elements].[ResponsibleAgencyID]'
                        WHEN 'ResponsibleAgencyID DESC' THEN '[PAK_Elements].[ResponsibleAgencyID] DESC'
                        WHEN 'ParentElementID' THEN '[PAK_Elements].[ParentElementID]'
                        WHEN 'ParentElementID DESC' THEN '[PAK_Elements].[ParentElementID] DESC'
                        WHEN 'ElementLevel' THEN '[PAK_Elements].[ElementLevel]'
                        WHEN 'ElementLevel DESC' THEN '[PAK_Elements].[ElementLevel] DESC'
                        WHEN 'Prefix' THEN '[PAK_Elements].[Prefix]'
                        WHEN 'Prefix DESC' THEN '[PAK_Elements].[Prefix] DESC'
                        WHEN 'PAK_Elements1_Description' THEN '[PAK_Elements1].[Description]'
                        WHEN 'PAK_Elements1_Description DESC' THEN '[PAK_Elements1].[Description] DESC'
                        WHEN 'PAK_ResponsibleAgencies2_Description' THEN '[PAK_ResponsibleAgencies2].[Description]'
                        WHEN 'PAK_ResponsibleAgencies2_Description DESC' THEN '[PAK_ResponsibleAgencies2].[Description] DESC'
                        ELSE '[PAK_Elements].[ElementID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_Elements].* ,
    [PAK_Elements1].[Description] AS PAK_Elements1_Description,
    [PAK_ResponsibleAgencies2].[Description] AS PAK_ResponsibleAgencies2_Description 
  FROM [PAK_Elements] 
      INNER JOIN #PageIndex
          ON [PAK_Elements].[ElementID] = #PageIndex.ElementID
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements1]
    ON [PAK_Elements].[ParentElementID] = [PAK_Elements1].[ElementID]
  LEFT OUTER JOIN [PAK_ResponsibleAgencies] AS [PAK_ResponsibleAgencies2]
    ON [PAK_Elements].[ResponsibleAgencyID] = [PAK_ResponsibleAgencies2].[ResponsibleAgencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
