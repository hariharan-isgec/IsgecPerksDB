USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectSelectListSearch]
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
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID, SerialNo)
  SELECT [SC_Project].[RequestID], [SC_Project].[SerialNo] FROM [SC_Project]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [SC_Project].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [SC_Project].[ElementID] = [IDM_WBS2].[WBSID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Project].[RequestID] = [SC_Request3].[RequestID]
 WHERE  
   ( 
         STR(ISNULL([SC_Project].[RequestID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SC_Project].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Project].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SC_Project].[ElementID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SC_Project].[Amount], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [SC_Project].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [SC_Project].[RequestID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [SC_Project].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [SC_Project].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SC_Project].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SC_Project].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'IsFromProject' THEN [SC_Project].[IsFromProject] END,
     CASE @OrderBy WHEN 'IsFromProject DESC' THEN [SC_Project].[IsFromProject] END DESC,
     CASE @OrderBy WHEN 'Amount' THEN [SC_Project].[Amount] END,
     CASE @OrderBy WHEN 'Amount DESC' THEN [SC_Project].[Amount] END DESC,
     CASE @OrderBy WHEN 'ElementID' THEN [SC_Project].[ElementID] END,
     CASE @OrderBy WHEN 'ElementID DESC' THEN [SC_Project].[ElementID] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects1_Description' THEN [IDM_Projects1].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects1_Description DESC' THEN [IDM_Projects1].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_WBS2_Description' THEN [IDM_WBS2].[Description] END,
     CASE @OrderBy WHEN 'IDM_WBS2_Description DESC' THEN [IDM_WBS2].[Description] END DESC,
     CASE @OrderBy WHEN 'SC_Request3_RequestRefNo' THEN [SC_Request3].[RequestRefNo] END,
     CASE @OrderBy WHEN 'SC_Request3_RequestRefNo DESC' THEN [SC_Request3].[RequestRefNo] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SC_Project].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [IDM_WBS2].[Description] AS IDM_WBS2_Description,
    [SC_Request3].[RequestRefNo] AS SC_Request3_RequestRefNo 
  FROM [SC_Project] 
      INNER JOIN #PageIndex
          ON [SC_Project].[RequestID] = #PageIndex.RequestID
          AND [SC_Project].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [SC_Project].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [SC_Project].[ElementID] = [IDM_WBS2].[WBSID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Project].[RequestID] = [SC_Request3].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
