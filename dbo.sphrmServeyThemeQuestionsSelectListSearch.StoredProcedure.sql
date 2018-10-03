USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsSelectListSearch]
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
  SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [HRM_ServeyThemeQuestions].[SerialNo] FROM [HRM_ServeyThemeQuestions]
  INNER JOIN [HRM_ServeyThemes] AS [HRM_ServeyThemes1]
    ON [HRM_ServeyThemeQuestions].[ThemeID] = [HRM_ServeyThemes1].[ThemeID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions2]
    ON [HRM_ServeyThemeQuestions].[QuestionID] = [HRM_ServeyQuestions2].[QuestionID]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys3]
    ON [HRM_ServeyThemeQuestions].[ServeyID] = [HRM_Serveys3].[ServeyID]
 WHERE  
   ( 
         STR(ISNULL([HRM_ServeyThemeQuestions].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyThemeQuestions].[ThemeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyThemeQuestions].[QuestionID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyThemeQuestions].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyThemes1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyThemes1].[Details],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyThemes1].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_ServeyQuestions2].[ServeyID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag10],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag11],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag12],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag13],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag14],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag15],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag16],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag17],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag18],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag19],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag20],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag21],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag22],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag23],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag24],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_ServeyQuestions2].[AnsTag25],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag5],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag6],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag7],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag8],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag9],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Serveys3].[AnsTag10],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'SerialNo' THEN [HRM_ServeyThemeQuestions].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [HRM_ServeyThemeQuestions].[SerialNo] END DESC,
     CASE @orderBy WHEN 'ThemeID' THEN [HRM_ServeyThemeQuestions].[ThemeID] END,
     CASE @orderBy WHEN 'ThemeID DESC' THEN [HRM_ServeyThemeQuestions].[ThemeID] END DESC,
     CASE @orderBy WHEN 'QuestionID' THEN [HRM_ServeyThemeQuestions].[QuestionID] END,
     CASE @orderBy WHEN 'QuestionID DESC' THEN [HRM_ServeyThemeQuestions].[QuestionID] END DESC,
     CASE @orderBy WHEN 'ServeyID' THEN [HRM_ServeyThemeQuestions].[ServeyID] END,
     CASE @orderBy WHEN 'ServeyID DESC' THEN [HRM_ServeyThemeQuestions].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_ThemeID' THEN [HRM_ServeyThemes1].[ThemeID] END,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_ThemeID DESC' THEN [HRM_ServeyThemes1].[ThemeID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_Description' THEN [HRM_ServeyThemes1].[Description] END,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_Description DESC' THEN [HRM_ServeyThemes1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_Details' THEN [HRM_ServeyThemes1].[Details] END,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_Details DESC' THEN [HRM_ServeyThemes1].[Details] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_ServeyID' THEN [HRM_ServeyThemes1].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_ServeyThemes1_ServeyID DESC' THEN [HRM_ServeyThemes1].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_QuestionID' THEN [HRM_ServeyQuestions2].[QuestionID] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_QuestionID DESC' THEN [HRM_ServeyQuestions2].[QuestionID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_Description' THEN [HRM_ServeyQuestions2].[Description] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_Description DESC' THEN [HRM_ServeyQuestions2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_ServeyID' THEN [HRM_ServeyQuestions2].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_ServeyID DESC' THEN [HRM_ServeyQuestions2].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_Demography' THEN [HRM_ServeyQuestions2].[Demography] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_Demography DESC' THEN [HRM_ServeyQuestions2].[Demography] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_UseCaption' THEN [HRM_ServeyQuestions2].[UseCaption] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_UseCaption DESC' THEN [HRM_ServeyQuestions2].[UseCaption] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag1' THEN [HRM_ServeyQuestions2].[AnsTag1] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag1 DESC' THEN [HRM_ServeyQuestions2].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag2' THEN [HRM_ServeyQuestions2].[AnsTag2] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag2 DESC' THEN [HRM_ServeyQuestions2].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag3' THEN [HRM_ServeyQuestions2].[AnsTag3] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag3 DESC' THEN [HRM_ServeyQuestions2].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag4' THEN [HRM_ServeyQuestions2].[AnsTag4] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag4 DESC' THEN [HRM_ServeyQuestions2].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag5' THEN [HRM_ServeyQuestions2].[AnsTag5] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag5 DESC' THEN [HRM_ServeyQuestions2].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag6' THEN [HRM_ServeyQuestions2].[AnsTag6] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag6 DESC' THEN [HRM_ServeyQuestions2].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag7' THEN [HRM_ServeyQuestions2].[AnsTag7] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag7 DESC' THEN [HRM_ServeyQuestions2].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag8' THEN [HRM_ServeyQuestions2].[AnsTag8] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag8 DESC' THEN [HRM_ServeyQuestions2].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag9' THEN [HRM_ServeyQuestions2].[AnsTag9] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag9 DESC' THEN [HRM_ServeyQuestions2].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag10' THEN [HRM_ServeyQuestions2].[AnsTag10] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag10 DESC' THEN [HRM_ServeyQuestions2].[AnsTag10] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag11' THEN [HRM_ServeyQuestions2].[AnsTag11] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag11 DESC' THEN [HRM_ServeyQuestions2].[AnsTag11] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag12' THEN [HRM_ServeyQuestions2].[AnsTag12] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag12 DESC' THEN [HRM_ServeyQuestions2].[AnsTag12] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag13' THEN [HRM_ServeyQuestions2].[AnsTag13] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag13 DESC' THEN [HRM_ServeyQuestions2].[AnsTag13] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag14' THEN [HRM_ServeyQuestions2].[AnsTag14] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag14 DESC' THEN [HRM_ServeyQuestions2].[AnsTag14] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag15' THEN [HRM_ServeyQuestions2].[AnsTag15] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag15 DESC' THEN [HRM_ServeyQuestions2].[AnsTag15] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag16' THEN [HRM_ServeyQuestions2].[AnsTag16] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag16 DESC' THEN [HRM_ServeyQuestions2].[AnsTag16] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag17' THEN [HRM_ServeyQuestions2].[AnsTag17] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag17 DESC' THEN [HRM_ServeyQuestions2].[AnsTag17] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag18' THEN [HRM_ServeyQuestions2].[AnsTag18] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag18 DESC' THEN [HRM_ServeyQuestions2].[AnsTag18] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag19' THEN [HRM_ServeyQuestions2].[AnsTag19] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag19 DESC' THEN [HRM_ServeyQuestions2].[AnsTag19] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag20' THEN [HRM_ServeyQuestions2].[AnsTag20] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag20 DESC' THEN [HRM_ServeyQuestions2].[AnsTag20] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag21' THEN [HRM_ServeyQuestions2].[AnsTag21] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag21 DESC' THEN [HRM_ServeyQuestions2].[AnsTag21] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag22' THEN [HRM_ServeyQuestions2].[AnsTag22] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag22 DESC' THEN [HRM_ServeyQuestions2].[AnsTag22] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag23' THEN [HRM_ServeyQuestions2].[AnsTag23] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag23 DESC' THEN [HRM_ServeyQuestions2].[AnsTag23] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag24' THEN [HRM_ServeyQuestions2].[AnsTag24] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag24 DESC' THEN [HRM_ServeyQuestions2].[AnsTag24] END DESC,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag25' THEN [HRM_ServeyQuestions2].[AnsTag25] END,
     CASE @orderBy WHEN 'HRM_ServeyQuestions2_AnsTag25 DESC' THEN [HRM_ServeyQuestions2].[AnsTag25] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_ServeyID' THEN [HRM_Serveys3].[ServeyID] END,
     CASE @orderBy WHEN 'HRM_Serveys3_ServeyID DESC' THEN [HRM_Serveys3].[ServeyID] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_Description' THEN [HRM_Serveys3].[Description] END,
     CASE @orderBy WHEN 'HRM_Serveys3_Description DESC' THEN [HRM_Serveys3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag1' THEN [HRM_Serveys3].[AnsTag1] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag1 DESC' THEN [HRM_Serveys3].[AnsTag1] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag2' THEN [HRM_Serveys3].[AnsTag2] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag2 DESC' THEN [HRM_Serveys3].[AnsTag2] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag3' THEN [HRM_Serveys3].[AnsTag3] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag3 DESC' THEN [HRM_Serveys3].[AnsTag3] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag4' THEN [HRM_Serveys3].[AnsTag4] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag4 DESC' THEN [HRM_Serveys3].[AnsTag4] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag5' THEN [HRM_Serveys3].[AnsTag5] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag5 DESC' THEN [HRM_Serveys3].[AnsTag5] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag6' THEN [HRM_Serveys3].[AnsTag6] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag6 DESC' THEN [HRM_Serveys3].[AnsTag6] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag7' THEN [HRM_Serveys3].[AnsTag7] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag7 DESC' THEN [HRM_Serveys3].[AnsTag7] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag8' THEN [HRM_Serveys3].[AnsTag8] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag8 DESC' THEN [HRM_Serveys3].[AnsTag8] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag9' THEN [HRM_Serveys3].[AnsTag9] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag9 DESC' THEN [HRM_Serveys3].[AnsTag9] END DESC,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag10' THEN [HRM_Serveys3].[AnsTag10] END,
     CASE @orderBy WHEN 'HRM_Serveys3_AnsTag10 DESC' THEN [HRM_Serveys3].[AnsTag10] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeyThemeQuestions].[SerialNo],
		[HRM_ServeyThemeQuestions].[ThemeID],
		[HRM_ServeyThemeQuestions].[QuestionID],
		[HRM_ServeyThemeQuestions].[ServeyID],
		[HRM_ServeyThemes1].[ThemeID] AS HRM_ServeyThemes1_ThemeID,
		[HRM_ServeyThemes1].[Description] AS HRM_ServeyThemes1_Description,
		[HRM_ServeyThemes1].[Details] AS HRM_ServeyThemes1_Details,
		[HRM_ServeyThemes1].[ServeyID] AS HRM_ServeyThemes1_ServeyID,
		[HRM_ServeyQuestions2].[QuestionID] AS HRM_ServeyQuestions2_QuestionID,
		[HRM_ServeyQuestions2].[Description] AS HRM_ServeyQuestions2_Description,
		[HRM_ServeyQuestions2].[ServeyID] AS HRM_ServeyQuestions2_ServeyID,
		[HRM_ServeyQuestions2].[Demography] AS HRM_ServeyQuestions2_Demography,
		[HRM_ServeyQuestions2].[UseCaption] AS HRM_ServeyQuestions2_UseCaption,
		[HRM_ServeyQuestions2].[AnsTag1] AS HRM_ServeyQuestions2_AnsTag1,
		[HRM_ServeyQuestions2].[AnsTag2] AS HRM_ServeyQuestions2_AnsTag2,
		[HRM_ServeyQuestions2].[AnsTag3] AS HRM_ServeyQuestions2_AnsTag3,
		[HRM_ServeyQuestions2].[AnsTag4] AS HRM_ServeyQuestions2_AnsTag4,
		[HRM_ServeyQuestions2].[AnsTag5] AS HRM_ServeyQuestions2_AnsTag5,
		[HRM_ServeyQuestions2].[AnsTag6] AS HRM_ServeyQuestions2_AnsTag6,
		[HRM_ServeyQuestions2].[AnsTag7] AS HRM_ServeyQuestions2_AnsTag7,
		[HRM_ServeyQuestions2].[AnsTag8] AS HRM_ServeyQuestions2_AnsTag8,
		[HRM_ServeyQuestions2].[AnsTag9] AS HRM_ServeyQuestions2_AnsTag9,
		[HRM_ServeyQuestions2].[AnsTag10] AS HRM_ServeyQuestions2_AnsTag10,
		[HRM_ServeyQuestions2].[AnsTag11] AS HRM_ServeyQuestions2_AnsTag11,
		[HRM_ServeyQuestions2].[AnsTag12] AS HRM_ServeyQuestions2_AnsTag12,
		[HRM_ServeyQuestions2].[AnsTag13] AS HRM_ServeyQuestions2_AnsTag13,
		[HRM_ServeyQuestions2].[AnsTag14] AS HRM_ServeyQuestions2_AnsTag14,
		[HRM_ServeyQuestions2].[AnsTag15] AS HRM_ServeyQuestions2_AnsTag15,
		[HRM_ServeyQuestions2].[AnsTag16] AS HRM_ServeyQuestions2_AnsTag16,
		[HRM_ServeyQuestions2].[AnsTag17] AS HRM_ServeyQuestions2_AnsTag17,
		[HRM_ServeyQuestions2].[AnsTag18] AS HRM_ServeyQuestions2_AnsTag18,
		[HRM_ServeyQuestions2].[AnsTag19] AS HRM_ServeyQuestions2_AnsTag19,
		[HRM_ServeyQuestions2].[AnsTag20] AS HRM_ServeyQuestions2_AnsTag20,
		[HRM_ServeyQuestions2].[AnsTag21] AS HRM_ServeyQuestions2_AnsTag21,
		[HRM_ServeyQuestions2].[AnsTag22] AS HRM_ServeyQuestions2_AnsTag22,
		[HRM_ServeyQuestions2].[AnsTag23] AS HRM_ServeyQuestions2_AnsTag23,
		[HRM_ServeyQuestions2].[AnsTag24] AS HRM_ServeyQuestions2_AnsTag24,
		[HRM_ServeyQuestions2].[AnsTag25] AS HRM_ServeyQuestions2_AnsTag25,
		[HRM_Serveys3].[ServeyID] AS HRM_Serveys3_ServeyID,
		[HRM_Serveys3].[Description] AS HRM_Serveys3_Description,
		[HRM_Serveys3].[AnsTag1] AS HRM_Serveys3_AnsTag1,
		[HRM_Serveys3].[AnsTag2] AS HRM_Serveys3_AnsTag2,
		[HRM_Serveys3].[AnsTag3] AS HRM_Serveys3_AnsTag3,
		[HRM_Serveys3].[AnsTag4] AS HRM_Serveys3_AnsTag4,
		[HRM_Serveys3].[AnsTag5] AS HRM_Serveys3_AnsTag5,
		[HRM_Serveys3].[AnsTag6] AS HRM_Serveys3_AnsTag6,
		[HRM_Serveys3].[AnsTag7] AS HRM_Serveys3_AnsTag7,
		[HRM_Serveys3].[AnsTag8] AS HRM_Serveys3_AnsTag8,
		[HRM_Serveys3].[AnsTag9] AS HRM_Serveys3_AnsTag9,
		[HRM_Serveys3].[AnsTag10] AS HRM_Serveys3_AnsTag10 
  FROM [HRM_ServeyThemeQuestions] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeyThemeQuestions].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [HRM_ServeyThemes] AS [HRM_ServeyThemes1]
    ON [HRM_ServeyThemeQuestions].[ThemeID] = [HRM_ServeyThemes1].[ThemeID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions2]
    ON [HRM_ServeyThemeQuestions].[QuestionID] = [HRM_ServeyQuestions2].[QuestionID]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys3]
    ON [HRM_ServeyThemeQuestions].[ServeyID] = [HRM_Serveys3].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO