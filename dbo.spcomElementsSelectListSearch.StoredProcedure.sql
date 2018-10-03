USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomElementsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,WBSID NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (WBSID)
  SELECT [IDM_WBS].[WBSID] FROM [IDM_WBS]
 WHERE  
   ( 
         LOWER(ISNULL([IDM_WBS].[WBSID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([IDM_WBS].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([IDM_WBS].[WBSLevel], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'WBSID' THEN [IDM_WBS].[WBSID] END,
     CASE @orderBy WHEN 'WBSID DESC' THEN [IDM_WBS].[WBSID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [IDM_WBS].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [IDM_WBS].[Description] END DESC,
     CASE @orderBy WHEN 'WBSLevel' THEN [IDM_WBS].[WBSLevel] END,
     CASE @orderBy WHEN 'WBSLevel DESC' THEN [IDM_WBS].[WBSLevel] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[IDM_WBS].[WBSID] ,
		[IDM_WBS].[Description] ,
		[IDM_WBS].[WBSLevel]  
  FROM [IDM_WBS] 
    	INNER JOIN #PageIndex
          ON [IDM_WBS].[WBSID] = #PageIndex.WBSID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
