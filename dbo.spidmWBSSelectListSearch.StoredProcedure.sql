USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmWBSSelectListSearch]
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
 ,WBSID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (WBSID)
  SELECT [IDM_WBS].[WBSID] FROM [IDM_WBS]
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency1]
    ON [IDM_WBS].[ResponsibleAgencyID] = [IDM_ResponsibleAgency1].[ResponsibleAgencyID]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_WBS].[WBSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_WBS].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_WBS].[WBSLevel], 0)) LIKE @KeyWord1
     OR STR(ISNULL([IDM_WBS].[ResponsibleAgencyID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'WBSID' THEN [IDM_WBS].[WBSID] END,
     CASE @OrderBy WHEN 'WBSID DESC' THEN [IDM_WBS].[WBSID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [IDM_WBS].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [IDM_WBS].[Description] END DESC,
     CASE @OrderBy WHEN 'WBSLevel' THEN [IDM_WBS].[WBSLevel] END,
     CASE @OrderBy WHEN 'WBSLevel DESC' THEN [IDM_WBS].[WBSLevel] END DESC,
     CASE @OrderBy WHEN 'ResponsibleAgencyID' THEN [IDM_WBS].[ResponsibleAgencyID] END,
     CASE @OrderBy WHEN 'ResponsibleAgencyID DESC' THEN [IDM_WBS].[ResponsibleAgencyID] END DESC,
     CASE @OrderBy WHEN 'IDM_ResponsibleAgency1_Description' THEN [IDM_ResponsibleAgency1].[Description] END,
     CASE @OrderBy WHEN 'IDM_ResponsibleAgency1_Description DESC' THEN [IDM_ResponsibleAgency1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel] ,
		[IDM_WBS].[ResponsibleAgencyID] ,
		[IDM_ResponsibleAgency1].[Description] AS IDM_ResponsibleAgency1_Description 
  FROM [IDM_WBS] 
    	INNER JOIN #PageIndex
          ON [IDM_WBS].[WBSID] = #PageIndex.WBSID
  LEFT OUTER JOIN [IDM_ResponsibleAgency] AS [IDM_ResponsibleAgency1]
    ON [IDM_WBS].[ResponsibleAgencyID] = [IDM_ResponsibleAgency1].[ResponsibleAgencyID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
