USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsSelectListSearch]
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
  QuestionID Int NOT NULL
  )
  INSERT INTO #PageIndex (QuestionID)
  SELECT [HRM_ServeyQuestions].[QuestionID] FROM [HRM_ServeyQuestions]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyQuestions].[ServeyID] = [HRM_Serveys1].[ServeyID]
 WHERE  
   ( 
         STR(ISNULL([HRM_ServeyQuestions].[QuestionID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyQuestions].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag10],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag11],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag12],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag13],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag14],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag15],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag16],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag17],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag18],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag19],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag20],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag21],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag22],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag23],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag24],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions].[AnsTag25],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'QuestionID' THEN [HRM_ServeyQuestions].[QuestionID] END,
     CASE @orderBy WHEN 'QuestionID DESC' THEN [HRM_ServeyQuestions].[QuestionID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_ServeyQuestions].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_ServeyQuestions].[Description] END DESC,
     CASE @orderBy WHEN 'ServeyID' THEN [HRM_ServeyQuestions].[ServeyID] END,
     CASE @orderBy WHEN 'ServeyID DESC' THEN [HRM_ServeyQuestions].[ServeyID] END DESC,
     CASE @orderBy WHEN 'Demography' THEN [HRM_ServeyQuestions].[Demography] END,
     CASE @orderBy WHEN 'Demography DESC' THEN [HRM_ServeyQuestions].[Demography] END DESC,
     CASE @orderBy WHEN 'UseCaption' THEN [HRM_ServeyQuestions].[UseCaption] END,
     CASE @orderBy WHEN 'UseCaption DESC' THEN [HRM_ServeyQuestions].[UseCaption] END DESC,
     CASE @orderBy WHEN 'AnsTag1' THEN [HRM_ServeyQuestions].[AnsTag1] END,
     CASE @orderBy WHEN 'AnsTag1 DESC' THEN [HRM_ServeyQuestions].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'AnsTag2' THEN [HRM_ServeyQuestions].[AnsTag2] END,
     CASE @orderBy WHEN 'AnsTag2 DESC' THEN [HRM_ServeyQuestions].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'AnsTag3' THEN [HRM_ServeyQuestions].[AnsTag3] END,
     CASE @orderBy WHEN 'AnsTag3 DESC' THEN [HRM_ServeyQuestions].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'AnsTag4' THEN [HRM_ServeyQuestions].[AnsTag4] END,
     CASE @orderBy WHEN 'AnsTag4 DESC' THEN [HRM_ServeyQuestions].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'AnsTag5' THEN [HRM_ServeyQuestions].[AnsTag5] END,
     CASE @orderBy WHEN 'AnsTag5 DESC' THEN [HRM_ServeyQuestions].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'AnsTag6' THEN [HRM_ServeyQuestions].[AnsTag6] END,
     CASE @orderBy WHEN 'AnsTag6 DESC' THEN [HRM_ServeyQuestions].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'AnsTag7' THEN [HRM_ServeyQuestions].[AnsTag7] END,
     CASE @orderBy WHEN 'AnsTag7 DESC' THEN [HRM_ServeyQuestions].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'AnsTag8' THEN [HRM_ServeyQuestions].[AnsTag8] END,
     CASE @orderBy WHEN 'AnsTag8 DESC' THEN [HRM_ServeyQuestions].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'AnsTag9' THEN [HRM_ServeyQuestions].[AnsTag9] END,
     CASE @orderBy WHEN 'AnsTag9 DESC' THEN [HRM_ServeyQuestions].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'AnsTag10' THEN [HRM_ServeyQuestions].[AnsTag10] END,
     CASE @orderBy WHEN 'AnsTag10 DESC' THEN [HRM_ServeyQuestions].[AnsTag10] END DESC,
     CASE @orderBy WHEN 'AnsTag11' THEN [HRM_ServeyQuestions].[AnsTag11] END,
     CASE @orderBy WHEN 'AnsTag11 DESC' THEN [HRM_ServeyQuestions].[AnsTag11] END DESC,
     CASE @orderBy WHEN 'AnsTag12' THEN [HRM_ServeyQuestions].[AnsTag12] END,
     CASE @orderBy WHEN 'AnsTag12 DESC' THEN [HRM_ServeyQuestions].[AnsTag12] END DESC,
     CASE @orderBy WHEN 'AnsTag13' THEN [HRM_ServeyQuestions].[AnsTag13] END,
     CASE @orderBy WHEN 'AnsTag13 DESC' THEN [HRM_ServeyQuestions].[AnsTag13] END DESC,
     CASE @orderBy WHEN 'AnsTag14' THEN [HRM_ServeyQuestions].[AnsTag14] END,
     CASE @orderBy WHEN 'AnsTag14 DESC' THEN [HRM_ServeyQuestions].[AnsTag14] END DESC,
     CASE @orderBy WHEN 'AnsTag15' THEN [HRM_ServeyQuestions].[AnsTag15] END,
     CASE @orderBy WHEN 'AnsTag15 DESC' THEN [HRM_ServeyQuestions].[AnsTag15] END DESC,
     CASE @orderBy WHEN 'AnsTag16' THEN [HRM_ServeyQuestions].[AnsTag16] END,
     CASE @orderBy WHEN 'AnsTag16 DESC' THEN [HRM_ServeyQuestions].[AnsTag16] END DESC,
     CASE @orderBy WHEN 'AnsTag17' THEN [HRM_ServeyQuestions].[AnsTag17] END,
     CASE @orderBy WHEN 'AnsTag17 DESC' THEN [HRM_ServeyQuestions].[AnsTag17] END DESC,
     CASE @orderBy WHEN 'AnsTag18' THEN [HRM_ServeyQuestions].[AnsTag18] END,
     CASE @orderBy WHEN 'AnsTag18 DESC' THEN [HRM_ServeyQuestions].[AnsTag18] END DESC,
     CASE @orderBy WHEN 'AnsTag19' THEN [HRM_ServeyQuestions].[AnsTag19] END,
     CASE @orderBy WHEN 'AnsTag19 DESC' THEN [HRM_ServeyQuestions].[AnsTag19] END DESC,
     CASE @orderBy WHEN 'AnsTag20' THEN [HRM_ServeyQuestions].[AnsTag20] END,
     CASE @orderBy WHEN 'AnsTag20 DESC' THEN [HRM_ServeyQuestions].[AnsTag20] END DESC,
     CASE @orderBy WHEN 'AnsTag21' THEN [HRM_ServeyQuestions].[AnsTag21] END,
     CASE @orderBy WHEN 'AnsTag21 DESC' THEN [HRM_ServeyQuestions].[AnsTag21] END DESC,
     CASE @orderBy WHEN 'AnsTag22' THEN [HRM_ServeyQuestions].[AnsTag22] END,
     CASE @orderBy WHEN 'AnsTag22 DESC' THEN [HRM_ServeyQuestions].[AnsTag22] END DESC,
     CASE @orderBy WHEN 'AnsTag23' THEN [HRM_ServeyQuestions].[AnsTag23] END,
     CASE @orderBy WHEN 'AnsTag23 DESC' THEN [HRM_ServeyQuestions].[AnsTag23] END DESC,
     CASE @orderBy WHEN 'AnsTag24' THEN [HRM_ServeyQuestions].[AnsTag24] END,
     CASE @orderBy WHEN 'AnsTag24 DESC' THEN [HRM_ServeyQuestions].[AnsTag24] END DESC,
     CASE @orderBy WHEN 'AnsTag25' THEN [HRM_ServeyQuestions].[AnsTag25] END,
     CASE @orderBy WHEN 'AnsTag25 DESC' THEN [HRM_ServeyQuestions].[AnsTag25] END DESC,
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
		[HRM_ServeyQuestions].[QuestionID],
		[HRM_ServeyQuestions].[Description],
		[HRM_ServeyQuestions].[ServeyID],
		[HRM_ServeyQuestions].[Demography],
		[HRM_ServeyQuestions].[UseCaption],
		[HRM_ServeyQuestions].[AnsTag1],
		[HRM_ServeyQuestions].[AnsTag2],
		[HRM_ServeyQuestions].[AnsTag3],
		[HRM_ServeyQuestions].[AnsTag4],
		[HRM_ServeyQuestions].[AnsTag5],
		[HRM_ServeyQuestions].[AnsTag6],
		[HRM_ServeyQuestions].[AnsTag7],
		[HRM_ServeyQuestions].[AnsTag8],
		[HRM_ServeyQuestions].[AnsTag9],
		[HRM_ServeyQuestions].[AnsTag10],
		[HRM_ServeyQuestions].[AnsTag11],
		[HRM_ServeyQuestions].[AnsTag12],
		[HRM_ServeyQuestions].[AnsTag13],
		[HRM_ServeyQuestions].[AnsTag14],
		[HRM_ServeyQuestions].[AnsTag15],
		[HRM_ServeyQuestions].[AnsTag16],
		[HRM_ServeyQuestions].[AnsTag17],
		[HRM_ServeyQuestions].[AnsTag18],
		[HRM_ServeyQuestions].[AnsTag19],
		[HRM_ServeyQuestions].[AnsTag20],
		[HRM_ServeyQuestions].[AnsTag21],
		[HRM_ServeyQuestions].[AnsTag22],
		[HRM_ServeyQuestions].[AnsTag23],
		[HRM_ServeyQuestions].[AnsTag24],
		[HRM_ServeyQuestions].[AnsTag25],
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
  FROM [HRM_ServeyQuestions] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeyQuestions].[QuestionID] = #PageIndex.QuestionID
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyQuestions].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
