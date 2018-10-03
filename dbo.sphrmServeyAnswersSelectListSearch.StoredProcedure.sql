USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyAnswersSelectListSearch]
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
  AnswerID Int NOT NULL
  )
  INSERT INTO #PageIndex (AnswerID)
  SELECT [HRM_ServeyAnswers].[AnswerID] FROM [HRM_ServeyAnswers]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyAnswers].[ServeyID] = [HRM_Serveys1].[ServeyID]
  INNER JOIN [HRM_ServeySheets] AS [HRM_ServeySheets2]
    ON [HRM_ServeyAnswers].[ServeySheetID] = [HRM_ServeySheets2].[ServeySheetID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions3]
    ON [HRM_ServeyAnswers].[QuestionID] = [HRM_ServeyQuestions3].[QuestionID]
 WHERE  
   ( 
         STR(ISNULL([HRM_ServeyAnswers].[AnswerID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyAnswers].[ServeyID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyAnswers].[ServeySheetID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyAnswers].[QuestionID], 0)) LIKE @KeyWord1
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
     OR STR(ISNULL([HRM_ServeySheets2].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeySheets2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyQuestions3].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag10],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag11],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag12],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag13],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag14],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag15],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag16],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag17],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag18],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag19],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag20],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag21],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag22],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag23],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag24],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions3].[AnsTag25],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'AnswerID' THEN [HRM_ServeyAnswers].[AnswerID] END,
     CASE @orderBy WHEN 'AnswerID DESC' THEN [HRM_ServeyAnswers].[AnswerID] END DESC,
     CASE @orderBy WHEN 'ServeyID' THEN [HRM_ServeyAnswers].[ServeyID] END,
     CASE @orderBy WHEN 'ServeyID DESC' THEN [HRM_ServeyAnswers].[ServeyID] END DESC,
     CASE @orderBy WHEN 'ServeySheetID' THEN [HRM_ServeyAnswers].[ServeySheetID] END,
     CASE @orderBy WHEN 'ServeySheetID DESC' THEN [HRM_ServeyAnswers].[ServeySheetID] END DESC,
     CASE @orderBy WHEN 'QuestionID' THEN [HRM_ServeyAnswers].[QuestionID] END,
     CASE @orderBy WHEN 'QuestionID DESC' THEN [HRM_ServeyAnswers].[QuestionID] END DESC,
     CASE @orderBy WHEN 'Answer1' THEN [HRM_ServeyAnswers].[Answer1] END,
     CASE @orderBy WHEN 'Answer1 DESC' THEN [HRM_ServeyAnswers].[Answer1] END DESC,
     CASE @orderBy WHEN 'Answer2' THEN [HRM_ServeyAnswers].[Answer2] END,
     CASE @orderBy WHEN 'Answer2 DESC' THEN [HRM_ServeyAnswers].[Answer2] END DESC,
     CASE @orderBy WHEN 'Answer3' THEN [HRM_ServeyAnswers].[Answer3] END,
     CASE @orderBy WHEN 'Answer3 DESC' THEN [HRM_ServeyAnswers].[Answer3] END DESC,
     CASE @orderBy WHEN 'Answer4' THEN [HRM_ServeyAnswers].[Answer4] END,
     CASE @orderBy WHEN 'Answer4 DESC' THEN [HRM_ServeyAnswers].[Answer4] END DESC,
     CASE @orderBy WHEN 'Answer5' THEN [HRM_ServeyAnswers].[Answer5] END,
     CASE @orderBy WHEN 'Answer5 DESC' THEN [HRM_ServeyAnswers].[Answer5] END DESC,
     CASE @orderBy WHEN 'Answer6' THEN [HRM_ServeyAnswers].[Answer6] END,
     CASE @orderBy WHEN 'Answer6 DESC' THEN [HRM_ServeyAnswers].[Answer6] END DESC,
     CASE @orderBy WHEN 'Answer7' THEN [HRM_ServeyAnswers].[Answer7] END,
     CASE @orderBy WHEN 'Answer7 DESC' THEN [HRM_ServeyAnswers].[Answer7] END DESC,
     CASE @orderBy WHEN 'Answer8' THEN [HRM_ServeyAnswers].[Answer8] END,
     CASE @orderBy WHEN 'Answer8 DESC' THEN [HRM_ServeyAnswers].[Answer8] END DESC,
     CASE @orderBy WHEN 'Answer9' THEN [HRM_ServeyAnswers].[Answer9] END,
     CASE @orderBy WHEN 'Answer9 DESC' THEN [HRM_ServeyAnswers].[Answer9] END DESC,
     CASE @orderBy WHEN 'Answer10' THEN [HRM_ServeyAnswers].[Answer10] END,
     CASE @orderBy WHEN 'Answer10 DESC' THEN [HRM_ServeyAnswers].[Answer10] END DESC,
     CASE @orderBy WHEN 'Answer11' THEN [HRM_ServeyAnswers].[Answer11] END,
     CASE @orderBy WHEN 'Answer11 DESC' THEN [HRM_ServeyAnswers].[Answer11] END DESC,
     CASE @orderBy WHEN 'Answer12' THEN [HRM_ServeyAnswers].[Answer12] END,
     CASE @orderBy WHEN 'Answer12 DESC' THEN [HRM_ServeyAnswers].[Answer12] END DESC,
     CASE @orderBy WHEN 'Answer13' THEN [HRM_ServeyAnswers].[Answer13] END,
     CASE @orderBy WHEN 'Answer13 DESC' THEN [HRM_ServeyAnswers].[Answer13] END DESC,
     CASE @orderBy WHEN 'Answer14' THEN [HRM_ServeyAnswers].[Answer14] END,
     CASE @orderBy WHEN 'Answer14 DESC' THEN [HRM_ServeyAnswers].[Answer14] END DESC,
     CASE @orderBy WHEN 'Answer15' THEN [HRM_ServeyAnswers].[Answer15] END,
     CASE @orderBy WHEN 'Answer15 DESC' THEN [HRM_ServeyAnswers].[Answer15] END DESC,
     CASE @orderBy WHEN 'Answer16' THEN [HRM_ServeyAnswers].[Answer16] END,
     CASE @orderBy WHEN 'Answer16 DESC' THEN [HRM_ServeyAnswers].[Answer16] END DESC,
     CASE @orderBy WHEN 'Answer17' THEN [HRM_ServeyAnswers].[Answer17] END,
     CASE @orderBy WHEN 'Answer17 DESC' THEN [HRM_ServeyAnswers].[Answer17] END DESC,
     CASE @orderBy WHEN 'Answer18' THEN [HRM_ServeyAnswers].[Answer18] END,
     CASE @orderBy WHEN 'Answer18 DESC' THEN [HRM_ServeyAnswers].[Answer18] END DESC,
     CASE @orderBy WHEN 'Answer19' THEN [HRM_ServeyAnswers].[Answer19] END,
     CASE @orderBy WHEN 'Answer19 DESC' THEN [HRM_ServeyAnswers].[Answer19] END DESC,
     CASE @orderBy WHEN 'Answer20' THEN [HRM_ServeyAnswers].[Answer20] END,
     CASE @orderBy WHEN 'Answer20 DESC' THEN [HRM_ServeyAnswers].[Answer20] END DESC,
     CASE @orderBy WHEN 'Answer21' THEN [HRM_ServeyAnswers].[Answer21] END,
     CASE @orderBy WHEN 'Answer21 DESC' THEN [HRM_ServeyAnswers].[Answer21] END DESC,
     CASE @orderBy WHEN 'Answer22' THEN [HRM_ServeyAnswers].[Answer22] END,
     CASE @orderBy WHEN 'Answer22 DESC' THEN [HRM_ServeyAnswers].[Answer22] END DESC,
     CASE @orderBy WHEN 'Answer23' THEN [HRM_ServeyAnswers].[Answer23] END,
     CASE @orderBy WHEN 'Answer23 DESC' THEN [HRM_ServeyAnswers].[Answer23] END DESC,
     CASE @orderBy WHEN 'Answer24' THEN [HRM_ServeyAnswers].[Answer24] END,
     CASE @orderBy WHEN 'Answer24 DESC' THEN [HRM_ServeyAnswers].[Answer24] END DESC,
     CASE @orderBy WHEN 'Answer25' THEN [HRM_ServeyAnswers].[Answer25] END,
     CASE @orderBy WHEN 'Answer25 DESC' THEN [HRM_ServeyAnswers].[Answer25] END DESC,
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
     CASE @orderBy WHEN 'HRM_Serveys1_AnsTag10 DESC' THEN [HRM_Serveys1].[AnsTag10] END DESC,
     CASE @orderBy WHEN 'HRM_ServeySheets2_ServeyID' THEN [HRM_ServeySheets2].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_ServeySheets2_ServeyID DESC' THEN [HRM_ServeySheets2].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeySheets2_ServeySheetID' THEN [HRM_ServeySheets2].[ServeySheetID] END,
     CASE @orderBy WHEN 'HRM_ServeySheets2_ServeySheetID DESC' THEN [HRM_ServeySheets2].[ServeySheetID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeySheets2_Description' THEN [HRM_ServeySheets2].[Description] END,
     CASE @orderBy WHEN 'HRM_ServeySheets2_Description DESC' THEN [HRM_ServeySheets2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_ServeySheets2_CreatedOn' THEN [HRM_ServeySheets2].[CreatedOn] END,
     CASE @orderBy WHEN 'HRM_ServeySheets2_CreatedOn DESC' THEN [HRM_ServeySheets2].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_QuestionID' THEN [HRM_ServeyQuestions3].[QuestionID] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_QuestionID DESC' THEN [HRM_ServeyQuestions3].[QuestionID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_Description' THEN [HRM_ServeyQuestions3].[Description] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_Description DESC' THEN [HRM_ServeyQuestions3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_ServeyID' THEN [HRM_ServeyQuestions3].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_ServeyID DESC' THEN [HRM_ServeyQuestions3].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_Demography' THEN [HRM_ServeyQuestions3].[Demography] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_Demography DESC' THEN [HRM_ServeyQuestions3].[Demography] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_UseCaption' THEN [HRM_ServeyQuestions3].[UseCaption] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_UseCaption DESC' THEN [HRM_ServeyQuestions3].[UseCaption] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag1' THEN [HRM_ServeyQuestions3].[AnsTag1] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag1 DESC' THEN [HRM_ServeyQuestions3].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag2' THEN [HRM_ServeyQuestions3].[AnsTag2] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag2 DESC' THEN [HRM_ServeyQuestions3].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag3' THEN [HRM_ServeyQuestions3].[AnsTag3] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag3 DESC' THEN [HRM_ServeyQuestions3].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag4' THEN [HRM_ServeyQuestions3].[AnsTag4] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag4 DESC' THEN [HRM_ServeyQuestions3].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag5' THEN [HRM_ServeyQuestions3].[AnsTag5] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag5 DESC' THEN [HRM_ServeyQuestions3].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag6' THEN [HRM_ServeyQuestions3].[AnsTag6] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag6 DESC' THEN [HRM_ServeyQuestions3].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag7' THEN [HRM_ServeyQuestions3].[AnsTag7] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag7 DESC' THEN [HRM_ServeyQuestions3].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag8' THEN [HRM_ServeyQuestions3].[AnsTag8] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag8 DESC' THEN [HRM_ServeyQuestions3].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag9' THEN [HRM_ServeyQuestions3].[AnsTag9] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag9 DESC' THEN [HRM_ServeyQuestions3].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag10' THEN [HRM_ServeyQuestions3].[AnsTag10] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag10 DESC' THEN [HRM_ServeyQuestions3].[AnsTag10] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag11' THEN [HRM_ServeyQuestions3].[AnsTag11] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag11 DESC' THEN [HRM_ServeyQuestions3].[AnsTag11] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag12' THEN [HRM_ServeyQuestions3].[AnsTag12] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag12 DESC' THEN [HRM_ServeyQuestions3].[AnsTag12] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag13' THEN [HRM_ServeyQuestions3].[AnsTag13] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag13 DESC' THEN [HRM_ServeyQuestions3].[AnsTag13] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag14' THEN [HRM_ServeyQuestions3].[AnsTag14] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag14 DESC' THEN [HRM_ServeyQuestions3].[AnsTag14] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag15' THEN [HRM_ServeyQuestions3].[AnsTag15] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag15 DESC' THEN [HRM_ServeyQuestions3].[AnsTag15] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag16' THEN [HRM_ServeyQuestions3].[AnsTag16] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag16 DESC' THEN [HRM_ServeyQuestions3].[AnsTag16] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag17' THEN [HRM_ServeyQuestions3].[AnsTag17] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag17 DESC' THEN [HRM_ServeyQuestions3].[AnsTag17] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag18' THEN [HRM_ServeyQuestions3].[AnsTag18] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag18 DESC' THEN [HRM_ServeyQuestions3].[AnsTag18] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag19' THEN [HRM_ServeyQuestions3].[AnsTag19] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag19 DESC' THEN [HRM_ServeyQuestions3].[AnsTag19] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag20' THEN [HRM_ServeyQuestions3].[AnsTag20] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag20 DESC' THEN [HRM_ServeyQuestions3].[AnsTag20] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag21' THEN [HRM_ServeyQuestions3].[AnsTag21] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag21 DESC' THEN [HRM_ServeyQuestions3].[AnsTag21] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag22' THEN [HRM_ServeyQuestions3].[AnsTag22] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag22 DESC' THEN [HRM_ServeyQuestions3].[AnsTag22] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag23' THEN [HRM_ServeyQuestions3].[AnsTag23] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag23 DESC' THEN [HRM_ServeyQuestions3].[AnsTag23] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag24' THEN [HRM_ServeyQuestions3].[AnsTag24] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag24 DESC' THEN [HRM_ServeyQuestions3].[AnsTag24] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag25' THEN [HRM_ServeyQuestions3].[AnsTag25] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions3_AnsTag25 DESC' THEN [HRM_ServeyQuestions3].[AnsTag25] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeyAnswers].[AnswerID],
		[HRM_ServeyAnswers].[ServeyID],
		[HRM_ServeyAnswers].[ServeySheetID],
		[HRM_ServeyAnswers].[QuestionID],
		[HRM_ServeyAnswers].[Answer1],
		[HRM_ServeyAnswers].[Answer2],
		[HRM_ServeyAnswers].[Answer3],
		[HRM_ServeyAnswers].[Answer4],
		[HRM_ServeyAnswers].[Answer5],
		[HRM_ServeyAnswers].[Answer6],
		[HRM_ServeyAnswers].[Answer7],
		[HRM_ServeyAnswers].[Answer8],
		[HRM_ServeyAnswers].[Answer9],
		[HRM_ServeyAnswers].[Answer10],
		[HRM_ServeyAnswers].[Answer11],
		[HRM_ServeyAnswers].[Answer12],
		[HRM_ServeyAnswers].[Answer13],
		[HRM_ServeyAnswers].[Answer14],
		[HRM_ServeyAnswers].[Answer15],
		[HRM_ServeyAnswers].[Answer16],
		[HRM_ServeyAnswers].[Answer17],
		[HRM_ServeyAnswers].[Answer18],
		[HRM_ServeyAnswers].[Answer19],
		[HRM_ServeyAnswers].[Answer20],
		[HRM_ServeyAnswers].[Answer21],
		[HRM_ServeyAnswers].[Answer22],
		[HRM_ServeyAnswers].[Answer23],
		[HRM_ServeyAnswers].[Answer24],
		[HRM_ServeyAnswers].[Answer25],
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
		[HRM_Serveys1].[AnsTag10] AS HRM_Serveys1_AnsTag10,
		[HRM_ServeySheets2].[ServeyID] AS HRM_ServeySheets2_ServeyID,
		[HRM_ServeySheets2].[ServeySheetID] AS HRM_ServeySheets2_ServeySheetID,
		[HRM_ServeySheets2].[Description] AS HRM_ServeySheets2_Description,
		[HRM_ServeySheets2].[CreatedOn] AS HRM_ServeySheets2_CreatedOn,
		[HRM_ServeyQuestions3].[QuestionID] AS HRM_ServeyQuestions3_QuestionID,
		[HRM_ServeyQuestions3].[Description] AS HRM_ServeyQuestions3_Description,
		[HRM_ServeyQuestions3].[ServeyID] AS HRM_ServeyQuestions3_ServeyID,
		[HRM_ServeyQuestions3].[Demography] AS HRM_ServeyQuestions3_Demography,
		[HRM_ServeyQuestions3].[UseCaption] AS HRM_ServeyQuestions3_UseCaption,
		[HRM_ServeyQuestions3].[AnsTag1] AS HRM_ServeyQuestions3_AnsTag1,
		[HRM_ServeyQuestions3].[AnsTag2] AS HRM_ServeyQuestions3_AnsTag2,
		[HRM_ServeyQuestions3].[AnsTag3] AS HRM_ServeyQuestions3_AnsTag3,
		[HRM_ServeyQuestions3].[AnsTag4] AS HRM_ServeyQuestions3_AnsTag4,
		[HRM_ServeyQuestions3].[AnsTag5] AS HRM_ServeyQuestions3_AnsTag5,
		[HRM_ServeyQuestions3].[AnsTag6] AS HRM_ServeyQuestions3_AnsTag6,
		[HRM_ServeyQuestions3].[AnsTag7] AS HRM_ServeyQuestions3_AnsTag7,
		[HRM_ServeyQuestions3].[AnsTag8] AS HRM_ServeyQuestions3_AnsTag8,
		[HRM_ServeyQuestions3].[AnsTag9] AS HRM_ServeyQuestions3_AnsTag9,
		[HRM_ServeyQuestions3].[AnsTag10] AS HRM_ServeyQuestions3_AnsTag10,
		[HRM_ServeyQuestions3].[AnsTag11] AS HRM_ServeyQuestions3_AnsTag11,
		[HRM_ServeyQuestions3].[AnsTag12] AS HRM_ServeyQuestions3_AnsTag12,
		[HRM_ServeyQuestions3].[AnsTag13] AS HRM_ServeyQuestions3_AnsTag13,
		[HRM_ServeyQuestions3].[AnsTag14] AS HRM_ServeyQuestions3_AnsTag14,
		[HRM_ServeyQuestions3].[AnsTag15] AS HRM_ServeyQuestions3_AnsTag15,
		[HRM_ServeyQuestions3].[AnsTag16] AS HRM_ServeyQuestions3_AnsTag16,
		[HRM_ServeyQuestions3].[AnsTag17] AS HRM_ServeyQuestions3_AnsTag17,
		[HRM_ServeyQuestions3].[AnsTag18] AS HRM_ServeyQuestions3_AnsTag18,
		[HRM_ServeyQuestions3].[AnsTag19] AS HRM_ServeyQuestions3_AnsTag19,
		[HRM_ServeyQuestions3].[AnsTag20] AS HRM_ServeyQuestions3_AnsTag20,
		[HRM_ServeyQuestions3].[AnsTag21] AS HRM_ServeyQuestions3_AnsTag21,
		[HRM_ServeyQuestions3].[AnsTag22] AS HRM_ServeyQuestions3_AnsTag22,
		[HRM_ServeyQuestions3].[AnsTag23] AS HRM_ServeyQuestions3_AnsTag23,
		[HRM_ServeyQuestions3].[AnsTag24] AS HRM_ServeyQuestions3_AnsTag24,
		[HRM_ServeyQuestions3].[AnsTag25] AS HRM_ServeyQuestions3_AnsTag25 
  FROM [HRM_ServeyAnswers] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeyAnswers].[AnswerID] = #PageIndex.AnswerID
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyAnswers].[ServeyID] = [HRM_Serveys1].[ServeyID]
  INNER JOIN [HRM_ServeySheets] AS [HRM_ServeySheets2]
    ON [HRM_ServeyAnswers].[ServeySheetID] = [HRM_ServeySheets2].[ServeySheetID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions3]
    ON [HRM_ServeyAnswers].[QuestionID] = [HRM_ServeyQuestions3].[QuestionID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO