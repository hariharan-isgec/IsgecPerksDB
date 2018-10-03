USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyAnswersSelectListFilteres]
  @Filter_ServeyID Int,
  @Filter_ServeySheetID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  AnswerID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (AnswerID) ' + 
               'SELECT [HRM_ServeyAnswers].[AnswerID] FROM [HRM_ServeyAnswers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyAnswers].[ServeyID] = [HRM_Serveys1].[ServeyID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_ServeySheets] AS [HRM_ServeySheets2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyAnswers].[ServeySheetID] = [HRM_ServeySheets2].[ServeySheetID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyAnswers].[QuestionID] = [HRM_ServeyQuestions3].[QuestionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ServeyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeyAnswers].[ServeyID] = ' + STR(@Filter_ServeyID)
  IF (@Filter_ServeySheetID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeyAnswers].[ServeySheetID] = ' + STR(@Filter_ServeySheetID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AnswerID' THEN '[HRM_ServeyAnswers].[AnswerID]'
                        WHEN 'AnswerID DESC' THEN '[HRM_ServeyAnswers].[AnswerID] DESC'
                        WHEN 'ServeyID' THEN '[HRM_ServeyAnswers].[ServeyID]'
                        WHEN 'ServeyID DESC' THEN '[HRM_ServeyAnswers].[ServeyID] DESC'
                        WHEN 'ServeySheetID' THEN '[HRM_ServeyAnswers].[ServeySheetID]'
                        WHEN 'ServeySheetID DESC' THEN '[HRM_ServeyAnswers].[ServeySheetID] DESC'
                        WHEN 'QuestionID' THEN '[HRM_ServeyAnswers].[QuestionID]'
                        WHEN 'QuestionID DESC' THEN '[HRM_ServeyAnswers].[QuestionID] DESC'
                        WHEN 'Answer1' THEN '[HRM_ServeyAnswers].[Answer1]'
                        WHEN 'Answer1 DESC' THEN '[HRM_ServeyAnswers].[Answer1] DESC'
                        WHEN 'Answer2' THEN '[HRM_ServeyAnswers].[Answer2]'
                        WHEN 'Answer2 DESC' THEN '[HRM_ServeyAnswers].[Answer2] DESC'
                        WHEN 'Answer3' THEN '[HRM_ServeyAnswers].[Answer3]'
                        WHEN 'Answer3 DESC' THEN '[HRM_ServeyAnswers].[Answer3] DESC'
                        WHEN 'Answer4' THEN '[HRM_ServeyAnswers].[Answer4]'
                        WHEN 'Answer4 DESC' THEN '[HRM_ServeyAnswers].[Answer4] DESC'
                        WHEN 'Answer5' THEN '[HRM_ServeyAnswers].[Answer5]'
                        WHEN 'Answer5 DESC' THEN '[HRM_ServeyAnswers].[Answer5] DESC'
                        WHEN 'Answer6' THEN '[HRM_ServeyAnswers].[Answer6]'
                        WHEN 'Answer6 DESC' THEN '[HRM_ServeyAnswers].[Answer6] DESC'
                        WHEN 'Answer7' THEN '[HRM_ServeyAnswers].[Answer7]'
                        WHEN 'Answer7 DESC' THEN '[HRM_ServeyAnswers].[Answer7] DESC'
                        WHEN 'Answer8' THEN '[HRM_ServeyAnswers].[Answer8]'
                        WHEN 'Answer8 DESC' THEN '[HRM_ServeyAnswers].[Answer8] DESC'
                        WHEN 'Answer9' THEN '[HRM_ServeyAnswers].[Answer9]'
                        WHEN 'Answer9 DESC' THEN '[HRM_ServeyAnswers].[Answer9] DESC'
                        WHEN 'Answer10' THEN '[HRM_ServeyAnswers].[Answer10]'
                        WHEN 'Answer10 DESC' THEN '[HRM_ServeyAnswers].[Answer10] DESC'
                        WHEN 'Answer11' THEN '[HRM_ServeyAnswers].[Answer11]'
                        WHEN 'Answer11 DESC' THEN '[HRM_ServeyAnswers].[Answer11] DESC'
                        WHEN 'Answer12' THEN '[HRM_ServeyAnswers].[Answer12]'
                        WHEN 'Answer12 DESC' THEN '[HRM_ServeyAnswers].[Answer12] DESC'
                        WHEN 'Answer13' THEN '[HRM_ServeyAnswers].[Answer13]'
                        WHEN 'Answer13 DESC' THEN '[HRM_ServeyAnswers].[Answer13] DESC'
                        WHEN 'Answer14' THEN '[HRM_ServeyAnswers].[Answer14]'
                        WHEN 'Answer14 DESC' THEN '[HRM_ServeyAnswers].[Answer14] DESC'
                        WHEN 'Answer15' THEN '[HRM_ServeyAnswers].[Answer15]'
                        WHEN 'Answer15 DESC' THEN '[HRM_ServeyAnswers].[Answer15] DESC'
                        WHEN 'Answer16' THEN '[HRM_ServeyAnswers].[Answer16]'
                        WHEN 'Answer16 DESC' THEN '[HRM_ServeyAnswers].[Answer16] DESC'
                        WHEN 'Answer17' THEN '[HRM_ServeyAnswers].[Answer17]'
                        WHEN 'Answer17 DESC' THEN '[HRM_ServeyAnswers].[Answer17] DESC'
                        WHEN 'Answer18' THEN '[HRM_ServeyAnswers].[Answer18]'
                        WHEN 'Answer18 DESC' THEN '[HRM_ServeyAnswers].[Answer18] DESC'
                        WHEN 'Answer19' THEN '[HRM_ServeyAnswers].[Answer19]'
                        WHEN 'Answer19 DESC' THEN '[HRM_ServeyAnswers].[Answer19] DESC'
                        WHEN 'Answer20' THEN '[HRM_ServeyAnswers].[Answer20]'
                        WHEN 'Answer20 DESC' THEN '[HRM_ServeyAnswers].[Answer20] DESC'
                        WHEN 'Answer21' THEN '[HRM_ServeyAnswers].[Answer21]'
                        WHEN 'Answer21 DESC' THEN '[HRM_ServeyAnswers].[Answer21] DESC'
                        WHEN 'Answer22' THEN '[HRM_ServeyAnswers].[Answer22]'
                        WHEN 'Answer22 DESC' THEN '[HRM_ServeyAnswers].[Answer22] DESC'
                        WHEN 'Answer23' THEN '[HRM_ServeyAnswers].[Answer23]'
                        WHEN 'Answer23 DESC' THEN '[HRM_ServeyAnswers].[Answer23] DESC'
                        WHEN 'Answer24' THEN '[HRM_ServeyAnswers].[Answer24]'
                        WHEN 'Answer24 DESC' THEN '[HRM_ServeyAnswers].[Answer24] DESC'
                        WHEN 'Answer25' THEN '[HRM_ServeyAnswers].[Answer25]'
                        WHEN 'Answer25 DESC' THEN '[HRM_ServeyAnswers].[Answer25] DESC'
                        WHEN 'HRM_Serveys1_ServeyID' THEN '[HRM_Serveys1].[ServeyID]'
                        WHEN 'HRM_Serveys1_ServeyID DESC' THEN '[HRM_Serveys1].[ServeyID] DESC'
                        WHEN 'HRM_Serveys1_Description' THEN '[HRM_Serveys1].[Description]'
                        WHEN 'HRM_Serveys1_Description DESC' THEN '[HRM_Serveys1].[Description] DESC'
                        WHEN 'HRM_Serveys1_AnsTag1' THEN '[HRM_Serveys1].[AnsTag1]'
                        WHEN 'HRM_Serveys1_AnsTag1 DESC' THEN '[HRM_Serveys1].[AnsTag1] DESC'
                        WHEN 'HRM_Serveys1_AnsTag2' THEN '[HRM_Serveys1].[AnsTag2]'
                        WHEN 'HRM_Serveys1_AnsTag2 DESC' THEN '[HRM_Serveys1].[AnsTag2] DESC'
                        WHEN 'HRM_Serveys1_AnsTag3' THEN '[HRM_Serveys1].[AnsTag3]'
                        WHEN 'HRM_Serveys1_AnsTag3 DESC' THEN '[HRM_Serveys1].[AnsTag3] DESC'
                        WHEN 'HRM_Serveys1_AnsTag4' THEN '[HRM_Serveys1].[AnsTag4]'
                        WHEN 'HRM_Serveys1_AnsTag4 DESC' THEN '[HRM_Serveys1].[AnsTag4] DESC'
                        WHEN 'HRM_Serveys1_AnsTag5' THEN '[HRM_Serveys1].[AnsTag5]'
                        WHEN 'HRM_Serveys1_AnsTag5 DESC' THEN '[HRM_Serveys1].[AnsTag5] DESC'
                        WHEN 'HRM_Serveys1_AnsTag6' THEN '[HRM_Serveys1].[AnsTag6]'
                        WHEN 'HRM_Serveys1_AnsTag6 DESC' THEN '[HRM_Serveys1].[AnsTag6] DESC'
                        WHEN 'HRM_Serveys1_AnsTag7' THEN '[HRM_Serveys1].[AnsTag7]'
                        WHEN 'HRM_Serveys1_AnsTag7 DESC' THEN '[HRM_Serveys1].[AnsTag7] DESC'
                        WHEN 'HRM_Serveys1_AnsTag8' THEN '[HRM_Serveys1].[AnsTag8]'
                        WHEN 'HRM_Serveys1_AnsTag8 DESC' THEN '[HRM_Serveys1].[AnsTag8] DESC'
                        WHEN 'HRM_Serveys1_AnsTag9' THEN '[HRM_Serveys1].[AnsTag9]'
                        WHEN 'HRM_Serveys1_AnsTag9 DESC' THEN '[HRM_Serveys1].[AnsTag9] DESC'
                        WHEN 'HRM_Serveys1_AnsTag10' THEN '[HRM_Serveys1].[AnsTag10]'
                        WHEN 'HRM_Serveys1_AnsTag10 DESC' THEN '[HRM_Serveys1].[AnsTag10] DESC'
                        WHEN 'HRM_ServeySheets2_ServeyID' THEN '[HRM_ServeySheets2].[ServeyID]'
                        WHEN 'HRM_ServeySheets2_ServeyID DESC' THEN '[HRM_ServeySheets2].[ServeyID] DESC'
                        WHEN 'HRM_ServeySheets2_ServeySheetID' THEN '[HRM_ServeySheets2].[ServeySheetID]'
                        WHEN 'HRM_ServeySheets2_ServeySheetID DESC' THEN '[HRM_ServeySheets2].[ServeySheetID] DESC'
                        WHEN 'HRM_ServeySheets2_Description' THEN '[HRM_ServeySheets2].[Description]'
                        WHEN 'HRM_ServeySheets2_Description DESC' THEN '[HRM_ServeySheets2].[Description] DESC'
                        WHEN 'HRM_ServeySheets2_CreatedOn' THEN '[HRM_ServeySheets2].[CreatedOn]'
                        WHEN 'HRM_ServeySheets2_CreatedOn DESC' THEN '[HRM_ServeySheets2].[CreatedOn] DESC'
                        WHEN 'HRM_ServeyQuestions3_QuestionID' THEN '[HRM_ServeyQuestions3].[QuestionID]'
                        WHEN 'HRM_ServeyQuestions3_QuestionID DESC' THEN '[HRM_ServeyQuestions3].[QuestionID] DESC'
                        WHEN 'HRM_ServeyQuestions3_Description' THEN '[HRM_ServeyQuestions3].[Description]'
                        WHEN 'HRM_ServeyQuestions3_Description DESC' THEN '[HRM_ServeyQuestions3].[Description] DESC'
                        WHEN 'HRM_ServeyQuestions3_ServeyID' THEN '[HRM_ServeyQuestions3].[ServeyID]'
                        WHEN 'HRM_ServeyQuestions3_ServeyID DESC' THEN '[HRM_ServeyQuestions3].[ServeyID] DESC'
                        WHEN 'HRM_ServeyQuestions3_Demography' THEN '[HRM_ServeyQuestions3].[Demography]'
                        WHEN 'HRM_ServeyQuestions3_Demography DESC' THEN '[HRM_ServeyQuestions3].[Demography] DESC'
                        WHEN 'HRM_ServeyQuestions3_UseCaption' THEN '[HRM_ServeyQuestions3].[UseCaption]'
                        WHEN 'HRM_ServeyQuestions3_UseCaption DESC' THEN '[HRM_ServeyQuestions3].[UseCaption] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag1' THEN '[HRM_ServeyQuestions3].[AnsTag1]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag1 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag1] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag2' THEN '[HRM_ServeyQuestions3].[AnsTag2]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag2 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag2] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag3' THEN '[HRM_ServeyQuestions3].[AnsTag3]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag3 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag3] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag4' THEN '[HRM_ServeyQuestions3].[AnsTag4]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag4 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag4] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag5' THEN '[HRM_ServeyQuestions3].[AnsTag5]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag5 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag5] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag6' THEN '[HRM_ServeyQuestions3].[AnsTag6]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag6 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag6] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag7' THEN '[HRM_ServeyQuestions3].[AnsTag7]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag7 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag7] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag8' THEN '[HRM_ServeyQuestions3].[AnsTag8]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag8 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag8] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag9' THEN '[HRM_ServeyQuestions3].[AnsTag9]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag9 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag9] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag10' THEN '[HRM_ServeyQuestions3].[AnsTag10]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag10 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag10] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag11' THEN '[HRM_ServeyQuestions3].[AnsTag11]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag11 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag11] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag12' THEN '[HRM_ServeyQuestions3].[AnsTag12]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag12 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag12] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag13' THEN '[HRM_ServeyQuestions3].[AnsTag13]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag13 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag13] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag14' THEN '[HRM_ServeyQuestions3].[AnsTag14]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag14 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag14] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag15' THEN '[HRM_ServeyQuestions3].[AnsTag15]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag15 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag15] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag16' THEN '[HRM_ServeyQuestions3].[AnsTag16]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag16 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag16] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag17' THEN '[HRM_ServeyQuestions3].[AnsTag17]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag17 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag17] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag18' THEN '[HRM_ServeyQuestions3].[AnsTag18]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag18 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag18] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag19' THEN '[HRM_ServeyQuestions3].[AnsTag19]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag19 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag19] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag20' THEN '[HRM_ServeyQuestions3].[AnsTag20]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag20 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag20] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag21' THEN '[HRM_ServeyQuestions3].[AnsTag21]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag21 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag21] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag22' THEN '[HRM_ServeyQuestions3].[AnsTag22]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag22 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag22] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag23' THEN '[HRM_ServeyQuestions3].[AnsTag23]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag23 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag23] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag24' THEN '[HRM_ServeyQuestions3].[AnsTag24]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag24 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag24] DESC'
                        WHEN 'HRM_ServeyQuestions3_AnsTag25' THEN '[HRM_ServeyQuestions3].[AnsTag25]'
                        WHEN 'HRM_ServeyQuestions3_AnsTag25 DESC' THEN '[HRM_ServeyQuestions3].[AnsTag25] DESC'
                        ELSE '[HRM_ServeyAnswers].[AnswerID]'
                    END
  EXEC (@LGSQL)

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
