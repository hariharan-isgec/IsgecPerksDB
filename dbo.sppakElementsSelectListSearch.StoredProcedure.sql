USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakElementsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ElementID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (ElementID)
  SELECT [PAK_Elements].[ElementID] FROM [PAK_Elements]
  LEFT OUTER JOIN [PAK_Elements] AS [PAK_Elements1]
    ON [PAK_Elements].[ParentElementID] = [PAK_Elements1].[ElementID]
  LEFT OUTER JOIN [PAK_ResponsibleAgencies] AS [PAK_ResponsibleAgencies2]
    ON [PAK_Elements].[ResponsibleAgencyID] = [PAK_ResponsibleAgencies2].[ResponsibleAgencyID]
 WHERE  
   ( 
         LOWER(ISNULL([PAK_Elements].[ElementID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Elements].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_Elements].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Elements].[ParentElementID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PAK_Elements].[ElementLevel], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PAK_Elements].[Prefix],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ElementID' THEN [PAK_Elements].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [PAK_Elements].[ElementID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PAK_Elements].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PAK_Elements].[Description] END DESC,
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [PAK_Elements].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [PAK_Elements].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'ParentElementID' THEN [PAK_Elements].[ParentElementID] END,
     CASE @OrderBy WHEN 'ParentElementID DESC' THEN [PAK_Elements].[ParentElementID] END DESC,
     CASE @OrderBy WHEN 'ElementLevel' THEN [PAK_Elements].[ElementLevel] END,
     CASE @OrderBy WHEN 'ElementLevel DESC' THEN [PAK_Elements].[ElementLevel] END DESC,
     CASE @OrderBy WHEN 'Prefix' THEN [PAK_Elements].[Prefix] END,
     CASE @OrderBy WHEN 'Prefix DESC' THEN [PAK_Elements].[Prefix] END DESC,
     CASE @OrderBy WHEN 'PAK_Elements1_Description' THEN [PAK_Elements1].[Description] END,
     CASE @OrderBy WHEN 'PAK_Elements1_Description DESC' THEN [PAK_Elements1].[Description] END DESC,
     CASE @OrderBy WHEN 'PAK_ResponsibleAgencies2_Description' THEN [PAK_ResponsibleAgencies2].[Description] END,
     CASE @OrderBy WHEN 'PAK_ResponsibleAgencies2_Description DESC' THEN [PAK_ResponsibleAgencies2].[Description] END DESC 

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
