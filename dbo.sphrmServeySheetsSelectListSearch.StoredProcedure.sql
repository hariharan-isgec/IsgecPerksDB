USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ServeySheetID Int NOT NULL
  )
  INSERT INTO #PageIndex (ServeySheetID)
  SELECT [HRM_ServeySheets].[ServeySheetID] FROM [HRM_ServeySheets]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeySheets].[ServeyID] = [HRM_Serveys1].[ServeyID]
 WHERE  
   ( 
         STR(ISNULL([HRM_ServeySheets].[ServeyID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeySheets].[ServeySheetID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeySheets].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys1].[AnsTag10],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ServeyID' THEN [HRM_ServeySheets].[ServeyID] END,
     CASE @orderBy WHEN 'ServeyID DESC' THEN [HRM_ServeySheets].[ServeyID] END DESC,
     CASE @orderBy WHEN 'ServeySheetID' THEN [HRM_ServeySheets].[ServeySheetID] END,
     CASE @orderBy WHEN 'ServeySheetID DESC' THEN [HRM_ServeySheets].[ServeySheetID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_ServeySheets].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_ServeySheets].[Description] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [HRM_ServeySheets].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [HRM_ServeySheets].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_ServeyID' THEN [HRM_Serveys1].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_Serveys1_ServeyID DESC' THEN [HRM_Serveys1].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_Description' THEN [HRM_Serveys1].[Description] END,
     CASE @orderBy WHEN 'HRM_Serveys1_Description DESC' THEN [HRM_Serveys1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag1' THEN [HRM_Serveys1].[AnsTag1] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag1 DESC' THEN [HRM_Serveys1].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag2' THEN [HRM_Serveys1].[AnsTag2] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag2 DESC' THEN [HRM_Serveys1].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag3' THEN [HRM_Serveys1].[AnsTag3] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag3 DESC' THEN [HRM_Serveys1].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag4' THEN [HRM_Serveys1].[AnsTag4] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag4 DESC' THEN [HRM_Serveys1].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag5' THEN [HRM_Serveys1].[AnsTag5] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag5 DESC' THEN [HRM_Serveys1].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag6' THEN [HRM_Serveys1].[AnsTag6] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag6 DESC' THEN [HRM_Serveys1].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag7' THEN [HRM_Serveys1].[AnsTag7] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag7 DESC' THEN [HRM_Serveys1].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag8' THEN [HRM_Serveys1].[AnsTag8] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag8 DESC' THEN [HRM_Serveys1].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag9' THEN [HRM_Serveys1].[AnsTag9] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag9 DESC' THEN [HRM_Serveys1].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag10' THEN [HRM_Serveys1].[AnsTag10] END,
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag10 DESC' THEN [HRM_Serveys1].[AnsTag10] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeySheets].[ServeyID],
		[HRM_ServeySheets].[ServeySheetID],
		[HRM_ServeySheets].[Description],
		[HRM_ServeySheets].[CreatedOn],
		[HRM_Serveys1].[ServeyID] AS HRM_Serveys1_ServeyID,
		[HRM_Serveys1].[Description] AS HRM_Serveys1_Description,
		[HRM_Serveys1].[AnsTag1] AS HRM_Serveys1_AnsTag1,
		[HRM_Serveys1].[AnsTag2] AS HRM_Serveys1_AnsTag2,
		[HRM_Serveys1].[AnsTag3] AS HRM_Serveys1_AnsTag3,
		[HRM_Serveys1].[AnsTag4] AS HRM_Serveys1_AnsTag4,
		[HRM_Serveys1].[AnsTag5] AS HRM_Serveys1_AnsTag5,
		[HRM_Serveys1].[AnsTag6] AS HRM_Serveys1_AnsTag6,
		[HRM_Serveys1].[AnsTag7] AS HRM_Serveys1_AnsTag7,
		[HRM_Serveys1].[AnsTag8] AS HRM_Serveys1_AnsTag8,
		[HRM_Serveys1].[AnsTag9] AS HRM_Serveys1_AnsTag9,
		[HRM_Serveys1].[AnsTag10] AS HRM_Serveys1_AnsTag10 
  FROM [HRM_ServeySheets] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeySheets].[ServeySheetID] = #PageIndex.ServeySheetID
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeySheets].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
